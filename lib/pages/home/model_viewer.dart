import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threed_viewer/components/web_view_loader.dart';
import 'package:threed_viewer/utils/strings.dart';

import '../../providers/providers.dart';

class ModelViewer extends ConsumerWidget {
  const ModelViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: kDebugMode,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllow: "camera; microphone",
      iframeAllowFullscreen: true,
    );

    return Stack(
      children: [
        InAppWebView(
          initialSettings: settings,
          initialUrlRequest: URLRequest(
            url: WebUri(
                '${AppStrings.localhostUrl}/assets/html/three_js_demo/index1.html'),
          ),
          onConsoleMessage: (controller, consoleMessage) {
            print('Webview console message : $consoleMessage');
          },
          onWebViewCreated: (controller) async {
            ref.read(webViewControllerProvider.notifier).state = controller;
            injectJsChannels(ref);
            print(controller.platform);
            print('onWebViewCreated ${controller.getUrl()}');
          },
          onPermissionRequest: (controller, request) async {
            return PermissionResponse(
              resources: request.resources,
              action: PermissionResponseAction.GRANT,
            );
          },
        ),
        if (ref.watch(errorValueProvider) != null ||
            ref.watch(loadingValueProvider))
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: ref.watch(errorValueProvider) != null
                ? errorWidget(ref.watch(errorValueProvider)!)
                : const WebViewLoader(),
          ),
      ],
    );
  }

  Widget errorWidget(String error) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void injectJsChannels(WidgetRef ref) {
    final webviewControllerState =
        ref.read(webViewControllerProvider.notifier).state;

    webviewControllerState!.addJavaScriptHandler(
      handlerName: 'showLoader',
      callback: (jsMessage) {
        ref.read(loadingValueProvider.notifier).state = true;
      },
    );

    webviewControllerState.addJavaScriptHandler(
      handlerName: 'hideLoader',
      callback: (jsMessage) {
        ref.read(loadingValueProvider.notifier).state = false;
      },
    );

    webviewControllerState.addJavaScriptHandler(
      handlerName: 'setError',
      callback: (jsMessage) {
        ref.read(errorValueProvider.notifier).state = jsMessage[0];
      },
    );
  }
}

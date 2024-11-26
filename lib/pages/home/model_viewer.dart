import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
            print(controller.platform);
          },
          onLoadStart: (controller, url) {
            print(url);
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
                : loadingWidget(),
          ),
      ],
    );
  }

  Widget loadingWidget() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blueGrey[200]!.withOpacity(0.98),
            Colors.blueGrey[400]!.withOpacity(0.98),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: CircularProgressIndicator(
                color: Colors.blueGrey[300],
                backgroundColor: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            const Flexible(
              child: Text(
                'Loading 3D Model',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
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
}

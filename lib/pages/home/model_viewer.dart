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

    return InAppWebView(
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
    );
  }
}

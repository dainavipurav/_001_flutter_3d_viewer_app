import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:threed_viewer/utils/strings.dart';

class ModelViewer extends StatefulWidget {
  const ModelViewer({super.key});

  @override
  State<ModelViewer> createState() => _ModelViewerState();
}

class _ModelViewerState extends State<ModelViewer> {
  @override
  Widget build(BuildContext context) {
    InAppWebViewController? webViewController;

    late InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: kDebugMode,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllow: "camera; microphone",
      iframeAllowFullscreen: true,
    );

    @override
    void initState() {
      super.initState();
    }

    return Center(
      child: InAppWebView(
        initialSettings: settings,
        initialUrlRequest: URLRequest(
          // url: WebUri('https://www.youtube.com'),
          // url:
          //     WebUri('${AppStrings.localhostUrl}/assets/html/hello_world.html'),
          url: WebUri(
              '${AppStrings.localhostUrl}/assets/html/three_js_demo/index1.html'),
        ),
        onConsoleMessage: (controller, consoleMessage) {
          print(consoleMessage);
        },
        onWebViewCreated: (controller) async {
          webViewController = controller;
          print(webViewController!.platform);
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
    );
  }
}

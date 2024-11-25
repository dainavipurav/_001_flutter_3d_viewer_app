import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:threed_viewer/threed_app.dart';

final localhostServer = InAppLocalhostServer();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    localhostServer.start();
  }

  runApp(const ThreedApp());
}

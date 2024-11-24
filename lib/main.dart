import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:threed_viewer/threed_app.dart';

final localhostServer = InAppLocalhostServer();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    localhostServer.start();
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThreedApp();
  }
}

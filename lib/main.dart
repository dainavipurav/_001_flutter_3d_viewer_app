import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:threed_viewer/threed_app.dart';

final localhostServer = InAppLocalhostServer();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    localhostServer.start();
  }

  runApp(const ThreedApp());
}

Future<String> saveFileToAppDirectory(String sourceFilePath) async {
  final tempDir = await getApplicationDocumentsDirectory();
  final file = File(sourceFilePath);
  final fileName = file.uri.pathSegments.last;
  final destinationPath = "${tempDir.path}/$fileName";
  final resultPath =
      await file.copy(destinationPath).then((copiedFile) => copiedFile.path);
  print('Result : $resultPath');
  return resultPath;
}

String fileToBase64Conversion(File file) {
  final bytes = File(file.path).readAsBytesSync();
  String base64EncodeFile = base64Encode(bytes);
  return base64EncodeFile;
}

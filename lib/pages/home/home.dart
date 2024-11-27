import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threed_viewer/components/desktop_menu_bar.dart';
import 'package:threed_viewer/core/file_operation.dart';
import 'package:threed_viewer/pages/home/model_viewer.dart';
import 'package:threed_viewer/providers/providers.dart';

class Home extends ConsumerWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DesktopMenuBar(
      onImport: () => importFile(ref),
      body: const Scaffold(
        backgroundColor: Colors.transparent,
        body: ModelViewer(),
      ),
    );
  }

  void importFile(WidgetRef ref) async {
    List<File>? result = await FileOperation.pickFilesFromDevice();

    if (result.isEmpty) {
      return;
    }
    ref.read(loadingValueProvider.notifier).state = true;
    File file = File(result[0].path);

    ref.read(filePathStateProvider.notifier).state = file.path;
    // Read the file as bytes
    Uint8List byteArray = await file.readAsBytes();

    final jsByteArray =
        byteArray.toList(); // Convert Uint8List to List for JS compatibility

    // if (ref.read(webViewControllerProvider.notifier).state != null) return;
    ref.read(webViewControllerProvider.notifier).state!.evaluateJavascript(
          source:
              "loadFileFromDevice(new Uint8Array(${jsByteArray.toString()}));",
        );
  }
}

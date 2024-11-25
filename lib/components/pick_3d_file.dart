import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threed_viewer/core/file_operation.dart';
import 'package:threed_viewer/providers/providers.dart';

// Define a provider for MediaService
final mediaServiceProvider = NotifierProvider<MediaService, File?>(
  MediaService.new,
);

class MediaService extends Notifier<File?> {
  @override
  File? build() {
    return null; // Initially, no file is selected
  }

  /// Picks a single file and updates the state with the selected file.
  Future<bool> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          // type: FileType.custom,
          // allowedExtensions: ['obj', 'stl', 'glb', 'mtl'],
          );

      if (result == null) return false;
      if (result.files.single.path == null) return false;

      final filePath = result.files.single.path;

      // Extract file extension
      final extension = filePath?.split('.').last.toLowerCase();

      // Check if extension is allowed
      // if (['obj', 'stl', 'glb', 'mtl'].contains(extension)) {
      //   print('Selected File: $filePath');
      // } else {
      //   print('Error: Unsupported file type');
      // }

      state = File(result.files.single.path!);

      List byteArray = result.files[0].bytes ?? [];

      final jsByteArray =
          byteArray.toList(); // Convert Uint8List to List for JS compatibility

      // if (ref.read(webViewControllerProvider.notifier).state != null) return;
      ref.read(webViewControllerProvider.notifier).state!.evaluateJavascript(
        source: """
            loadFileFromDevice(new Uint8Array(${jsByteArray.toString()}));
          """,
      );

      // List<File>? result = await FileOperation.pickFilesFromDevice();

      // if (result.isEmpty) {
      //   return;
      // }
      // File file = File(result[0].path);

      // ref.read(filePathStateProvider.notifier).state = file.path;
      // // Read the file as bytes
      // Uint8List byteArray = await file.readAsBytes();

      // final jsByteArray =
      //     byteArray.toList(); // Convert Uint8List to List for JS compatibility

      // // if (ref.read(webViewControllerProvider.notifier).state != null) return;
      // ref.read(webViewControllerProvider.notifier).state!.evaluateJavascript(
      //   source: """
      //         loadFileFromDevice(new Uint8Array(${jsByteArray.toString()}));
      //       """,
      // );
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Clears the selected file.
  void clearFile() {
    state = null;
  }
}

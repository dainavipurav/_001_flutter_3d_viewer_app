import 'dart:io';

import 'package:flutter/services.dart';
import 'package:threed_viewer/core/file_operation.dart';

class FileRepository {
  Future<List<int>> importFileInByteArray() async {
    List<File>? result = await FileOperation.pickFilesFromDevice();

    if (result.isEmpty) {
      return [];
    }
    File file = File(result[0].path);

    // Read the file as bytes
    Uint8List byteArray = await file.readAsBytes();

    final jsByteArray =
        byteArray.toList(); // Convert Uint8List to List for JS compatibility

    return jsByteArray;
  }
}

import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FileOperation {
  static Future<List<File>> pickFilesFromDevice() async {
    List<File> files = [];
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File file = File(result.files.single.path!);

        files.add(file);
      }
    } catch (e) {
      print('Error occurred');
    }
    return files;
  }
}

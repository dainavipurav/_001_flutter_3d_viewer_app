import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu_bar/menu_bar.dart';
import 'package:threed_viewer/pages/home/model_viewer.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Map<String, dynamic>> data = [
    {
      "menu_name": "File",
      "submenus": [
        {
          "menu_name": "Import (.obj, .stl, .gbl)",
          "icon": "import",
          "action": "IMPORT_FILE",
          "shhortcut_text": "Ctrl + I",
          "logical_keyboard_key": "I",
          "control": true,
          "shift": false,
          "alt": false,
          "meta": false
        },
        {
          "menu_name": "Save",
          "icon": "save",
          "action": "SAVE_FILE",
          "shhortcut_text": "Ctrl + S",
          "logical_keyboard_key": "S",
          "control": true,
          "shift": false,
          "alt": false,
          "meta": false
        },
        {
          "menu_name": "Export",
          "icon": "export",
          "action": "EXPORT_FILE",
          "shhortcut_text": "Ctrl + E",
          "logical_keyboard_key": "E",
          "control": true,
          "shift": false,
          "alt": false,
          "meta": false
        }
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    List<BarButton> barButtons = getBarButtons();

    return MenuBarWidget(
      barButtons: barButtons,
      barStyle: const MenuStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
        backgroundColor: WidgetStatePropertyAll(Colors.red),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('3D Module Viewer'),
        ),
        body: const Center(
          child: ModelViewer(),
        ),
      ),
    );
  }

  List<BarButton> getBarButtons() {
    return [
      BarButton(
        text: Text('File'),
        submenu: SubMenu(
          menuItems: [
            MenuButton(
              text: const Text(
                'Import (.obj, .stl, .gbl)',
              ),
              icon: const Icon(Icons.import_export),
              onTap: () {
                importFile();
              },
              shortcutText: 'Ctrl + I',
              shortcut: const SingleActivator(
                LogicalKeyboardKey.keyI,
                control: true,
              ),
            ),
            MenuButton(
              text: const Text(
                'Save',
              ),
              icon: const Icon(Icons.save),
              onTap: () {
                print('OnTap Save');
              },
              shortcutText: 'Ctrl + S',
              shortcut: const SingleActivator(
                LogicalKeyboardKey.keyS,
                control: true,
              ),
            ),
            MenuButton(
              text: const Text(
                'Export',
              ),
              icon: const Icon(Icons.download),
              onTap: () {
                print('OnTap Export');
              },
              shortcutText: 'Ctrl + D',
              shortcut: const SingleActivator(
                LogicalKeyboardKey.keyD,
                control: true,
              ),
            ),
          ],
        ),
      ),
    ];
  }

  void importFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      print('file Data : ${file.path}');
    } else {
      // User canceled the picker
    }
  }
}

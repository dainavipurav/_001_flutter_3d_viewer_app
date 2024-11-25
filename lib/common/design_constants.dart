import 'package:flutter/material.dart';

abstract class DesignContants {
  static MenuStyle menuStyle = const MenuStyle(
    padding: WidgetStatePropertyAll(EdgeInsets.zero),
    backgroundColor: WidgetStatePropertyAll(Color(0xFF2b2b2b)),
    maximumSize: WidgetStatePropertyAll(Size(double.infinity, 36)),
  );

  static ButtonStyle barButtonStyle = const ButtonStyle(
    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 6.0)),
    minimumSize: WidgetStatePropertyAll(Size(0.0, 32.0)),
    overlayColor: WidgetStatePropertyAll(Colors.grey),
  );

  static ButtonStyle menuButtonStyle = const ButtonStyle(
    minimumSize: WidgetStatePropertyAll(Size.fromHeight(36.0)),
    padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0)),
    iconSize: WidgetStatePropertyAll(18),
    overlayColor: WidgetStatePropertyAll(Colors.blue),
  );
}

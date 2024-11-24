import 'package:flutter/material.dart';
import 'package:threed_viewer/pages/home/home.dart';

class ThreedApp extends StatelessWidget {
  const ThreedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

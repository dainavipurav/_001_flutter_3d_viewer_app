import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threed_viewer/pages/home/home.dart';
import 'package:threed_viewer/utils/logger.dart';

class ThreedApp extends StatelessWidget {
  const ThreedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [Logger()],
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

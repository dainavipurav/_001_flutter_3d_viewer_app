import 'package:flutter/material.dart';
import 'package:threed_viewer/pages/home/model_viewer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3D Module Viewer'),
      ),
      body: const Center(
        child: ModelViewer(),
      ),
    );
  }
}

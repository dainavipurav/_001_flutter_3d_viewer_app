import 'package:flutter/material.dart';

class WebViewLoader extends StatelessWidget {
  const WebViewLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey[200]!.withOpacity(0.98),
            Colors.grey[400]!.withOpacity(0.98),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: CircularProgressIndicator(
                color: Colors.blueGrey[300],
                backgroundColor: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            const Flexible(
              child: Text(
                'Loading 3D Model',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

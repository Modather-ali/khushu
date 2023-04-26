import 'package:flutter/material.dart';

import 'screens.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('خشوع'),
      ),
      body: Stack(
        children: const [
          // AzkarScreen(),
          AzanTimesScreen(),
        ],
      ),
    );
  }
}

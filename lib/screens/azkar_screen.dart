import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اذكار'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          ZekerCard(),
        ],
      ),
    );
  }
}

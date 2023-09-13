import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import '../../widgets/widgets.dart';

class QiblaScreen extends StatelessWidget {
  QiblaScreen({super.key});
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إتجاه القبله'),
      ),
      body: FutureBuilder(
        future: _deviceSupport,
        builder: (_, AsyncSnapshot<bool?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error.toString()}"),
            );
          }

          if (snapshot.hasData) {
            log(snapshot.data!.toString());
            return const QiblaCompass();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

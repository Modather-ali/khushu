import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'res/res.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'خشوع',
      locale: const Locale('ar'),
      theme: lightTheme,
      home: const MainScreen(),
      builder: EasyLoading.init(),
    );
  }
}

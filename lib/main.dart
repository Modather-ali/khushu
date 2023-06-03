import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'res/res.dart';
import 'screens/screens.dart';
import 'services/shared_preferences_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesData().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'خشوع',
      locale: const Locale('ar'),
      theme: lightTheme,
      home: const MainScreen(),
      builder: EasyLoading.init(),
    );
  }
}

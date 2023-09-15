import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'res/app_theme.dart';
import 'screens/bottom_bavigation.dart';
import 'services/shared_preferences_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _sharedPreferencesData = SharedPreferencesData();
  @override
  void initState() {
    _sharedPreferencesData.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'خشوع',
      locale: const Locale('ar'),
      theme: lightTheme,
      home: const BottomNavigation(),
    );
  }
}

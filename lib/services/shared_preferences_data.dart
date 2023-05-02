import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesData {
  late SharedPreferences sharedPreferences;
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}

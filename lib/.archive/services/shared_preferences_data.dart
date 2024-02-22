import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesData {
  late SharedPreferences sharedPreferences;
  int sebhaCounter = 0;
  bool isInit = false;
  Future init() async {
    if (!isInit) {
      sharedPreferences = await SharedPreferences.getInstance();
      sebhaCounter = sharedPreferences.getInt('sebha_counter') ?? 0;
      isInit = true;
    }
  }

  increaseSebhaCounter(int counter) async {
    await init();
    sebhaCounter = counter;
    sharedPreferences.setInt('sebha_counter', counter);
  }
}

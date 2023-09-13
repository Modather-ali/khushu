import 'dart:developer';

import 'package:khushu/modules/zekr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesData {
  late SharedPreferences sharedPreferences;
  List savedAzkar = [];
  int sebhaCounter = 0;
  bool isInit = false;
  Future init() async {
    if (!isInit) {
      sharedPreferences = await SharedPreferences.getInstance();
      String azkarString = sharedPreferences.getString('saved_azkar') ?? '';
      sebhaCounter = sharedPreferences.getInt('sebha_counter') ?? 0;
      savedAzkar = azkarString.split('');
      isInit = true;
    }
  }

  saveZekr(Zekr zekr) async {
    await init();
    savedAzkar.add(zekr.zekr);
    log(savedAzkar.toString());
    await sharedPreferences.setString('saved_azkar', savedAzkar.join());
  }

  increaseSebhaCounter(int counter) async {
    await init();
    sebhaCounter = counter;
    sharedPreferences.setInt('sebha_counter', counter);
  }
}

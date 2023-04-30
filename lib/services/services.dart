import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Services {
  Future<List> loadAzkarData() async {
    String data = await rootBundle.loadString('assets/json/azkar.json');
    final jsonResult = json.decode(data);
    // print(jsonResult);
    return jsonResult["rows"];
  }
}

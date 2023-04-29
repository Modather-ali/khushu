import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<void> loadData() async {
  String data = await rootBundle.loadString('assets/json/azkar.json');
  final jsonResult = json.decode(data);
  print(jsonResult);
}

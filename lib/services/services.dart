import 'dart:developer';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Services {
  Future<List> loadAzkarData() async {
    String data = await rootBundle.loadString('assets/json/azkar.json');
    final jsonResult = json.decode(data);
    // print(jsonResult);
    return jsonResult["rows"];
  }

  getPrayerTimes() async {
    Uri uri = Uri.parse('http://www.islamicfinder.us/index.php/api/');
    Response response =
        await http.get(uri, headers: {"user_ip": "197.252.201.127"});
    var data = json.decode(response.body);
    log(data);
    log(response.statusCode.toString());
  }
}

import 'dart:developer';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;

class Services {
  Future<List> loadAzkarData() async {
    String data = await rootBundle.loadString('assets/json/azkar.json');
    final jsonResult = json.decode(data);
    // print(jsonResult);
    return jsonResult["rows"];
  }

  Future<List<Map<String, String>>> getPrayerTimes() async {
    List<Map<String, String>> prayerTimes = [];
    List<Map<String, String>> allTimes = [];
    final Map prayers = {
      'Fajr': 'الفجر',
      'Sunrise': 'الشروق',
      'Dhuhr': 'الظهر',
      'Asr': 'العصر',
      'Maghrib': 'المغرب',
      'Isha': 'العشاء',
    };
    try {
      Map timings = {};
      Position position = await _determinePosition();

      Uri uri = Uri.parse(
          'http://api.aladhan.com/v1/calendar/2023/5?longitude=${position.longitude}&latitude=${position.latitude}');
      Response response = await http.get(uri);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        prayerTimes.clear();
        var data = json.decode(response.body);
        timings = data['data'][0]['timings'];
        timings.forEach((key, value) {
          log(key + '-' + value.toString().split('(')[0]);
          if (prayers.containsKey(key)) {
            prayerTimes.add({
              'pray': prayers[key],
              'time': value.toString().split('(')[0],
            });
          }
        });
      }
    } catch (e) {
      log('Error in getPrayerTimes : $e');
    }
    return prayerTimes;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Get.snackbar(
      //   '',
      //   'يرجي تفعيل خدمات الموقع الجغرافي',
      //   backgroundColor: Colors.orange,
      //   colorText: Colors.white,
      //   duration: const Duration(seconds: 5),
      // );
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return Future.error('Location services are disabled.');
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}

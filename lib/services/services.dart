import 'dart:developer';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// ignore: depend_on_referenced_packages
import 'package:geolocator/geolocator.dart';

class Services {
  bool isPrayerTimerLoaded = false;
  Future<List<Map<String, String>>> getPrayerTimes() async {
    List<Map<String, String>> prayerTimes = [];
    final Map prayers = {
      'Fajr': 'الفجر',
      'Sunrise': 'الشروق',
      'Dhuhr': 'الظهر',
      'Asr': 'العصر',
      'Maghrib': 'المغرب',
      'Isha': 'العشاء',
    };
    try {
      if (!isPrayerTimerLoaded) {
        Map timings = {};
        Position position = await _determinePosition();

        Uri uri = Uri.parse(
            'http://api.aladhan.com/v1/calendar/2023/5?longitude=${position.longitude}&latitude=${position.latitude}');
        http.Response response = await http.get(uri);
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
        isPrayerTimerLoaded = true;
      }
    } catch (e) {
      log('Error in getPrayerTimes : $e');
    }
    return prayerTimes;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    await _checkLocationPermission();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(
        '',
        'يرجي تفعيل خدمة الموقع الجغرافي',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      serviceEnabled = await Geolocator.openLocationSettings();

      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    return await Geolocator.getCurrentPosition();
  }

  _checkLocationPermission() async {
    LocationPermission permission;
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
  }
}

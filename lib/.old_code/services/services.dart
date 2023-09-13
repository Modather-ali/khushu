import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:khushu/logger_utils.dart';
import 'package:khushu/packages.dart';

import 'location_services.dart';

class Services {
  final LocationServices _locationServices = LocationServices();
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
      Map timings = {};
      Position position = await _locationServices.determinePosition();
      Placemark? placemark = await _locationServices
          .getPlacemark(LatLng(position.latitude, position.longitude));
      Uri uri = Uri.parse(
          'http://api.aladhan.com/v1/timingsByCity?city=${placemark!.locality}&country=${placemark.country}&method=8'
          //'http://api.aladhan.com/v1/calendar/2023/9?longitude=${position.longitude}&latitude=${position.latitude}'
          );
      http.Response response = await http.get(uri);
      Logger.print('${response.statusCode}');
      if (response.statusCode == 200) {
        prayerTimes.clear();
        var data = json.decode(response.body);
        Logger.print('times:\n$data');
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
}

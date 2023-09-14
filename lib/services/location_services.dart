import 'package:flutter/material.dart';

import '../../../../packages.dart';
import '../utils/logger_utils.dart';

class LocationServices {
  Future<String?> getCurrentAddress() async {
    try {
      Position position = await determinePosition();
      LatLng latLng = LatLng(position.latitude, position.longitude);
      Placemark? placemark = await getPlacemark(latLng);
      String addressName =
          "${placemark!.name}, ${placemark.street}, ${placemark.administrativeArea}, ${placemark.locality}";

      return addressName;
    } catch (e) {
      Logger.print('getCurrentLocationName error :$e');
      return null;
    }
  }

  Future<Position> determinePosition() async {
    await _enableLocationService();
    await _checkLocationPermission();
    return await Geolocator.getCurrentPosition();
  }

  _enableLocationService() async {
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(
        'Alert'.tr,
        'Please activate the location service'.tr,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return Future.error('Location services are disabled.');
      }
    }
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

  Future<Placemark?> getPlacemark(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      Placemark placemark = placemarks[0];

      return placemark;
    } catch (e) {
      Logger.print('cant get location name:$e');

      return null;
    }
  }
}

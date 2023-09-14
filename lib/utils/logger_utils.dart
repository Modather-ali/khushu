import 'dart:developer';

import 'package:flutter/foundation.dart';

mixin Logger {
  // Sample of abstract logging function
  static void print(String msg) {
    if (kDebugMode) {
      log('^^^^^\n$msg\n^^^^^');
    }
  }
}

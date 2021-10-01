import 'package:flutter/foundation.dart';

class APIBase {
  static String get baseURL {
    if (kReleaseMode) {
      return "";
    } else {
      return "";
    }
  }

  static String get termsURL {
    if (kReleaseMode) {
      return "";
    } else {
      return "";
    }
  }
}

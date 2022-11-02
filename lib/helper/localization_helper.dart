import 'package:flutter/material.dart';

class LocalizationHelper {
  static String VN = 'vi';
  static String EN = 'en';

  static List<Locale> listLocale() => [
        Locale(VN),
        Locale(EN),
      ];
}

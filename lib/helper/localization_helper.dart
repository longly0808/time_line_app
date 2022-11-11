import 'package:flutter/material.dart';

class LocalizationHelper {
  static const String VN = 'vi';
  static const String EN = 'en';

  static List<Locale> listLocale() => [
        const Locale(VN),
        const Locale(EN),
      ];
}

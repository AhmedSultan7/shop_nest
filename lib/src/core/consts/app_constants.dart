import 'package:flutter/material.dart' show Locale, LocalizationsDelegate;

class AppConsts {
  static const String appName = 'Vendor App';
  static const int vendorId = 1;
  static const String appFont = 'ProductSans';
  static const Locale locale = Locale('en');

  static const List<Locale> supportedLocales = [
    locale,
    Locale('ar'),
  ];
}

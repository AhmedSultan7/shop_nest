import 'package:flutter/material.dart'
    show Locale, LocalizationsDelegate, MaterialLocalizations;
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../generated/l10n.dart';

class AppConsts {
  static const String appName = 'Vendor App';
  static const int vendorId = 1;
  static const String appFont = 'ProductSans';
  static const String currency = 'ر . سـ';
  static const Locale locale = Locale('ar');
  static const enLocale = Locale('en');

  static const List<Locale> supportedLocales = [
    locale,
  ];

  static const List<LocalizationsDelegate> localizationsDelegates = [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
}

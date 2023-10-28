// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `بحث`
  String get search {
    return Intl.message(
      'بحث',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `الأقسام`
  String get category {
    return Intl.message(
      'الأقسام',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `المتجات`
  String get products {
    return Intl.message(
      'المتجات',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `أقسام فرعية`
  String get subCategory {
    return Intl.message(
      'أقسام فرعية',
      name: 'subCategory',
      desc: '',
      args: [],
    );
  }

  /// `الصفحة الرئيسية`
  String get home {
    return Intl.message(
      'الصفحة الرئيسية',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `سلة المنتجات`
  String get cart {
    return Intl.message(
      'سلة المنتجات',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `الطلبات السابقة`
  String get history {
    return Intl.message(
      'الطلبات السابقة',
      name: 'history',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

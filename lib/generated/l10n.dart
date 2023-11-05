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

  /// `المنتجات`
  String get products {
    return Intl.message(
      'المنتجات',
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

  /// `إضافة إلي السلة`
  String get addToCart {
    return Intl.message(
      'إضافة إلي السلة',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `اشتري الآن`
  String get buyNow {
    return Intl.message(
      'اشتري الآن',
      name: 'buyNow',
      desc: '',
      args: [],
    );
  }

  /// `سياسة الخصوصية`
  String get policy {
    return Intl.message(
      'سياسة الخصوصية',
      name: 'policy',
      desc: '',
      args: [],
    );
  }

  /// `من نحن`
  String get aboutUs {
    return Intl.message(
      'من نحن',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `الشروط والأحكام`
  String get terms {
    return Intl.message(
      'الشروط والأحكام',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `الإعدادات`
  String get settings {
    return Intl.message(
      'الإعدادات',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `تواصل معنا`
  String get contactUs {
    return Intl.message(
      'تواصل معنا',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `السعر :`
  String get price {
    return Intl.message(
      'السعر :',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `عربة فارغة حاول إضافة بعض المنتجات`
  String get emptyCart {
    return Intl.message(
      'عربة فارغة حاول إضافة بعض المنتجات',
      name: 'emptyCart',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد طلبات سابقة`
  String get noHistory {
    return Intl.message(
      'لا يوجد طلبات سابقة',
      name: 'noHistory',
      desc: '',
      args: [],
    );
  }

  /// `الشروط و الأحكام`
  String get termsAndCondition {
    return Intl.message(
      'الشروط و الأحكام',
      name: 'termsAndCondition',
      desc: '',
      args: [],
    );
  }

  /// `من نحن`
  String get aboutUS {
    return Intl.message(
      'من نحن',
      name: 'aboutUS',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get login {
    return Intl.message(
      'تسجيل الدخول',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `أضافة منتج`
  String get addProduct {
    return Intl.message(
      'أضافة منتج',
      name: 'addProduct',
      desc: '',
      args: [],
    );
  }

  /// `انقر لإختيار صورة`
  String get clickToBrowse {
    return Intl.message(
      'انقر لإختيار صورة',
      name: 'clickToBrowse',
      desc: '',
      args: [],
    );
  }

  /// `الاسم`
  String get name {
    return Intl.message(
      'الاسم',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `الوصف`
  String get description {
    return Intl.message(
      'الوصف',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `إدخال`
  String get enter {
    return Intl.message(
      'إدخال',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `حقل مطلوب`
  String get requiredField {
    return Intl.message(
      'حقل مطلوب',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `أضافة`
  String get add {
    return Intl.message(
      'أضافة',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `تعديل`
  String get edit {
    return Intl.message(
      'تعديل',
      name: 'edit',
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

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

  /// `هل نسيت كلمة المرور`
  String get forgetPassword {
    return Intl.message(
      'هل نسيت كلمة المرور',
      name: 'forgetPassword',
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

  /// `البريد الإلكتروني`
  String get emailAddress {
    return Intl.message(
      'البريد الإلكتروني',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get password {
    return Intl.message(
      'كلمة المرور',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `ليس لديك حساب ؟`
  String get dontHaveAnAccount {
    return Intl.message(
      'ليس لديك حساب ؟',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `لديك حساب ؟`
  String get HaveAnAccount {
    return Intl.message(
      'لديك حساب ؟',
      name: 'HaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء حساب`
  String get signup {
    return Intl.message(
      'إنشاء حساب',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `نوع المستخدم`
  String get userType {
    return Intl.message(
      'نوع المستخدم',
      name: 'userType',
      desc: '',
      args: [],
    );
  }

  /// `بائع`
  String get seller {
    return Intl.message(
      'بائع',
      name: 'seller',
      desc: '',
      args: [],
    );
  }

  /// `مشتري`
  String get buyer {
    return Intl.message(
      'مشتري',
      name: 'buyer',
      desc: '',
      args: [],
    );
  }

  /// `يجب أن تحتوي كلمة المرور على 8 أحرف`
  String get passwordMustContain8Characters {
    return Intl.message(
      'يجب أن تحتوي كلمة المرور على 8 أحرف',
      name: 'passwordMustContain8Characters',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء إدخال البريد الإلكتروني الصحيح`
  String get pleaseEnterCorrectEmail {
    return Intl.message(
      'الرجاء إدخال البريد الإلكتروني الصحيح',
      name: 'pleaseEnterCorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء إدخال الأسم`
  String get pleaseEnterYourUserName {
    return Intl.message(
      'الرجاء إدخال الأسم',
      name: 'pleaseEnterYourUserName',
      desc: '',
      args: [],
    );
  }

  /// `يرجى التحقق من البريد الإلكتروني وكلمة المرور الخاصة بك`
  String get PleaseCheckYourEmailAndPassword {
    return Intl.message(
      'يرجى التحقق من البريد الإلكتروني وكلمة المرور الخاصة بك',
      name: 'PleaseCheckYourEmailAndPassword',
      desc: '',
      args: [],
    );
  }

  /// `تم تسجيل الدخول بنجاح`
  String get loginSuccessfully {
    return Intl.message(
      'تم تسجيل الدخول بنجاح',
      name: 'loginSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `تم إنشاء الحساب بنجاح`
  String get signupSuccessfully {
    return Intl.message(
      'تم إنشاء الحساب بنجاح',
      name: 'signupSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `برجاء إختيار نوع المستخدم`
  String get chooseUserType {
    return Intl.message(
      'برجاء إختيار نوع المستخدم',
      name: 'chooseUserType',
      desc: '',
      args: [],
    );
  }

  /// `حذف من السلة`
  String get deleteFromCart {
    return Intl.message(
      'حذف من السلة',
      name: 'deleteFromCart',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني أو اسم المستخدم تم إستخدامة من قبل بالفعل`
  String get emailOrUsernameAreAlreadyTaken {
    return Intl.message(
      'البريد الإلكتروني أو اسم المستخدم تم إستخدامة من قبل بالفعل',
      name: 'emailOrUsernameAreAlreadyTaken',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الخروج`
  String get logout {
    return Intl.message(
      'تسجيل الخروج',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `تعديل الملف الشخصي`
  String get editProfile {
    return Intl.message(
      'تعديل الملف الشخصي',
      name: 'editProfile',
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

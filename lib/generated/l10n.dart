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

  /// `اضافة منتج`
  String get addProduct {
    return Intl.message(
      'اضافة منتج',
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

  /// `إضافة`
  String get add {
    return Intl.message(
      'إضافة',
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

  /// `الرجاء إدخال بريد إلكتروني صحيح`
  String get enterValidEmail {
    return Intl.message(
      'الرجاء إدخال بريد إلكتروني صحيح',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `حذف السلة`
  String get deleteCart {
    return Intl.message(
      'حذف السلة',
      name: 'deleteCart',
      desc: '',
      args: [],
    );
  }

  /// `عرض الكل`
  String get seeAll {
    return Intl.message(
      'عرض الكل',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `منتجاتك`
  String get yourProducts {
    return Intl.message(
      'منتجاتك',
      name: 'yourProducts',
      desc: '',
      args: [],
    );
  }

  /// `الطلبات`
  String get orders {
    return Intl.message(
      'الطلبات',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Please pick an image`
  String get pleasePickImage {
    return Intl.message(
      'Please pick an image',
      name: 'pleasePickImage',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد`
  String get confirmation {
    return Intl.message(
      'تأكيد',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Max upload images is only 4`
  String get maxUploadFilesIsOnly4 {
    return Intl.message(
      'Max upload images is only 4',
      name: 'maxUploadFilesIsOnly4',
      desc: '',
      args: [],
    );
  }

  /// `Max upload image size is only 5 MB`
  String get maxUploadFileSizeIsOnly5MB {
    return Intl.message(
      'Max upload image size is only 5 MB',
      name: 'maxUploadFileSizeIsOnly5MB',
      desc: '',
      args: [],
    );
  }

  /// `هل أنت متأكد أنك تريد حذف هذه المنتج ؟`
  String get deleteProductConfirmationMessage {
    return Intl.message(
      'هل أنت متأكد أنك تريد حذف هذه المنتج ؟',
      name: 'deleteProductConfirmationMessage',
      desc: '',
      args: [],
    );
  }

  /// `هل أنت متأكد أنك تريد إلغاء هذا الطلب من العميل ؟`
  String get areYouSureYouWantToCancelThisOrderOf {
    return Intl.message(
      'هل أنت متأكد أنك تريد إلغاء هذا الطلب من العميل ؟',
      name: 'areYouSureYouWantToCancelThisOrderOf',
      desc: '',
      args: [],
    );
  }

  /// `تجاهل`
  String get dismiss {
    return Intl.message(
      'تجاهل',
      name: 'dismiss',
      desc: '',
      args: [],
    );
  }

  /// `تمت الإضافة بنجاح`
  String get addedSuccessfully {
    return Intl.message(
      'تمت الإضافة بنجاح',
      name: 'addedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `تم التعديل بنجاح`
  String get updatedSuccessfully {
    return Intl.message(
      'تم التعديل بنجاح',
      name: 'updatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `تم الحذف بنجاح`
  String get deletedSuccessfully {
    return Intl.message(
      'تم الحذف بنجاح',
      name: 'deletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ ما`
  String get somethingWentWrong {
    return Intl.message(
      'حدث خطأ ما',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد إتصال بالإنترنت`
  String get noInternet {
    return Intl.message(
      'لا يوجد إتصال بالإنترنت',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد منتجات`
  String get noProducts {
    return Intl.message(
      'لا يوجد منتجات',
      name: 'noProducts',
      desc: '',
      args: [],
    );
  }

  /// `تعذر الإتصال بالخادم، حاول مرة أخرى`
  String get cantConnectToServer {
    return Intl.message(
      'تعذر الإتصال بالخادم، حاول مرة أخرى',
      name: 'cantConnectToServer',
      desc: '',
      args: [],
    );
  }

  /// `إجمالي المنتجات : `
  String get totalProduct {
    return Intl.message(
      'إجمالي المنتجات : ',
      name: 'totalProduct',
      desc: '',
      args: [],
    );
  }

  /// `الإجمالي : `
  String get total {
    return Intl.message(
      'الإجمالي : ',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `الدفع`
  String get payment {
    return Intl.message(
      'الدفع',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `أدفع`
  String get pay {
    return Intl.message(
      'أدفع',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `التاريخ : `
  String get dateTime {
    return Intl.message(
      'التاريخ : ',
      name: 'dateTime',
      desc: '',
      args: [],
    );
  }

  /// `تم عمل الطلب بنجاح`
  String get makeOrderSuccess {
    return Intl.message(
      'تم عمل الطلب بنجاح',
      name: 'makeOrderSuccess',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد طلبات`
  String get noOrders {
    return Intl.message(
      'لا يوجد طلبات',
      name: 'noOrders',
      desc: '',
      args: [],
    );
  }

  /// `طلب رقم : `
  String get orderNumber {
    return Intl.message(
      'طلب رقم : ',
      name: 'orderNumber',
      desc: '',
      args: [],
    );
  }

  /// `نتائج البحث`
  String get searchResults {
    return Intl.message(
      'نتائج البحث',
      name: 'searchResults',
      desc: '',
      args: [],
    );
  }

  /// `لم يتم العثور على نتائج ...`
  String get noResultsFound {
    return Intl.message(
      'لم يتم العثور على نتائج ...',
      name: 'noResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `تم الدفع بنجاح`
  String get paymentSuccessfully {
    return Intl.message(
      'تم الدفع بنجاح',
      name: 'paymentSuccessfully',
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

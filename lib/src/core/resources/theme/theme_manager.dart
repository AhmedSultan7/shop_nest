import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_radius.dart';

class AppTheme {
  //! Light Theme ===============================================
  static ThemeData lightTheme(BuildContext context) {
    //! Input Decoration theme
    final inputDecorationTheme = InputDecorationTheme(
        filled: false,
        fillColor: ColorManager.backgroundColor,
        suffixIconColor: ColorManager.primaryColor,
        prefixIconColor: ColorManager.primaryColor,
        //! hint style
        hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
        //! label style
        labelStyle: const TextStyle(fontSize: 14, color: Colors.black),
        //! error style
        errorStyle: const TextStyle(color: ColorManager.errorColor),
        //! enabled border
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.baseRadius),
          borderSide: const BorderSide(
              color: Colors.black, width: 1, style: BorderStyle.solid),
        ),
        //! focused border
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorManager.errorColor, width: 1),
          borderRadius: BorderRadius.circular(AppRadius.baseRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(AppRadius.baseRadius),
        ),
        //! border
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(AppRadius.smallRadius)),
        contentPadding: EdgeInsets.zero);

    //!  AppBar Theme
    const appBarTheme = AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      color: Colors.transparent,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black),
      actionsIconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
          color: ColorManager.black, fontSize: 18, fontWeight: FontWeight.w500),
    );

    //! Text Button Theme
    final textButtonStyle = TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(
            color: ColorManager.primaryColor, fontWeight: FontWeight.bold)),
      ),
    );

    final rawChipTheme = ChipThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: const BorderSide(color: Colors.transparent, width: 0),
        ),
        selectedColor: ColorManager.primaryColor,
        backgroundColor: ColorManager.primaryColor,
        disabledColor: ColorManager.darkGrey,
        elevation: 0,
        side: BorderSide.none,
        showCheckmark: false);

    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        drawerTheme: const DrawerThemeData(
            backgroundColor: ColorManager.backgroundColor),
        dividerColor: ColorManager.darkGrey.withOpacity(0.2),
        fontFamily: GoogleFonts.cairo().fontFamily,
        primaryColor: ColorManager.primaryColor,
        cardColor: ColorManager.white,
        textButtonTheme: textButtonStyle,
        scaffoldBackgroundColor: ColorManager.backgroundColor,
        //!Icon theme
        iconTheme: const IconThemeData(
          color: ColorManager.primaryColor,
          size: 25,
        ),
        //! app bar theme
        appBarTheme: appBarTheme,
        //! input decoration theme (text form field)
        inputDecorationTheme: inputDecorationTheme,
        chipTheme: rawChipTheme);
  }
}

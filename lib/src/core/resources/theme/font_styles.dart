import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:flutter/material.dart';

TextTheme textTheme(context) => Theme.of(context).textTheme;

//! Headline & SubHeadLine Styles
TextStyle headLineStyle(BuildContext context, {bool isWhiteText = false}) =>
    textTheme(
      context,
    ).titleLarge!.copyWith(
          color: isWhiteText ? Colors.white : ColorManager.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        );

TextStyle subHeadLineStyle(BuildContext context, {bool isWhiteText = false}) =>
    textTheme(
      context,
    ).titleLarge!.copyWith(
          fontSize: 20,
          color: isWhiteText ? Colors.white : ColorManager.black,
          fontWeight: FontWeight.bold,
        );

//!----------------------------------------------------------------------------

//! Title & Subtitle Styles
TextStyle titleStyle(BuildContext context, {bool isWhiteText = false}) =>
    textTheme(
      context,
    ).titleMedium!.copyWith(
        color: isWhiteText ? Colors.white : ColorManager.black,
        fontWeight: FontWeight.bold,
        fontSize: 20);

TextStyle subTitleStyle(BuildContext context, {bool isWhiteText = false}) =>
    textTheme(
      context,
    ).titleSmall!.copyWith(
        color: isWhiteText ? Colors.white : ColorManager.black, fontSize: 18);

//! Label Styles
TextStyle labelLargeStyle(BuildContext context, {bool isWhiteText = false}) =>
    textTheme(
      context,
    ).labelLarge!.copyWith(
          color: isWhiteText ? Colors.white : ColorManager.black,
          fontSize: 16,
        );

TextStyle labelMediumStyle(BuildContext context, {bool isWhiteText = false}) =>
    textTheme(
      context,
    ).labelMedium!.copyWith(
          color: isWhiteText ? Colors.white : ColorManager.black,
          fontSize: 14,
        );

TextStyle labelSmallStyle(BuildContext context, {bool isWhiteText = false}) =>
    textTheme(
      context,
    ).labelSmall!.copyWith(
          color: isWhiteText ? Colors.white : ColorManager.black,
        );

//! Body Styles
TextStyle bodyStyle(BuildContext context, {bool isWhiteText = false}) =>
    textTheme(context).bodyLarge!.copyWith(
          color: isWhiteText ? Colors.white : ColorManager.black,
        );

TextStyle hintStyle(BuildContext context, {bool isWhiteText = false}) =>
    textTheme(context).bodySmall!.copyWith(
          color: isWhiteText ? Colors.white : ColorManager.black,
        );

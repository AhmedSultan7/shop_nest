part of 'extensions.dart';

extension ThemeExtensions on BuildContext {
  ThemeData get appTheme => Theme.of(this);

  //? Get text style shortcuts
  TextStyle get headLine => headLineStyle(this);

  TextStyle get whiteHeadLine => headLineStyle(this, isWhiteText: true);

  TextStyle get subHeadLine => subHeadLineStyle(this);

  TextStyle get whiteSubHeadLine => subHeadLineStyle(this, isWhiteText: true);

  TextStyle get title => titleStyle(this);

  TextStyle get whiteTitle => titleStyle(this, isWhiteText: true);

  TextStyle get subTitle => subTitleStyle(this);

  TextStyle get whiteSubTitle => subTitleStyle(this, isWhiteText: true);

  TextStyle get labelLarge => labelLargeStyle(this);

  TextStyle get greyLabelLarge =>
      labelLargeStyle(this).copyWith(color: const Color(0xffbcc2ce));

  TextStyle get whiteLabelLarge => labelLargeStyle(this, isWhiteText: true);

  TextStyle get labelMedium => labelMediumStyle(this);

  TextStyle get whiteLabelMedium => labelMediumStyle(this, isWhiteText: true);

  TextStyle get greyLabelMedium =>
      labelMediumStyle(this).copyWith(color: const Color(0xffbfc6ce));

  TextStyle get orderGreyLabelMedium => labelMediumStyle(this)
      .copyWith(color: ColorManager.darkGrey.withOpacity(0.9));

  TextStyle get labelSmall => labelSmallStyle(this);

  TextStyle get whitelabelSmall => labelSmallStyle(this, isWhiteText: true);

  TextStyle get body => bodyStyle(this);

  TextStyle get whiteBody => bodyStyle(this, isWhiteText: true);

  TextStyle get hint => hintStyle(this);

  TextStyle get whiteHint => hintStyle(this, isWhiteText: true);
}

extension Localization on BuildContext {
  //? Localization shortcuts
  S get tr => S.of(this);
}

extension NavigationExtensions on BuildContext {
  void to(Widget widget) => Navigator.of(this).push(
        MaterialPageRoute(builder: (_) => widget),
      );

  void toReplacement(Widget widget) => Navigator.of(this).pushReplacement(
        MaterialPageRoute(builder: (_) => widget),
      );

  void toNamed(String routeName) => Navigator.of(this).pushNamed(routeName);

  void toNamedReplacement(String routeName) =>
      Navigator.of(this).pushReplacementNamed(routeName);

  void back() => Navigator.of(this).pop();
}

extension SizeExensions on BuildContext {
  //? Get size shortcuts
  double get height => MediaQuery.sizeOf(this).height;

  double get width => MediaQuery.sizeOf(this).width;

  //? Get space shortcuts -- Horizontal & Vertical

  Gap get xSmallGap => const Gap(AppSpaces.xSmallPadding);

  Gap get smallGap => const Gap(AppSpaces.smallPadding);

  Gap get mediumGap => const Gap(AppSpaces.defaultPadding);

  Gap get largeGap => const Gap(AppSpaces.largePadding);

  Gap get xlLargeGap => const Gap(AppSpaces.xlLargePadding);

  Gap get fieldsGap => const Gap(AppSpaces.largePadding);
}

enum FlushBarType { add, update, delete, error, noInternet, timeOut }

extension ShowBars on BuildContext {
  //? Alerts
  void showBarMessage(String msg, {bool isError = false}) =>
      showBarAlert(this, msg, isError: isError);

  //? Success Bar
  void showFlushBar({FlushBarType type = FlushBarType.add}) {
    String msg = _getMsg(type);

    showBarAlert(this, msg,
        isError: type == FlushBarType.error || type == FlushBarType.noInternet);
  }

  String _getMsg(FlushBarType type) {
    String msg = '';

    order. (type) {
      case FlushBarType.add:
        msg = tr.addedSuccessfully;
        break;
      case FlushBarType.update:
        msg = tr.updatedSuccessfully;
        break;
      case FlushBarType.delete:
        msg = tr.deletedSuccessfully;
        break;
      case FlushBarType.error:
        msg = tr.somethingWentWrong;
        break;
      case FlushBarType.noInternet:
        msg = tr.noInternet;
        break;
      case FlushBarType.timeOut:
        msg = tr.cantConnectToServer;
        break;
    }

    return msg;
  }
}

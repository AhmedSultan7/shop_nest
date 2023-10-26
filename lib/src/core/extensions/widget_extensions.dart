part of 'extensions.dart';

extension WidgetExtenstions on Widget {
  //? Padding -----------------------------------------
  Widget paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget paddingSymmetric({double vertical = 0, double horizontal = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Widget paddingOnly(
      {double top = 0, double bottom = 0, double left = 0, double right = 0}) {
    return Padding(
      padding:
          EdgeInsets.only(top: top, bottom: bottom, left: left, right: right),
      child: this,
    );
  }

  //? Align -----------------------------------------
  Widget align([AlignmentGeometry alignment = Alignment.center]) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  //? Center -----------------------------------------
  Widget center() {
    return Center(
      child: this,
    );
  }

  //? SizedBox -----------------------------------------
  Widget sized({double? width, double? height}) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  //? Expanded -----------------------------------------
  Widget expanded({int flex = 1}) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }

  //? Flexible -----------------------------------------
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) {
    return Flexible(
      flex: flex,
      fit: fit,
      child: this,
    );
  }

  //? Container
  Widget container({
    Key? key,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Clip clipBehavior = Clip.none,
  }) {
    return Container(
      key: key,
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  //? Container
  Widget decorated({
    Color? color,
    BorderRadius? radius,
    AlignmentGeometry? alignment,
    double? height,
    double? width,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    List<BoxShadow>? shadow,
  }) {
    return Container(
      height: height,
      padding: padding,
      margin: margin,
      width: width,
      alignment: alignment,
      decoration:
          BoxDecoration(color: color, borderRadius: radius, boxShadow: shadow),
      child: this,
    );
  }

  //? ScrollView
  Widget scroll() {
    return SingleChildScrollView(
      child: this,
    );
  }
}

extension TextWidgets on String {
  //? Label Large
  Widget labelLarge(BuildContext context) {
    return Text(
      this,
      style: context.labelLarge,
    );
  }
}

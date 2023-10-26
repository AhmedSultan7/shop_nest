import 'package:flutter/cupertino.dart';

import '../../resources/theme/theme.dart';

class IconWidget extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? height;
  final double? width;
  const IconWidget({
    super.key,
    required this.icon,
    this.color = ColorManager.iconColor,
    this.height = 24,
    this.width = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      height: height,
      width: width,
      color: color,
    );
  }
}

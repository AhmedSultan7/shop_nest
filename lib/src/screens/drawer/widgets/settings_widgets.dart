import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/app_spaces.dart';
import '../../../core/resources/theme/theme.dart';
import '../../../core/shared_widgets/icon_widget/icon_widget.dart';

class SettingsWidget extends StatelessWidget {
  final String iconPath;
  final String header;
  final Widget? trailingWidget;

  const SettingsWidget({
    super.key,
    required this.iconPath,
    required this.header,
    required this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconWidget(color: ColorManager.iconColor, icon: iconPath),
        context.largeGap,
        Text(
          header,
          style: context.labelLarge,
        ),
        if (trailingWidget != null) ...[const Spacer(), trailingWidget!],
      ],
    ).paddingSymmetric(horizontal: AppSpaces.defaultPadding);
  }
}

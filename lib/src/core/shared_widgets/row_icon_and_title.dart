import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/shared_widgets/icon_widget/icon_widget.dart';
import 'package:flutter/material.dart';

class RowIconAndTitle extends StatelessWidget {
  final String iconPath;
  final String title;
  final Function()? onTap;

  const RowIconAndTitle(
      {super.key,
      required this.iconPath,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconWidget(height: 30, width: 30, color: Colors.white, icon: iconPath),
        context.smallGap,
        Text(
          title,
          style: context.whiteLabelMedium.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.history_rounded,
          size: 70,
          color: ColorManager.iconColor,
        ),
        Text(
          context.tr.noHistory,
          style: context.title,
        ),
      ],
    );
  }
}

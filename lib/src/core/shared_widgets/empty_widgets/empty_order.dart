import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../resources/theme/theme.dart';

class EmptyOrderWidget extends StatelessWidget {
  const EmptyOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
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

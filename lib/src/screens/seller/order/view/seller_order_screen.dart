import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SellerOrderScreen extends HookWidget {
  const SellerOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'No Orders',
            style: context.headLine
                .copyWith(color: ColorManager.primaryColor, fontSize: 50),
          ),
        )
      ],
    );
  }
}

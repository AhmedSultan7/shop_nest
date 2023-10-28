import 'package:cards_app/generated/assets.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(Assets.animationCart),
        Text(
          context.tr.emptyCart,
          style: context.title,
        ),
      ],
    );
  }
}

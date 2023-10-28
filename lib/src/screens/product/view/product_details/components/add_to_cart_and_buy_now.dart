import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/shared_widgets/buttons/floating_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/theme/theme.dart';
import '../../../../../core/shared_widgets/shared_widgets.dart';

class AddToCartAndBuyNow extends StatelessWidget {
  final ValueNotifier<int> quantity;

  const AddToCartAndBuyNow({
    super.key,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ProductQuantityButtons(quantity: quantity),
        context.largeGap,
        Button(
          isPrefixIcon: true,
          onPressed: () {},
          color: ColorManager.black,
          label: 'Buy Now',
          isWhiteText: true,
        ),
      ],
    );
  }
}

class _ProductQuantityButtons extends StatelessWidget {
  final ValueNotifier<int> quantity;

  const _ProductQuantityButtons({super.key, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            BaseFloatingButton(
              hero: '1',
              onTap: () {},
              child: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
            context.mediumGap,
            Text(
              '${quantity.value}',
              style:
                  context.subTitle.copyWith(color: ColorManager.primaryColor),
            ),
            context.mediumGap,
            BaseFloatingButton(
              onTap: () {},
              hero: '0',
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
        context.mediumGap,
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 40.h,
            child: Button(
              isOutLine: true,
              isPrefixIcon: true,
              onPressed: () {},
              color: ColorManager.black,
              label: 'Add to cart',
              isWhiteText: true,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/shared_widgets/buttons/floating_actions.dart';
import 'package:cards_app/src/screens/cart/model/cart_model.dart';
import 'package:cards_app/src/screens/cart/view_model/cart_view_model.dart';
import 'package:cards_app/src/screens/product/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/theme/theme.dart';
import '../../../../../core/shared_widgets/shared_widgets.dart';

class AddToCartAndBuyNow extends StatelessWidget {
  final ValueNotifier<int> quantity;
  final ProductModel product;

  const AddToCartAndBuyNow({
    super.key,
    required this.quantity,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ProductQuantityButtons(
          quantity: quantity,
          product: product,
        ),
        context.largeGap,
        Button(
          isPrefixIcon: true,
          onPressed: () {},
          color: ColorManager.primaryColor,
          label: context.tr.buyNow,
          isWhiteText: true,
        ),
      ],
    );
  }
}

class _ProductQuantityButtons extends StatelessWidget {
  final ValueNotifier<int> quantity;
  final ProductModel product;

  const _ProductQuantityButtons(
      {required this.quantity, required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartVM>(
      builder: (context, cartVM, child) {
        return Row(
          children: [
            Row(
              children: [
                BaseFloatingButton(
                  onTap: () {
                    quantity.value--;
                  },
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
                context.mediumGap,
                Text(
                  quantity.value.toString(),
                  style:
                      context.title.copyWith(color: ColorManager.primaryColor),
                ),
                context.mediumGap,
                BaseFloatingButton(
                  onTap: () {
                    quantity.value++;
                  },
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
                  onPressed: () {
                    cartVM.addProductsToCart(
                        cart: CartModel(
                            quantity: 1, id: product.id, product: product));
                  },
                  color: ColorManager.black,
                  label: context.tr.addToCart,
                  isWhiteText: true,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

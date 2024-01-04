import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/shared_widgets/buttons/floating_actions.dart';
import 'package:cards_app/src/screens/buyer/home/view/main_buyer_screen.dart';
import 'package:cards_app/src/screens/seller/product/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/resources/theme/theme.dart';
import '../../../../../../core/shared_widgets/shared_widgets.dart';
import '../../../../../buyer/cart/model/cart_model.dart';
import '../../../../../buyer/cart/view_model/cart_view_model.dart';
import '../../../../../seller/home/view_model/bottom_nav_provider.dart';

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
    return Consumer<CartVM>(
      builder: (context, cartVM, child) {
        //! Add to cart ==============================
        void addToCart() {
          final cart = CartModel(
            id: product.id!,
            quantity: quantity.value,
            product: product,
          );

          cartVM.addProductsToCart(context, cart: cart);
        }

        //! Update Cart ======================================
        void updateCart() async {
          final currentCart = cartVM.currentCart(product.id!);

          final allQuantity = currentCart.quantity + quantity.value;

          final result = await cartVM.updateQuantity(
            cart: currentCart,
            quantity: allQuantity,
          );

          //! Check if updated successfully & mounted
          if (context.mounted && result) {
            context.showFlushBar(
              type: FlushBarType.add,
            );
          }
        }

        //! (Main Function) Check if in cart then add or update ==============================
        void addOrUpdateCart() {
          if (cartVM.isProductInCart(product.id!)) {
            updateCart();
          } else {
            addToCart();
          }
        }

        return Column(
          children: [
            Row(
              children: [
                //! Positive & Minus Buttons
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
                      style: context.title
                          .copyWith(color: ColorManager.primaryColor),
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
                //! Add to cart button
                Expanded(
                  flex: 2,
                  child: Button(
                    isOutLine: true,
                    isPrefixIcon: true,
                    onPressed: addOrUpdateCart,
                    color: ColorManager.black,
                    label: context.tr.addToCart,
                    isWhiteText: true,
                  ),
                ),
              ],
            ),

            context.largeGap,

            //! Buy now button
            Button(
              isPrefixIcon: true,
              onPressed: () {
                addOrUpdateCart();

                //! Set current index to cart screen
                context.read<SellerBottomNavbarVM>().setCurrentIndex(1);

                context.toReplacement(const MainBuyerScreen());
              },
              color: ColorManager.primaryColor,
              label: context.tr.buyNow,
              isWhiteText: true,
            ),
          ],
        );
      },
    );
  }
}

import 'package:cards_app/generated/assets.dart';
import 'package:cards_app/src/core/consts/app_constants.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/core/shared_widgets/box_shadow.dart';
import 'package:cards_app/src/core/shared_widgets/icon_widget/icon_widget.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:cards_app/src/screens/buyer/cart/model/cart_model.dart';
import 'package:cards_app/src/screens/buyer/cart/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/resources/app_radius.dart';
import '../../../../../../core/resources/app_spaces.dart';
import '../../../../../seller/home/view_model/bottom_nav_provider.dart';
import '../../../../../seller/product/models/product_model.dart';
import '../../../../home/view/main_buyer_screen.dart';
import '../../product_details/product_details_screen.dart';

class BuyerProductCard extends StatelessWidget {
  final ProductModel product;

  const BuyerProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartVM>(
      builder: (context, cartVM, child) {
        //! Add to cart ==============================
        void addToCart() {
          final cart = CartModel(
            id: product.id!,
            quantity: 1,
            product: product,
          );

          cartVM.addProductsToCart(context, cart: cart);
        }

        //! Update Cart ======================================
        void updateCart() async {
          final currentCart = cartVM.currentCart(product.id!);

          final allQuantity = currentCart.quantity + 1;

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

        return InkWell(
          onTap: () {
            context.to(ProductsDetailsScreen(product: product));
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(AppRadius.imageContainerRadius),
                color: Theme.of(context).cardColor,
                boxShadow: ConstantsWidgets.boxShadow),
            child: Stack(
              children: [
                //! image & details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! Product image
                    SizedBox(
                      height: context.height * 0.26,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppRadius.imageContainerRadius,
                        ),
                        child: Image.network(
                          product.image?.url ?? '',
                          width: double.infinity,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(
                                  child: IconWidget(icon: Assets.iconsNoImage)),
                        ),
                      ),
                    ),

                    context.smallGap,

                    //! product title & price & sale price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //! Product Title
                        Text(
                          product.name ?? '',
                          style: context.subTitle.copyWith(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        context.smallGap,
                        //! price and currency
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //! Price Text
                            Text(context.tr.price,
                                style: context.labelLarge
                                    .copyWith(fontWeight: FontWeight.bold)),
                            context.smallGap,

                            //! Price
                            Text('${product.price} ',
                                style: context.title.copyWith(
                                    color: ColorManager.primaryColor)),

                            //! Currency
                            Text(AppConsts.currency,
                                style: context.labelLarge
                                    .copyWith(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        context.smallGap,
                        SizedBox(
                            height: context.height * 0.05,
                            child: Button(
                                label: context.tr.buyNow,
                                onPressed: () {
                                  addOrUpdateCart();

                                  //! Set current index to cart screen
                                  context
                                      .read<SellerBottomNavbarVM>()
                                      .setCurrentIndex(1);

                                  context
                                      .toReplacement(const MainBuyerScreen());
                                })),
                      ],
                    ).paddingOnly(
                        left: AppSpaces.smallPadding,
                        right: AppSpaces.smallPadding),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

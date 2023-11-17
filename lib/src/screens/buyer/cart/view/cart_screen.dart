import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_radius.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../../generated/assets.dart';
import '../../../../core/resources/theme/theme.dart';
import '../../../../core/shared_widgets/box_shadow.dart';
import '../model/cart_model.dart';
import '../view_model/cart_view_model.dart';

class CartScreen extends HookWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartViewModel = context.read<CartVM>();

    useEffect(() {
      cartViewModel.getCart();

      return () {};
    }, []);

    return Consumer<CartVM>(
      builder: (context, cartVM, child) {
        final cartData = cartVM.cartList;

        //! TODO-Check Move to widgets folder
        if (cartData.isEmpty) {
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

        return Column(
          children: [
            ListView.separated(
                padding: const EdgeInsets.symmetric(
                    vertical: AppSpaces.defaultPadding),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    BuildCartWidget(cart: cartData[index], index: index),
                separatorBuilder: (context, index) => context.mediumGap,
                itemCount: cartData.length),
            Text(
              cartVM.total.toString(),
              style: context.headLine,
            ),
            context.largeGap,
          ],
        );
      },
    );
  }
}

//! TODO-Check Move to widgets folder
class BuildCartWidget extends HookWidget {
  final CartModel cart;
  final int index;

  const BuildCartWidget({super.key, required this.cart, required this.index});

  @override
  Widget build(BuildContext context) {
    final product = cart.product;

    final quantity = useState<int>(cart.quantity);
    final productPrice = product.price! * quantity.value;

    void updateCartQuantity() {
      context.read<CartVM>().updateQuantity(
            productId: product.id!,
            quantity: quantity.value,
          );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpaces.smallPadding),
      padding: const EdgeInsets.symmetric(
          vertical: AppSpaces.smallPadding,
          horizontal: AppSpaces.defaultPadding),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppRadius.baseRadius),
          boxShadow: ConstantsWidgets.boxShadowFromBottom),
      child: Row(
        children: [
          //! product image
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.baseRadius),
                  child: Image.network(
                    product.image!.url,
                    fit: BoxFit.cover,
                    height: 100,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.abc);
                    },
                  ),
                ),
                //! delete button
                IconButton(
                  onPressed: () {
                    context.read<CartVM>().deleteFromCart(index: index);
                  },
                  icon: CircleAvatar(
                      backgroundColor:
                          ColorManager.primaryColor.withOpacity(0.7),
                      radius: 18,
                      child: const Icon(
                        Icons.delete_rounded,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
          context.smallGap,

          //! product name & price
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! Product name
                  Text(
                    cart.product.name ?? '',
                    style: context.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  5.verticalSpace,
                  Text(
                    '\$$productPrice ',
                    style: context.title
                        .copyWith(color: ColorManager.primaryColor),
                  ).paddingOnly(right: AppSpaces.xSmallPadding),
                ],
              ),
            ),
          ),
          context.smallGap,
          Flexible(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 40.w,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius:
                      BorderRadius.circular(AppRadius.baseContainerRadius),
                ),
                child: Column(
                  children: [
                    //! increase  quantity
                    IconButton(
                      onPressed: () {
                        // if (quantity.value < 10) {//! TODO-Check Leeeeh yactaa ?? Ma tsebo yshtry bra7too
                        quantity.value++;

                        //! Update cart quantity
                        updateCartQuantity();
                        // }
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                    //! quantity
                    Text('${quantity.value}',
                        style: context.labelMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.primaryColor)),
                    //! uncreased  quantity
                    IconButton(
                      onPressed: () {
                        if (quantity.value > 1) {
                          quantity.value--;

                          //! Update cart quantity
                          updateCartQuantity();
                        }
                      },
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

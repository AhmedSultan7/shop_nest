import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_radius.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/screens/cart/model/cart_model.dart';
import 'package:cards_app/src/screens/cart/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../generated/assets.dart';
import '../../../core/resources/theme/theme.dart';
import '../../../core/shared_widgets/box_shadow.dart';

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
        final cartData = cartVM.cart;

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
        return ListView.separated(
            padding:
                const EdgeInsets.symmetric(vertical: AppSpaces.defaultPadding),
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                BuildCartWidget(cart: cartData[index], index: index),
            separatorBuilder: (context, index) => context.mediumGap,
            itemCount: cartData.length);
      },
    );
  }
}

class BuildCartWidget extends StatelessWidget {
  final CartModel cart;
  final int index;

  const BuildCartWidget({super.key, required this.cart, required this.index});

  @override
  Widget build(BuildContext context) {
    final product = cart.product;

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
                  //! product name
                  Text(
                    cart.product.description ?? '',
                    style: context.subTitle,
                    maxLines: 2,
                  ),
                  5.verticalSpace,
                  Text(
                    '\$${product.price} ',
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
                  color: Colors.blueGrey.withOpacity(0.1),
                  borderRadius:
                      BorderRadius.circular(AppRadius.baseContainerRadius),
                ),
                child: Column(
                  children: [
                    //! increase  quantity
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                    //! quantity
                    Text('${cart.quantity}',
                        style: context.labelMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.primaryColor)),
                    //! uncreased  quantity
                    IconButton(
                      onPressed: () {},
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

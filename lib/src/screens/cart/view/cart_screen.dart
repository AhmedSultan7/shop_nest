import 'package:cards_app/src/core/extensions/extensions.dart';
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //! product name & price & image
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //! product image
              Image.network(
                product.image!.url,
                width: 100,
                height: 100,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.abc);
                },
              ),
              10.horizontalSpace,
              //! product name & price
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! product name
                  Text(
                    product.name ?? '',
                    style: context.labelLarge,
                  ),
                  5.verticalSpace,
                  Text(
                    '\$${product.price} ',
                    style: context.title
                        .copyWith(color: ColorManager.primaryColor),
                  ),
                ],
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //! add & remove buttons & quantity
              Container(
                height: 35.h,
                width: 100.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: ConstantsWidgets.boxShadow),
                child: Row(
                  children: [
                    //! increase  quantity
                    Expanded(
                        child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                      ),
                    )),
                    //! quantity
                    Text('${cart.quantity}',
                        style: context.labelLarge
                            .copyWith(fontWeight: FontWeight.bold)),
                    //! uncreased  quantity
                    Expanded(
                        child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove,
                      ),
                    )),
                  ],
                ),
              ),
              //! delete button
              IconButton(
                onPressed: () {
                  context.read<CartVM>().deleteFromCart(index: index);
                },
                icon: const Icon(Icons.delete_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:cards_app/generated/assets.dart';
import 'package:cards_app/src/core/consts/app_constants.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/shared_widgets/icon_widget/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/app_radius.dart';
import '../../../../../core/resources/app_spaces.dart';
import '../../../../../core/resources/theme/theme.dart';
import '../../../../../core/shared_widgets/box_shadow.dart';
import '../../model/cart_model.dart';
import '../../view_model/cart_view_model.dart';

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
            cart: cart,
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
                    width: 300.w,
                    errorBuilder: (context, error, stackTrace) {
                      return const IconWidget(icon: Assets.iconsImg);
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
          context.mediumGap,
          //! product name & price
          Expanded(
            flex: 3,
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
                    '$productPrice ${AppConsts.currency}',
                    style: context.title
                        .copyWith(color: ColorManager.primaryColor),
                  ).paddingOnly(right: AppSpaces.xSmallPadding),
                ],
              ),
            ),
          ),
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

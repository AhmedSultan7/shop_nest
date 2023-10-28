import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_radius.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:cards_app/src/screens/product/models/product_model.dart';
import 'package:cards_app/src/screens/product/view/product_details/components/add_to_cart_and_buy_now.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/product_container_details.dart';

class ProductsDetailsScreen extends HookWidget {
  final ProductModel product;

  const ProductsDetailsScreen({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final quantity = useValueNotifier(1);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! Product image
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(AppRadius.productRadius),
                  bottomRight: Radius.circular(AppRadius.productRadius),
                ),
                child: SizedBox(
                  height: context.height * 0.5,
                  width: double.infinity,
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: ColorManager.grey.withOpacity(0.6),
                radius: 22,
                child: const BackButtonWidget(),
              ).paddingSymmetric(vertical: 25.h, horizontal: 10.w),
            ],
          ),
          context.largeGap,

          //! Product name, price , description , category name , delete & edit
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductDetails(product: product),
              context.xlLargeGap,
              AddToCartAndBuyNow(
                quantity: quantity,
              ),
            ],
          ).paddingAll(AppSpaces.defaultPadding)
        ],
      ),
    );
  }
}
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/app_radius.dart';
import '../../../../../core/resources/app_spaces.dart';
import '../../../models/product_model.dart';
import '../../product_details/product_details_screen.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel product;

  const ProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.to(ProductsDetailsScreen(product: product));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.imageContainerRadius),
          color: Theme.of(context).cardColor,
        ),
        child: Stack(
          children: [
            //! image & details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! Product image
                SizedBox(
                  height: 170.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppRadius.imageContainerRadius,
                    ),
                    child: Image.asset(
                      product.image ?? '',
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                context.smallGap,

                //! product title & price & sale price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: context.title.copyWith(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    context.smallGap,
                    //! price and sale price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('\$${product.price} ', style: context.labelLarge),
                      ],
                    ),
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
  }
}

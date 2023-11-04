import 'package:cards_app/src/core/consts/app_constants.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/core/shared_widgets/box_shadow.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
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
            boxShadow: ConstantsWidgets.boxShadow),
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
                    child: Image.network(
                      product.image?.url ?? '',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                context.smallGap,

                //! product title & price & sale price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //! Product Title
                    Text(
                      product.name ?? '',
                      style: context.labelLarge.copyWith(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    context.smallGap,
                    //! price and currency
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //! Price Text
                        Text(context.tr.price,
                            style: context.subTitle
                                .copyWith(fontWeight: FontWeight.bold)),
                        context.smallGap,

                        //! Price
                        Text('${product.price} ',
                            style: context.title
                                .copyWith(color: ColorManager.primaryColor)),

                        //! Currency
                        Text(AppConsts.currency,
                            style: context.subTitle
                                .copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    context.smallGap,
                    SizedBox(
                        height: 30.h,
                        child:
                            Button(label: context.tr.buyNow, onPressed: () {})),
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

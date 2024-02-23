import 'package:cards_app/src/core/consts/app_constants.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/screens/seller/product/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;

  const ProductDetails({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //! product title
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.name ?? '', style: context.headLine),
          context.smallGap,
          //! price and currency
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //! Price Text
              Text(context.tr.price,
                  style:
                      context.headLine.copyWith(fontWeight: FontWeight.bold)),
              context.smallGap,

              //! Price
              Text('${product.price} ',
                  style: context.headLine
                      .copyWith(color: ColorManager.primaryColor)),

              //! Currency
              Text(AppConsts.currency,
                  style: context.title.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          context.mediumGap,
          Text('جهاز PS5 بمميزات رائعة', style: context.labelLarge),
          // Text(product.description ?? '', style: context.labelLarge),
        ],
      )
    ]);
  }
}

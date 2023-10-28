import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/screens/product/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/consts/app_constants.dart';
import '../../../../../core/resources/theme/theme.dart';

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
          Text(product.title, style: context.headLine.copyWith(fontSize: 40)),
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
        ],
      )
    ]);
  }
}

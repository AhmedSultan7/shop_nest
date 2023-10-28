import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/screens/product/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;

  const ProductDetails({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //! product title
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.title, style: context.headLine.copyWith(fontSize: 40)),
            context.smallGap,
            // //! price
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     if (isSale) ...[
            //       Text(
            //         '\$${productModel.salePrice}',
            //         style: context.title,
            //       ),
            //     ] else ...[
            //       Text(
            //         '\$${productModel.totalPrice}',
            //         style: context.labelLarge,
            //       )
            //     ],
            //     if (isSale) ...[
            //       context.smallGap,
            Text(
              '\$${product.price}',
              style: context.title,
            ),
            //     ]
            //   ],
            // ),
          ],
        ),
      ],
    );
  }
}

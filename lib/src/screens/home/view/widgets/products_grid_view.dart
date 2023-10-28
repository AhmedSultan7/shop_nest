import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../product/models/product_model.dart';
import '../../../product/view/product_screen/widgets/product_card.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Products',
          style: context.headLine,
        ),
        context.mediumGap,
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              childAspectRatio: 7 / 12,
            ),
            itemBuilder: (BuildContext context, int index) {
              return ProductCardWidget(
                product: ProductModel.productList[index],
              );
            }),
      ],
    );
  }
}

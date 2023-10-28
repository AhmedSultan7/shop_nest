import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/screens/product/view/product_screen/widgets/products_grid_view_widget.dart';
import 'package:flutter/material.dart';

import '../../../product/models/product_model.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr.products,
          style: context.headLine,
        ),
        context.mediumGap,
        ProductGridViewWidget(products: ProductModel.productList),
      ],
    );
  }
}

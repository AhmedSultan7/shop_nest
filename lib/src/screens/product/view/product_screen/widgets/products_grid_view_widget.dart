import 'package:cards_app/src/screens/product/view/product_screen/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class ProductGridViewWidget extends StatelessWidget {
  final List<ProductModel> products;
  const ProductGridViewWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: [].length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        childAspectRatio: .50,
      ),
      itemBuilder: (_, index) => ProductCardWidget(
        product: products[index],
      ),
    );
  }
}

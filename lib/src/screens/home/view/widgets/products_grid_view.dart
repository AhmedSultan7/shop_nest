import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/screens/product/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../product/view/product_screen/widgets/product_card.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              context.tr.products,
              style: context.headLine,
            ),
            Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add))
          ],
        ),
        context.mediumGap,
        Consumer<ProductVM>(
          builder: (context, productVM, child) {
            if (productVM.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return GridView.builder(
              padding: const EdgeInsets.only(bottom: AppSpaces.defaultPadding),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: productVM.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                childAspectRatio: .50,
              ),
              itemBuilder: (_, index) => ProductCardWidget(
                product: productVM.products[index],
              ),
            );
          },
        ),
      ],
    );
  }
}

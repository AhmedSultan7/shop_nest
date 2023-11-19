import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../view_model/product_view_model.dart';
import 'widgets/seller_product_card.dart';

class SellerProductsScreen extends HookWidget {
  const SellerProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Consumer<ProductsVM>(
          builder: (context, productVM, child) {
            if (productVM.isLoading) {
              return const LoadingWidget();
            }
            return GridView.builder(
              padding: const EdgeInsets.only(
                  bottom: AppSpaces.defaultPadding,
                  left: AppSpaces.defaultPadding,
                  right: AppSpaces.defaultPadding),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: productVM.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (_, index) => SellerProductCard(
                product: productVM.products[index],
              ),
            );
          },
        ),
      ],
    );
  }
}

import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/shared_widgets/appbar/main_appbar.dart';
import 'package:cards_app/src/screens/buyer/product/view/product_screen/widgets/buyer_product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/shared_widgets/shared_widgets.dart';
import '../../../../../seller/product/view_model/product_view_model.dart';

class BuyerAllProductsScreen extends StatelessWidget {
  const BuyerAllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        isBackButton: true,
        title: context.tr.products,
      ),
      body: Consumer<ProductsVM>(
        builder: (context, productVM, child) {
          if (productVM.isLoading) {
            return const LoadingWidget();
          }
          return GridView.builder(
            padding: const EdgeInsets.only(bottom: AppSpaces.defaultPadding),
            itemCount: productVM.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              childAspectRatio: .50,
            ),
            itemBuilder: (_, index) => BuyerProductCard(
              product: productVM.products[index],
            ),
          ).paddingAll(AppSpaces.defaultPadding);
        },
      ),
    );
  }
}

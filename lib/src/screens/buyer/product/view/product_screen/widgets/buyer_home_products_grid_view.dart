import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:cards_app/src/screens/buyer/product/view/product_screen/widgets/buyer_all_products_screen.dart';
import 'package:cards_app/src/screens/seller/product/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'buyer_product_card.dart';

class HomeProductsGridView extends StatelessWidget {
  const HomeProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellerProductVM>(
      builder: (context, productVM, child) {
        if (productVM.isLoading) {
          return const LoadingWidget();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  context.tr.products,
                  style: context.headLine,
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      context.to(const BuyerAllProductsScreen());
                    },
                    child: Text(
                      context.tr.seeAll,
                      style: context.labelLarge
                          .copyWith(color: ColorManager.primaryColor),
                    )),
              ],
            ),
            context.mediumGap,
            GridView.builder(
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
              itemBuilder: (_, index) => BuyerProductCard(
                product: productVM.products[index],
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:cards_app/src/screens/buyer/product/view/product_screen/widgets/buyer_all_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../seller/product/view_model/product_view_model.dart';
import 'buyer_product_card.dart';

class HomeProductsGridView extends StatelessWidget {
  final TextEditingController searchController;

  const HomeProductsGridView({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsVM>(
      builder: (context, productVM, child) {
        final isSearching = searchController.text.isNotEmpty;

        if (productVM.isLoading) {
          return const LoadingWidget();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  isSearching ? context.tr.searchResults : context.tr.products,
                  style: context.headLine,
                ),
                const Spacer(),
                if (!isSearching)
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
            if (isSearching && productVM.searchedProductsList.isEmpty) ...[
              context.xlLargeGap,
              Text(
                context.tr.noResultsFound,
                style: context.headLine,
              ),
            ],
            GridView.builder(
              padding: const EdgeInsets.only(bottom: AppSpaces.defaultPadding),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: isSearching
                  ? productVM.searchedProductsList.length
                  : productVM.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                childAspectRatio: .50,
              ),
              itemBuilder: (_, index) => BuyerProductCard(
                product: isSearching
                    ? productVM.searchedProductsList[index]
                    : productVM.products[index],
              ),
            ),
          ],
        );
      },
    );
  }
}

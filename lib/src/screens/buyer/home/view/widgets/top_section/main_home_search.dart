import 'package:cards_app/src/screens/seller/product/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/shared_widgets/shared_widgets.dart';

class HomeSearch extends StatelessWidget {
  final TextEditingController searchController;
  const HomeSearch({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsVM>(
      builder: (context, productsVM, child) {
        Widget searching() {
          if (searchController.text.isNotEmpty) {
            return InkWell(
                onTap: () {
                  productsVM.clearSearch(searchController: searchController);
                },
                child: const Icon(Icons.close));
          } else {
            return const Icon(Icons.search_rounded);
          }
        }

        return SearchWidget(
            searchController: searchController,
            onChanged: (searchedProducts) {
              productsVM.searchedProductsToSearchedList(searchedProducts);
            },
            suffixIcon: searching());
      },
    );
  }
}

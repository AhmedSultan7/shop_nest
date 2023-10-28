import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/shared_widgets/appbar/main_appbar.dart';
import 'package:cards_app/src/screens/product/models/product_model.dart';
import 'package:cards_app/src/screens/product/view/product_screen/widgets/products_grid_view_widget.dart';
import 'package:flutter/material.dart';

import '../../../sub_category/model/sub_category_model.dart';

class ProductByCatScreen extends StatelessWidget {
  final SubCategoryModel subCategory;

  const ProductByCatScreen({super.key, required this.subCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: subCategory.title,
      ),
      body: ProductGridViewWidget(products: ProductModel.productListSub)
          .paddingAll(AppSpaces.defaultPadding)
          .scroll(),
    );
  }
}

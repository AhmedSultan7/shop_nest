import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/app_spaces.dart';
import '../../../../buyer/product/view/product_screen/widgets/buyer_home_products_grid_view.dart';
import '../../../product/view_model/product_view_model.dart';

class BuyerHomeScreen extends HookWidget {
  const BuyerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productVM = context.read<SellerProductVM>();
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        productVM.getProducts();
      });
      return () {};
    }, []);
    return ListView(
      children: [
        const HomeProductsGridView()
            .paddingSymmetric(horizontal: AppSpaces.defaultPadding),
      ],
    );
  }
}

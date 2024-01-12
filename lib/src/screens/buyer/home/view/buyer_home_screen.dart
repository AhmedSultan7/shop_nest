import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/utils/logger.dart';
import 'package:cards_app/src/screens/buyer/home/view/widgets/top_section/home_slider.dart';
import 'package:cards_app/src/screens/buyer/home/view/widgets/top_section/main_home_search.dart';
import 'package:cards_app/src/screens/seller/product/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/app_spaces.dart';
import '../../cart/view_model/cart_view_model.dart';
import '../../product/view/product_screen/widgets/buyer_home_products_grid_view.dart';
import '../view_model/slider_view_model.dart';

class BuyerHomeScreen extends HookWidget {
  const BuyerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productVM = context.read<ProductsVM>();
    final sliderVM = context.read<SliderVM>();
    final cartVM = context.read<CartVM>();
    final searchController = useTextEditingController();

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        productVM.getProducts();
        sliderVM.getSlider();
        cartVM.getCart();
        Log.w(cartVM.getCart());
      });
      return () {};
    }, []);

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        HomeSearch(
          searchController: searchController,
        ).paddingOnly(
            right: AppSpaces.defaultPadding, left: AppSpaces.defaultPadding),
        context.largeGap,
        const HomeSlider(),
        context.mediumGap,
        HomeProductsGridView(
          searchController: searchController,
        ).paddingSymmetric(horizontal: AppSpaces.defaultPadding),
      ],
    );
  }
}

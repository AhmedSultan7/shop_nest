import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/screens/cart/view_model/cart_view_model.dart';
import 'package:cards_app/src/screens/home/view/buyer/widgets/top_section/home_slider.dart';
import 'package:cards_app/src/screens/home/view/buyer/widgets/top_section/main_home_search.dart';
import 'package:cards_app/src/screens/home/view_model/slider_view_model.dart';
import 'package:cards_app/src/screens/product/view/product_screen/widgets/home_products_grid_view.dart';
import 'package:cards_app/src/screens/product/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/app_spaces.dart';

class BuyerHomeScreen extends HookWidget {
  const BuyerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productVM = context.read<ProductVM>();
    final sliderVM = context.read<SliderVM>();
    final cartVM = context.read<CartVM>();
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        productVM.getProducts();
        sliderVM.getSlider();
        cartVM.getCart();
      });
      return () {};
    }, []);
    return ListView(
      children: [
        const HomeSearch().paddingOnly(
            right: AppSpaces.defaultPadding,
            left: AppSpaces.defaultPadding,
            top: AppSpaces.defaultPadding),
        context.largeGap,
        const HomeSlider(),
        context.mediumGap,
        const HomeProductsGridView()
            .paddingSymmetric(horizontal: AppSpaces.defaultPadding),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     const HomeCategoriesList(),
        //     context.largeGap,
        //     const ProductsGridView(),
        //   ],
        // ).paddingSymmetric(horizontal: AppSpaces.defaultPadding)
      ],
    );
  }
}
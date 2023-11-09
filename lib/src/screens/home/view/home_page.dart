import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:cards_app/src/screens/home/view/widgets/products_grid_view.dart';
import 'package:cards_app/src/screens/home/view/widgets/top_section/home_slider.dart';
import 'package:cards_app/src/screens/home/view_model/slider_view_model.dart';
import 'package:cards_app/src/screens/product/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../../core/resources/app_spaces.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productVM = context.read<ProductVM>();
    final sliderVM = context.read<SliderVM>();
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        productVM.getProducts();
        sliderVM.getSlider();
      });
      return () {};
    }, []);
    return ListView(
      children: [
        BaseTextField(),
        // const HomeSearch().paddingOnly(
        //     right: AppSpaces.defaultPadding,
        //     left: AppSpaces.defaultPadding,
        //     top: AppSpaces.defaultPadding),
        context.largeGap,
        const HomeSlider(),
        context.mediumGap,
        const ProductsGridView()
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

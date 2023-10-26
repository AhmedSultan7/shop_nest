import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/screens/home/view/widgets/products_grid_view.dart';
import 'package:cards_app/src/screens/home/view/widgets/top_section/home_slider.dart';
import 'package:cards_app/src/screens/home/view/widgets/top_section/main_home_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/resources/app_spaces.dart';
import 'widgets/category_list_view.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final orderVM = context.read<OrderVM>();
    // useEffect(() {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     orderVM.getOrder(context);
    //   });
    //   return () {};
    // }, []);
    // ignore: prefer_const_constructors
    return Scaffold(
      body: ListView(
        children: [
          const HomeSearch().paddingOnly(
              right: AppSpaces.defaultPadding,
              left: AppSpaces.defaultPadding,
              top: AppSpaces.defaultPadding),
          context.largeGap,
          const HomeSlider(),
          context.mediumGap,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeCategoriesList(),
              context.largeGap,
              const ProductsGridView(),
            ],
          ).paddingSymmetric(horizontal: AppSpaces.defaultPadding)
        ],
      ),
    );
  }
}

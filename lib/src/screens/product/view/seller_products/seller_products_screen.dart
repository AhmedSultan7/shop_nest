import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../../../core/shared_widgets/shared_widgets.dart';
import '../../../cart/view_model/cart_view_model.dart';
import '../../../home/view_model/slider_view_model.dart';
import '../../view_model/product_view_model.dart';
import '../product_screen/widgets/product_card.dart';

class SellerProductsScreen extends HookWidget {
  const SellerProductsScreen({super.key});

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
        Consumer<ProductVM>(
          builder: (context, productVM, child) {
            if (productVM.isLoading) {
              return const LoadingWidget();
            }
            return GridView.builder(
              padding: const EdgeInsets.only(bottom: AppSpaces.defaultPadding),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: productVM.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                childAspectRatio: .50,
              ),
              itemBuilder: (_, index) => ProductCardWidget(
                product: productVM.products[index],
              ),
            ).paddingAll(AppSpaces.defaultPadding);
          },
        ),
      ],
    );
  }
}

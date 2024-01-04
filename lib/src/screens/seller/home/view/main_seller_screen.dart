import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/core/shared_widgets/slider_drawer_widget/slider_drawer_widget.dart';
import 'package:cards_app/src/screens/seller/home/view/widgets/seller_bottom_nav_bar.dart';
import 'package:cards_app/src/screens/seller/order/view/seller_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/app_spaces.dart';
import '../../../../core/utils/logger.dart';
import '../../product/view/add_products/add_product.dart';
import '../../product/view/product_screen/seller_products_screen.dart';
import '../../product/view_model/product_view_model.dart';
import '../view_model/bottom_nav_provider.dart';

class MainSellerScreen extends HookWidget {
  const MainSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productVM = context.read<ProductsVM>();
    final isBottomSheetOpened = useState(false);

    Widget addProductWithCloseButton(){
      return WillPopScope(
          onWillPop: () async{
            isBottomSheetOpened.value =false;
            return false;
          },
          child: Stack(
            children: [
              const AddProductScreen(),
              IconButton(onPressed: (){
                isBottomSheetOpened.value =false;
              }, icon: const Icon(Icons.close)),

            ],
          ));
    }
    useEffect(() {
        productVM.getProducts();
      return () {};
    }, []);
    return Consumer<SellerBottomNavbarVM>(
      builder: (context, bottomNavbarVM, child) {
        return Scaffold(
          body: SliderDrawerWidget(
            title: _sellerSelectedTitle(bottomNavbarVM.currentIndex, context),
            child: _SellerSelectedScreen(
              currentIndex: bottomNavbarVM.currentIndex,
            ),
          ),
          bottomNavigationBar: const SellerBottomNavBar(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: bottomNavbarVM.currentIndex == 0
              ? !isBottomSheetOpened.value
                  ? SizedBox(
                      width: 100.w,
                      child: FloatingActionButton(
                        backgroundColor: ColorManager.primaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(context.tr.addProduct,
                                style: context.whiteLabelLarge),
                            const Icon(Icons.add, color: Colors.white),
                          ],
                        ),
                        onPressed: () {
                          isBottomSheetOpened.value =
                              !isBottomSheetOpened.value;
                        },
                      ),
                    )
                  : null
              : null,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          bottomSheet: isBottomSheetOpened.value ? addProductWithCloseButton() : null,
        );
      },
    );


  }


}




// * Seller ==================================================
class _SellerSelectedScreen extends StatelessWidget {
  final int currentIndex;

  const _SellerSelectedScreen({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (currentIndex) {
      case 0:
        return const SellerProductsScreen();
      case 1:
        return const SellerOrderScreen();
      case 2:
    }
    return const SizedBox.shrink();
  }
}

String _sellerSelectedTitle(int currentIndex, BuildContext context) {
  switch (currentIndex) {
    case 0:
      return context.tr.yourProducts;
    case 1:
      return context.tr.orders;
  }
  return context.tr.orders;
}

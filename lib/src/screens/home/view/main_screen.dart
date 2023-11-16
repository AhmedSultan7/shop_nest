import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/shared_widgets/slider_drawer_widget/slider_drawer_widget.dart';
import 'package:cards_app/src/screens/auth/model/user_model.dart';
import 'package:cards_app/src/screens/auth/view_model/auth_view_model.dart';
import 'package:cards_app/src/screens/cart/view/cart_screen.dart';
import 'package:cards_app/src/screens/history/view/history_screen.dart';
import 'package:cards_app/src/screens/home/view/seller/seller_home_screen.dart';
import 'package:cards_app/src/screens/product/view/seller_products/seller_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/shared_widgets/home_navigations/bottom_nav_bar_widget.dart';
import '../view_model/bottom_nav_provider.dart';
import 'buyer/buyer_home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<BottomNavbarVM, AuthVM>(
      builder: (context, bottomNavbarVM, authVM, child) {
        final isBuyer = authVM.user.usertype == UserTypeEnum.buyer;
        return Scaffold(
          body: SliderDrawerWidget(
            title: isBuyer
                ? _buyerSelectedTitle(bottomNavbarVM.currentIndex, context)
                : _sellerSelectedTitle(bottomNavbarVM.currentIndex, context),
            child: isBuyer
                ? _BuyerSelectedScreen(
                    currentIndex: bottomNavbarVM.currentIndex,
                  )
                : _SellerSelectedScreen(
                    currentIndex: bottomNavbarVM.currentIndex,
                  ),
          ),
          bottomNavigationBar: const BottomNavBarWidget(),

          //
          // floatingActionButtonLocation:
          // FloatingActionButtonLocation.miniCenterDocked,
          // floatingActionButton: SizedBox(
          //   width: 100.w,
          //   child: FloatingActionButton(
          //     backgroundColor: ColorManager.primaryColor,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text(context.tr.addProduct, style: context.whiteLabelLarge),
          //         const Icon(Icons.add, color: Colors.white),
          //       ],
          //     ),
          //     onPressed: () {
          //       showModalBottomSheet(
          //           isScrollControlled: true,
          //           context: context,
          //           builder: (context) => Container(
          //             margin:
          //             const EdgeInsets.all(AppSpaces.defaultPadding),
          //             height: MediaQuery.of(context).size.height * 0.75,
          //             child: const AddProductScreen(),
          //           ));
          //     },
          //   ),
          // ),
          // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        );
      },
    );
  }
}

// * Buyer ==================================================
class _BuyerSelectedScreen extends StatelessWidget {
  final int currentIndex;

  const _BuyerSelectedScreen({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (currentIndex) {
      case 0:
        return const BuyerHomeScreen();
      case 1:
        return const CartScreen();
      case 2:
        return const HistoryScreen();
    }
    return const SizedBox.shrink();
  }
}

String _buyerSelectedTitle(int currentIndex, BuildContext context) {
  switch (currentIndex) {
    case 0:
      return context.tr.home;
    case 1:
      return context.tr.cart;
    case 2:
      return context.tr.history;
  }
  return context.tr.home;
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
        return const SellerOrderScreen();
      case 1:
        return const SellerProductsScreen();
      case 2:
    }
    return const SizedBox.shrink();
  }
}

String _sellerSelectedTitle(int currentIndex, BuildContext context) {
  switch (currentIndex) {
    case 0:
      return context.tr.orders;
    case 1:
      return context.tr.yourProducts;
  }
  return context.tr.orders;
}

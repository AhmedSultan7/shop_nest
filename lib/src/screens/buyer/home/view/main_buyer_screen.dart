import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/shared_widgets/slider_drawer_widget/slider_drawer_widget.dart';
import 'package:cards_app/src/screens/buyer/home/view/widgets/buyer_bottom_nav_bar.dart';
import 'package:cards_app/src/screens/buyer/order_history/view/order_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../seller/home/view_model/bottom_nav_provider.dart';
import '../../cart/view/cart_screen.dart';
import 'buyer_home_screen.dart';

class MainBuyerScreen extends StatefulWidget {
  const MainBuyerScreen({super.key});

  @override
  State<MainBuyerScreen> createState() => _MainBuyerScreenState();
}

class _MainBuyerScreenState extends State<MainBuyerScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavbarVM>(
      builder: (context, bottomNavbarVM, child) {
        return Scaffold(
          body: SliderDrawerWidget(
            title: _buyerSelectedTitle(bottomNavbarVM.currentIndex, context),
            child: _BuyerSelectedScreen(
              currentIndex: bottomNavbarVM.currentIndex,
            ),
          ),
          bottomNavigationBar: const BuyerBottomNavBar(),
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
        return const OrderHistoryScreen();
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

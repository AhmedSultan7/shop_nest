import 'package:cards_app/src/screens/cart/view/cart_screen.dart';
import 'package:cards_app/src/screens/history/view/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/shared_widgets/appbar/main_appbar.dart';
import '../../../core/shared_widgets/home_navigations/bottom_nav_bar_widget.dart';
import '../../drawer/home_drawer.dart';
import '../view_model/bottom_nav_provider.dart';
import 'home_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<BottomNavbarVM, int>(
      selector: (context, provider) => provider.currentIndex,
      builder: (context, currentIndex, child) {
        return Scaffold(
          appBar: MainAppBar(
            title: selectedTitle(currentIndex, context),
          ),
          body: _SelectedScreen(
            currentIndex: currentIndex,
          ),
          bottomNavigationBar: const BottomNavBarWidget(),
          drawer: const HomeDrawer(),
        );
      },
    );
  }
}

String selectedTitle(int currentIndex, BuildContext context) {
  switch (currentIndex) {
    case 0:
      return 'Home';
    case 1:
      return 'Cart';
    case 2:
      return 'History';
  }
  return 'Home';
}

class _SelectedScreen extends StatelessWidget {
  final int currentIndex;

  const _SelectedScreen({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const CartScreen();
      case 2:
        return const HistoryScreen();
    }
    return const SizedBox.shrink();
  }
}

import 'package:cards_app/src/screens/cart/view/cart_screen.dart';
import 'package:cards_app/src/screens/history/view/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:provider/provider.dart';

import '../../../core/shared_widgets/home_navigations/bottom_nav_bar_widget.dart';
import '../../drawer/home_drawer.dart';
import '../view_model/bottom_nav_provider.dart';
import 'home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
    return Selector<BottomNavbarVM, int>(
      selector: (context, provider) => provider.currentIndex,
      builder: (context, currentIndex, child) {
        return Scaffold(
          body: SliderDrawer(
            slideDirection: SlideDirection.RIGHT_TO_LEFT,
            key: _key,
            appBar: SliderAppBar(
                // title: Text(selectedTitle(currentIndex, context)),
                ),
            slider: const HomeDrawer(),
            child: _SelectedScreen(
              currentIndex: currentIndex,
            ),
          ),
          bottomNavigationBar: const BottomNavBarWidget(),
        );
      },
    );
  }
}

// String selectedTitle(int currentIndex, BuildContext context) {
//   switch (currentIndex) {
//     case 0:
//       return context.tr.home;
//     case 1:
//       return context.tr.cart;
//     case 2:
//       return context.tr.history;
//   }
//   return context.tr.home;
// }

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

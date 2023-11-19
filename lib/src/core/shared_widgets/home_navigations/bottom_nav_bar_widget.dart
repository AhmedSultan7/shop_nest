import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../screens/seller/home/view_model/bottom_nav_provider.dart';

class BottomNavBarWidget extends StatelessWidget {
  final List<BottomNavigationBarItem> items;

  const BottomNavBarWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavbarVM>(builder: (context, bottomNavbarVM, child) {
      return BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: ColorManager.primaryColor),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
        ),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorManager.primaryColor,

        elevation: 0,
        backgroundColor: ColorManager.backgroundColor,
        unselectedItemColor: Theme.of(context).focusColor.withOpacity(1),
        currentIndex: bottomNavbarVM.currentIndex,
        // widget.currentTab,
        onTap: (index) {
          bottomNavbarVM.setCurrentIndex(index);
        },
        // this will be set when a new tab is tapped
        items: items,
      );
    });
  }
}

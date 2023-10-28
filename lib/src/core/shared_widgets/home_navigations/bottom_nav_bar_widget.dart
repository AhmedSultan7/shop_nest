import 'package:cards_app/generated/assets.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/core/shared_widgets/icon_widget/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../screens/home/view_model/bottom_nav_provider.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavbarVM>(
      builder: (context, bottomNavbarVM, child) {
        return BottomNavigationBar(
          selectedLabelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: ColorManager.primaryColor),
          unselectedLabelStyle: TextStyle(
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
          items: [
            BottomNavigationBarItem(
              icon: IconWidget(
                  color: bottomNavbarVM.currentIndex == 0
                      ? ColorManager.primaryColor
                      : ColorManager.black,
                  icon: Assets.iconsHome),
              label: context.tr.home,
            ),
            BottomNavigationBarItem(
              icon: IconWidget(
                  color: bottomNavbarVM.currentIndex == 1
                      ? ColorManager.primaryColor
                      : ColorManager.black,
                  icon: Assets.iconsCart),
              label: context.tr.cart,
            ),
            BottomNavigationBarItem(
              icon: IconWidget(
                  color: bottomNavbarVM.currentIndex == 2
                      ? ColorManager.primaryColor
                      : ColorManager.black,
                  icon: Assets.iconsHistory),
              label: context.tr.history,
            ),
          ],
        );
      },
    );
  }
}

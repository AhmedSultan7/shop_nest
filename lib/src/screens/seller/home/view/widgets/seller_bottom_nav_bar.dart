import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/shared_widgets/home_navigations/bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../core/resources/theme/theme.dart';
import '../../../../../core/shared_widgets/icon_widget/icon_widget.dart';
import '../../../../seller/home/view_model/bottom_nav_provider.dart';

class SellerBottomNavBar extends StatelessWidget {
  const SellerBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellerBottomNavbarVM>(
      builder: (context, bottomNavbarVM, child) {
        return BottomNavBarWidget(items: [
          BottomNavigationBarItem(
            icon: IconWidget(
                color: bottomNavbarVM.currentIndex == 0
                    ? ColorManager.primaryColor
                    : ColorManager.black,
                icon: Assets.iconsProduct),
            label: context.tr.yourProducts,
          ),
          BottomNavigationBarItem(
            icon: IconWidget(
                color: bottomNavbarVM.currentIndex == 1
                    ? ColorManager.primaryColor
                    : ColorManager.black,
                icon: Assets.iconsOrder),
            label: context.tr.orders,
          ),
        ]);
      },
    );
  }
}

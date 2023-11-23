import 'package:badges/badges.dart' as badges;
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/shared_widgets/home_navigations/bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../core/resources/theme/theme.dart';
import '../../../../../core/shared_widgets/icon_widget/icon_widget.dart';
import '../../../../auth/view_model/auth_view_model.dart';
import '../../../../seller/home/view_model/bottom_nav_provider.dart';
import '../../../cart/view_model/cart_view_model.dart';

class BuyerBottomNavBar extends StatelessWidget {
  const BuyerBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<BottomNavbarVM, CartVM, AuthVM>(
      builder: (context, bottomNavbarVM, cartVM, authVM, child) {
        final counter = cartVM.counter;
        return BottomNavBarWidget(items: [
          BottomNavigationBarItem(
            icon: IconWidget(
                color: bottomNavbarVM.currentIndex == 0
                    ? ColorManager.primaryColor
                    : ColorManager.black,
                icon: Assets.iconsHomeNew),
            label: context.tr.home,
          ),
          BottomNavigationBarItem(
            icon: badges.Badge(
              showBadge: counter == 0 ? false : true,
              position: badges.BadgePosition.topStart(top: -10.h),
              badgeContent: Text(
                counter.toString(),
                style: context.whiteHint,
              ),
              child: IconWidget(
                  color: bottomNavbarVM.currentIndex == 1
                      ? ColorManager.primaryColor
                      : ColorManager.black,
                  icon: Assets.iconsCartNew),
            ),
            label: context.tr.cart,
          ),
          BottomNavigationBarItem(
            icon: IconWidget(
                color: bottomNavbarVM.currentIndex == 2
                    ? ColorManager.primaryColor
                    : ColorManager.black,
                icon: Assets.iconsHistoryy),
            label: context.tr.history,
          ),
        ]);
      },
    );
  }
}

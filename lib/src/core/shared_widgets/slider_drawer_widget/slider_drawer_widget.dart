import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/screens/seller/home/view_model/bottom_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:provider/provider.dart';

import '../../../screens/auth/model/user_model.dart';
import '../../../screens/auth/view_model/auth_view_model.dart';
import '../../../screens/buyer/cart/view_model/cart_view_model.dart';
import '../../../screens/drawer/home_drawer.dart';
import '../../../screens/seller/product/view/add_products/add_product.dart';

class SliderDrawerWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const SliderDrawerWidget(
      {super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    GlobalKey<SliderDrawerState> drawerKey = GlobalKey<SliderDrawerState>();

    return Consumer<CartVM>(
      builder: (context, cartVM, cart) {
        final cartBottomNav = context.read<BottomNavbarVM>().currentIndex;
        final isBuyer =
            context.read<AuthVM>().user.usertype == UserTypeEnum.buyer;

        return SliderDrawer(
          isDraggable: true,
          slideDirection: SlideDirection.TOP_TO_BOTTOM,
          key: drawerKey,
          appBar: SliderAppBar(
            trailing: !isBuyer && cartBottomNav == 0
                ? IconButton(
                    onPressed: () {
                      context.to(const AddProductScreen());
                    },
                    icon: const Icon(Icons.add))
                : null,
            title: Text(
              title,
              style: context.title,
            ),
          ),
          slider: const HomeDrawer(),
          child: child,
        );
      },
    );
  }
}

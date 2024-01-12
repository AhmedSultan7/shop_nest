import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:provider/provider.dart';

import '../../../screens/buyer/cart/view_model/cart_view_model.dart';
import '../../../screens/drawer/home_drawer.dart';

class SliderDrawerWidget extends HookWidget {
  final String title;
  final Widget child;

  const SliderDrawerWidget(
      {super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final drawerKey = useMemoized(() => GlobalKey<SliderDrawerState>());
    return Consumer<CartVM>(
      builder: (context, cartVM, cart) {
        return SliderDrawer(
          isDraggable: true,
          slideDirection: SlideDirection.TOP_TO_BOTTOM,
          key: drawerKey,
          appBar: SliderAppBar(
            appBarHeight: 80.h,
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

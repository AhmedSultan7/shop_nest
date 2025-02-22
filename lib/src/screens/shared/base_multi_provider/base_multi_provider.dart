import 'package:cards_app/src/core/injector/injector.dart';
import 'package:cards_app/src/screens/buyer/order_history/view_model/order_view_model.dart';
import 'package:cards_app/src/screens/seller/home/view_model/bottom_nav_provider.dart';
import 'package:cards_app/src/screens/seller/product/view_model/product_view_model.dart';
import 'package:cards_app/src/screens/settings/view_model/setting_view_model.dart';
import 'package:cards_app/src/screens/shared/media/view_models/media_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../auth/view_model/auth_view_model.dart';
import '../../buyer/cart/view_model/cart_view_model.dart';
import '../../buyer/home/view_model/bottom_nav_provider.dart';
import '../../buyer/home/view_model/slider_view_model.dart';

class BaseMultiProvider extends StatelessWidget {
  final Widget child;

  const BaseMultiProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => getIt<SellerBottomNavbarVM>(),
        ),  ChangeNotifierProvider(
          create: (context) => getIt<BuyerBottomNavbarVM>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<SliderVM>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<ProductsVM>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<CartVM>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<SettingsVM>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<MediaVM>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<OrderVM>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<AuthVM>()..getUser(),
        ),
      ],
      child: child,
    );
  }
}

import 'package:cards_app/src/core/injector/injector.dart';
import 'package:cards_app/src/screens/auth/view_model/auth_view_model.dart';
import 'package:cards_app/src/screens/cart/view_model/cart_view_model.dart';
import 'package:cards_app/src/screens/home/view_model/slider_view_model.dart';
import 'package:cards_app/src/screens/product/view_model/product_view_model.dart';
import 'package:cards_app/src/screens/settings/view_model/setting_view_model.dart';
import 'package:cards_app/src/screens/shared/media/view_models/media_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/view_model/bottom_nav_provider.dart';

class BaseMultiProvider extends StatelessWidget {
  final Widget child;

  const BaseMultiProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => getIt<BottomNavbarVM>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<SliderVM>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<ProductVM>(),
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
          create: (context) => getIt<AuthVM>()..getUser(),
        ),
      ],
      child: child,
    );
  }
}

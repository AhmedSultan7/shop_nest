import 'package:cards_app/src/screens/home/view_model/slider_view_model.dart';
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
          create: (context) => BottomNavbarVM(),
        ),
        ChangeNotifierProvider(
          create: (context) => SliderVM(),
        ),
      ],
      child: child,
    );
  }
}

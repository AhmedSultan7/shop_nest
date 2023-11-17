import 'package:cards_app/src/core/consts/app_constants.dart';
import 'package:cards_app/src/core/resources/theme/theme_manager.dart';
import 'package:cards_app/src/screens/buyer/home/view/main_buyer_screen.dart';
import 'package:cards_app/src/screens/seller/home/view/main_seller_screen.dart';
import 'package:cards_app/src/screens/shared/base_multi_provider/base_multi_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'auth/view/login_screen/login_screen.dart';
import 'auth/view_model/auth_view_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseMultiProvider(
      child: Builder(builder: (context) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          theme: AppTheme.lightTheme(context),
          locale: AppConsts.locale,
          supportedLocales: AppConsts.supportedLocales,
          localizationsDelegates: AppConsts.localizationsDelegates,
          title: AppConsts.appName,
          home: Consumer<AuthVM>(
            builder: (context, authVM, child) {
              if (authVM.isLoggedIn) {
                if (!authVM.isSeller) {
                  return const MainSellerScreen();
                }

                return const MainBuyerScreen();
              }

              return const LoginScreen();
            },
          ),
        );
      }),
    );
  }
}

import 'package:cards_app/src/core/consts/app_constants.dart';
import 'package:cards_app/src/core/resources/theme/theme_manager.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:cards_app/src/core/utils/logger.dart';
import 'package:cards_app/src/screens/buyer/home/view/main_buyer_screen.dart';
import 'package:cards_app/src/screens/seller/home/view/main_seller_screen.dart';
import 'package:cards_app/src/screens/shared/base_multi_provider/base_multi_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'auth/view/login_screen/login_screen.dart';
import 'auth/view_model/auth_view_model.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenUtil.init(context);
  }


  @override
  Widget build(BuildContext context) {
    return BaseMultiProvider(
      child: MaterialApp(
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
              if(authVM.isLoading){
                return const Material(child: Center(child: LoadingWidget()));
              }

              if (authVM.isSeller) {
                return const MainSellerScreen();
              }

              return const MainBuyerScreen();
            }

            return const LoginScreen();
          },
        ),
      ),
    );
  }
}

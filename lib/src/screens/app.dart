import 'package:cards_app/src/core/consts/app_constants.dart';
import 'package:cards_app/src/core/resources/theme/theme_manager.dart';
import 'package:cards_app/src/screens/home/view/main_screen.dart';
import 'package:cards_app/src/screens/shared/multi_provider/multi_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          home: const MainScreen(),
        );
      }),
    );
  }
}

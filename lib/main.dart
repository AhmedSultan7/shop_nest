import 'package:cards_app/src/core/injector/injector.dart' as injector;
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';

import 'src/screens/app.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: ColorManager.white,
      statusBarIconBrightness: Brightness.dark
      // status bar color
      ));
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    //! Initialize Hive
    Hive.initFlutter(),

    //! Initialize Injector
    injector.appInjector(),

    FastCachedImageConfig.init(),
  ]);
  // await HiveHelper().openBox(boxName: AppConsts.cart);
  // await Hive.box(AppConsts.cart).clear();
  runApp(const MyApp());
}

import 'package:cards_app/src/core/injector/injector.dart' as injector;
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'src/screens/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    //! Initialize Hive
    Hive.initFlutter(),

    //! Initialize Injector
    injector.appInjector(),

    FastCachedImageConfig.init(),
  ]);
  // await HiveHelper().openBox(boxName: LocalKeys.userData);
  // await Hive.box(LocalKeys.userData).clear();
  runApp(const MyApp());
}

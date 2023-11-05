import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'src/screens/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await FastCachedImageConfig.init();
  // await HiveHelper().openBox(boxName: AppConsts.cart);
  // await Hive.box(AppConsts.cart).clear();
  runApp(const MyApp());
}

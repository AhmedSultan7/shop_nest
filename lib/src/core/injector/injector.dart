import 'package:cards_app/src/core/data/local/hive_helper.dart';
import 'package:cards_app/src/core/data/remote/network/network_api_service.dart';
import 'package:cards_app/src/screens/buyer/home/view_model/bottom_nav_provider.dart';
import 'package:cards_app/src/screens/buyer/order_history/repository/order_repo.dart';
import 'package:cards_app/src/screens/buyer/order_history/view_model/order_view_model.dart';
import 'package:cards_app/src/screens/seller/home/view_model/bottom_nav_provider.dart';
import 'package:cards_app/src/screens/seller/product/view_model/product_view_model.dart';
import 'package:cards_app/src/screens/settings/repository/settings_repo.dart';
import 'package:cards_app/src/screens/settings/view_model/setting_view_model.dart';
import 'package:cards_app/src/screens/shared/media/view_models/media_view_model.dart';
import 'package:get_it/get_it.dart';

import '../../screens/auth/repository/local_repo/auth_local_repo.dart';
import '../../screens/auth/repository/remote_repo/auth_remote_repo.dart';
import '../../screens/auth/view_model/auth_view_model.dart';
import '../../screens/buyer/cart/repository/local/cart_local_repo.dart';
import '../../screens/buyer/cart/view_model/cart_view_model.dart';
import '../../screens/buyer/home/repositories/slider_repo.dart';
import '../../screens/buyer/home/view_model/slider_view_model.dart';
import '../../screens/seller/product/repository/product_repo.dart';

final getIt = GetIt.instance;

Future<void> appInjector() async {
  // * Base Injector ===========================================

  getIt.registerLazySingleton(() => NetworkApiService());

  // * Hive Injector ===========================================

  getIt.registerLazySingleton(() => HiveHelper());

  // * Auth Injector ===========================================

  getIt.registerLazySingleton(
      () => AuthLocalRepo(hiveHelper: getIt<HiveHelper>()));

  getIt.registerLazySingleton(() => AuthRemoteRepo(
      networkApiServices: getIt<NetworkApiService>(),
      authLocalRepo: getIt<AuthLocalRepo>()));

  getIt.registerLazySingleton(() => AuthVM(
      authLocalRepo: getIt<AuthLocalRepo>(),
      authRemoteRepo: getIt<AuthRemoteRepo>()));

  // * Home Injector ===========================================

  //! BottomNavbar ----------------------------------------------------
  getIt.registerLazySingleton(() => SellerBottomNavbarVM());
  getIt.registerLazySingleton(() => BuyerBottomNavbarVM());

  //! Slider ------------------------------------------------------------
  getIt.registerLazySingleton(
      () => SlidersRepo(networkApiServices: getIt<NetworkApiService>()));

  getIt.registerLazySingleton(() => SliderVM(getIt<SlidersRepo>()));

  //! Product ----------------------------------------------------------
  getIt.registerLazySingleton(() => ProductRepo(
      networkApiServices: getIt<NetworkApiService>(),
      authLocalRepo: getIt<AuthLocalRepo>()));

  getIt.registerLazySingleton(() => ProductsVM(
      productRepo: getIt<ProductRepo>(),
      authLocalRepo: getIt<AuthLocalRepo>()));

  // * Cart Injector ===========================================

  getIt.registerLazySingleton(
      () => CartLocalRepository(hiveHelper: getIt<HiveHelper>()));

  getIt.registerLazySingleton(
      () => CartVM(cartLocalRepository: getIt<CartLocalRepository>()));

  // * Settings Injector ===========================================

  getIt.registerLazySingleton(() => SettingsRepo(getIt<NetworkApiService>()));

  getIt.registerLazySingleton(() => SettingsVM(getIt<SettingsRepo>()));

  // * Media Injector ===========================================

  getIt.registerLazySingleton(() => MediaVM());

  // * Order Injector ===========================================

  getIt.registerLazySingleton(() => OrderRepo(
      networkApiServices: getIt<NetworkApiService>(),
      authLocalRepo: getIt<AuthLocalRepo>()));
  getIt.registerLazySingleton(() => OrderVM(orderRepo: getIt<OrderRepo>()));
}

import 'package:cards_app/src/core/data/local/hive_helper.dart';
import 'package:cards_app/src/core/data/remote/network/network_api_service.dart';
import 'package:cards_app/src/screens/auth/repository/local_repo/auth_local_repo.dart';
import 'package:cards_app/src/screens/auth/repository/remote_repo/auth_remote_repo.dart';
import 'package:cards_app/src/screens/home/repositories/slider_repo.dart';
import 'package:cards_app/src/screens/home/view_model/bottom_nav_provider.dart';
import 'package:cards_app/src/screens/home/view_model/slider_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void appInjector() {
  // * Base Injector ===========================================
  getIt.registerLazySingleton(() => NetworkApiService());

  // * Auth Injector ===========================================
  getIt.registerLazySingleton(
      () => AuthLocalRepo(hiveHelper: getIt<HiveHelper>()));

  getIt.registerLazySingleton(() => AuthRepo(
      networkApiServices: getIt<NetworkApiService>(),
      authLocalRepo: getIt<AuthLocalRepo>()));

  // * Home Injector ===========================================
  //! BottomNavbar -----------------------------
  getIt.registerLazySingleton(() => BottomNavbarVM());

  //! Slider ------------------------------------
  getIt.registerLazySingleton(
      () => SlidersRepo(networkApiServices: getIt<NetworkApiService>()));

  getIt.registerLazySingleton(() => SliderVM(getIt<SlidersRepo>()));

  // * Cart Injector ===========================================
}
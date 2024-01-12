import 'dart:async';
import 'dart:io';

import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/screens/app.dart';
import 'package:cards_app/src/screens/auth/repository/local_repo/auth_local_repo.dart';
import 'package:cards_app/src/screens/auth/repository/remote_repo/auth_remote_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/data/local/hive_helper.dart';
import '../../../core/data/remote/app_exception.dart';
import '../../../core/utils/logger.dart';
import '../model/user_model.dart';
import '../view/login_screen/login_screen.dart';

class AuthVM extends ChangeNotifier {
  final AuthRemoteRepo authRemoteRepo;
  final AuthLocalRepo authLocalRepo;

  AuthVM({required this.authRemoteRepo, required this.authLocalRepo});

  bool _isLoading = false;
  bool isObscure = true;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //! Register User ================================
  Future<bool> registerUser({
    required Map<String, TextEditingController> controllers,
    required ValueNotifier valueNotifier,
  }) async {
    try {
      isLoading = true;
      final userModel = UserModel(
          email: controllers[ApiStrings.email]!.text,
          password: controllers[ApiStrings.password]!.text,
          userName: controllers[ApiStrings.username]!.text,
          usertype: valueNotifier.value);

      await authRemoteRepo.registerUser(userModel);
      getUser();
      isLoading = false;
      return true;
    } on FetchDataException {
      isLoading = false;
      rethrow;
    } on SocketException {
      isLoading = false;
    } on TimeoutException {
      isLoading = false;
    }
    return false;
  }

  //! Login ================================
  Future<bool> login({
    required Map<String, TextEditingController> controllers,
  }) async {
    try {
      isLoading = true;
      final userModel = UserModel(
        identifier: controllers[ApiStrings.identifier]!.text,
        password: controllers[ApiStrings.password]!.text,
      );
      await authRemoteRepo.login(userModel);
      getUser();
      isLoading = false;
      return true;
    } on FetchDataException catch (e) {
      Log.e('Fetch Data Exception ${e.toString()}');
      isLoading = false;
    } on SocketException {
      isLoading = false;
    } on TimeoutException {
      isLoading = false;
    }
    return false;
  }

  //! Update User ===============================
  Future<void> updateUser(BuildContext context,
      {required Map<String, TextEditingController> controllers}) async {
    try {
      isLoading = true;

      final userData = user.copyWith(
        id: user.id,
        userName: controllers[ApiStrings.username]!.text,
        email: controllers[ApiStrings.email]!.text,
        password: controllers[ApiStrings.password]!.text,
        usertype: user.usertype,
      );

      final updatedUser = _userModel?.copyWith(user: userData);

      await authRemoteRepo.updateUser(userData, id: user.id!);

      await authLocalRepo.putUserData(updatedUser!.toJson());

      getUser();

      isLoading = false;

      if (context.mounted) {
        context.to(const MyApp());
      }
    } on FetchDataException catch (e) {
      Log.e('Fetch Data Exception ${e.toString()}');
      isLoading = false;
    } on SocketException {
      isLoading = false;
    } on TimeoutException {
      isLoading = false;
    }
  }

  MainUserModel? _userModel;

  UserModel get user => _userModel?.user ?? UserModel.empty();

  bool get isLoggedIn => _userModel != MainUserModel.empty();

  bool get isSeller => user.usertype == UserTypeEnum.seller;

  void getUser() async {
    isLoading = true;
    _userModel = await authLocalRepo.getUserData();
    isLoading = false;

    notifyListeners();
  }

  void isObscurePassword() {
    isObscure = !isObscure;
    notifyListeners();
  }

  //! Logout
  void logout(BuildContext context) {
    HiveHelper().clearAllData();
    context.toReplacement(const LoginScreen());
  }
}

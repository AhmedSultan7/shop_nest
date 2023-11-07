import 'dart:async';
import 'dart:io';

import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/screens/auth/repository/local_repo/auth_local_repo.dart';
import 'package:cards_app/src/screens/auth/repository/remote_repo/auth_remote_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/data/remote/app_exception.dart';
import '../../../core/utils/logger.dart';
import '../model/user_model.dart';

class AuthVM extends ChangeNotifier {
  final AuthRepo _authRepo;
  final AuthLocalRepo _authLocalRepo;

  AuthVM(this._authRepo, this._authLocalRepo);

  bool _isLoading = false;
  bool isObscure = false;

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
      final userModel = User(
          email: controllers[ApiStrings.email]!.text,
          password: controllers[ApiStrings.password]!.text,
          userName: controllers[ApiStrings.username]!.text,
          usertype: valueNotifier.value);

      await _authRepo.registerUser(userModel);
      getUser();
      isLoading = false;
      return true;
    } on FetchDataException catch (e) {
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
      final userModel = User(
        identifier: controllers[ApiStrings.identifier]!.text,
        password: controllers[ApiStrings.password]!.text,
      );
      await _authRepo.login(userModel);
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

  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  void getUser() async {
    _userModel = await _authLocalRepo.getUserData();

    notifyListeners();
  }

  void isObscurePassword() {
    isObscure = !isObscure;
    notifyListeners();
  }
}

import 'dart:async';

import 'package:cards_app/src/core/data/remote/network/base_api_service.dart';
import 'package:cards_app/src/screens/auth/repository/local_repo/auth_local_repo.dart';

import '../../../../core/data/remote/app_exception.dart';
import '../../../../core/data/remote/response/api_end_points.dart';
import '../../model/user_model.dart';

class AuthRepo {
  final BaseApiServices networkApiServices;
  final AuthLocalRepo authLocalRepo;

  AuthRepo({required this.networkApiServices, required this.authLocalRepo});

  //! Register User =================================
  Future<void> registerUser(User user) async {
    try {
      final response = await networkApiServices
          .postResponse(ApiEndPoints.register, data: user.toJson());

      await authLocalRepo.setUserData(response);
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  //! Login User =================================
  Future<void> login(User user) async {
    try {
      final response = await networkApiServices.postResponse(ApiEndPoints.login,
          data: user.toJson());

      await authLocalRepo.setUserData(response);
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

//! Update User ===============================
  Future<void> updateUser(User user) async {
    try {
      await networkApiServices.putResponse(ApiEndPoints.user,
          data: user.toJson());
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }
}

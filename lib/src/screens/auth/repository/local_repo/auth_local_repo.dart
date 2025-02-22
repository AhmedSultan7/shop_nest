import 'package:cards_app/src/core/data/local/hive_helper.dart';
import 'package:cards_app/src/core/data/local/local_keys.dart';
import 'package:cards_app/src/core/data/remote/app_exception.dart';

import '../../model/user_model.dart';

class AuthLocalRepo {
  final HiveHelper hiveHelper;

  AuthLocalRepo({required this.hiveHelper});

  //! Set User Data ====================================
  Future<void> setUserData(Map<String, dynamic> user) async {
    try {
      await hiveHelper.setData(LocalKeys.userData, data: user);
    } on Exception {
      throw AppException('Error When Save Register Data');
    }
  }

  //! Put User Data ====================================
  Future<void> putUserData(Map<String, dynamic> user) async {
    try {
      await hiveHelper.putData(key: 0, LocalKeys.userData, data: user);
    } on Exception {
      throw AppException('Error When Save Register Data');
    }
  }

  //! Clear User Data ====================================
  Future<void> clearUserData() async {
    try {
      await hiveHelper.clear(LocalKeys.userData);
    } on Exception {
      throw AppException('Error When Clear User Data');
    }
  }

  //! Get User Data ===========================================
  Future<MainUserModel> getUserData() async {
    try {
      final userData = await hiveHelper.getData(boxName: LocalKeys.userData);

      final userMap = userData.values.firstOrNull;

      if (userMap == null) return MainUserModel.empty();

      final user = MainUserModel.fromJson(userMap);

      return user;
    } on Exception {
      throw AppException('Error When Get User Data');
    }
  }
}

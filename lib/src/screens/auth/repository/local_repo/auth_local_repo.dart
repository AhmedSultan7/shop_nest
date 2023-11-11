import 'package:cards_app/src/core/data/local/hive_helper.dart';
import 'package:cards_app/src/core/data/local/local_keys.dart';
import 'package:cards_app/src/screens/auth/model/user_model.dart';

import '../../../../core/data/remote/app_exception.dart';

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

  //! Get User Data ===========================================
  Future<UserModel> getUserData() async {
    try {
      final userData = await hiveHelper.getData(boxName: LocalKeys.userData);

      final userMap = userData.values.firstOrNull;

      if (userMap == null) return UserModel.empty();

      final user = UserModel.fromJson(userMap);

      return user;
    } on Exception {
      throw AppException('Error When Get User Data');
    }
  }
}
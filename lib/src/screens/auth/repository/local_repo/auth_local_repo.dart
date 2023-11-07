import 'package:cards_app/src/core/data/local/hive_helper.dart';
import 'package:cards_app/src/core/data/local/local_keys.dart';
import 'package:cards_app/src/screens/auth/model/user_model.dart';

import '../../../../core/data/remote/app_exception.dart';

class AuthLocalRepo {
  final HiveHelper _hiveHelper;

  AuthLocalRepo(this._hiveHelper);

  //! Set User Data ====================================
  Future<void> setUserData(Map<String, dynamic> user) async {
    try {
      await _hiveHelper.setData(LocalKeys.userData, data: user);
    } on Exception {
      throw AppException('Error When Save Register Data');
    }
  }

  //! Get User Data ===========================================
  Future<UserModel> getUserData() async {
    try {
      final userData = await _hiveHelper.getData(boxName: LocalKeys.userData);

      final userMap = userData.values.firstOrNull ?? {};

      final user = UserModel.fromJson(userMap);
      return user;
    } on Exception {
      throw AppException('Error When Get User Data');
    }
  }
}

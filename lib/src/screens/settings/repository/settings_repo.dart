import 'dart:async';

import 'package:cards_app/src/core/data/remote/app_exception.dart';
import 'package:cards_app/src/core/data/remote/network/base_api_service.dart';
import 'package:cards_app/src/core/data/remote/response/api_end_points.dart';
import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/screens/settings/model/settings_model.dart';

class SettingsRepo {
  final BaseApiServices _networkApiServices;

  SettingsRepo(this._networkApiServices);

  //! Get Settings ================================

  Future<SettingsModel> getSettings() async {
    try {
      final response =
          await _networkApiServices.getResponse(ApiEndPoints.setting);
      final settingsData = SettingsModel.fromJson(response[ApiStrings.data]);
      return settingsData;
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }
}

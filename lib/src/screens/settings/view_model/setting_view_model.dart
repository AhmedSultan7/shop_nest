import 'dart:async';
import 'dart:io';

import 'package:cards_app/src/screens/settings/model/settings_model.dart';
import 'package:cards_app/src/screens/settings/repository/settings_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/data/remote/app_exception.dart';
import '../../../core/utils/logger.dart';

class SettingsVM extends ChangeNotifier {
  final SettingsRepo _settingsRepo;

  SettingsVM(this._settingsRepo);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  SettingsModel settings = SettingsModel.empty();

  //! Get Settings ================================
  Future<void> getSettings() async {
    try {
      isLoading = true;
      settings = await _settingsRepo.getSettings();
      isLoading = false;
    } on FetchDataException catch (e) {
      Log.e('Fetch Data Exception ${e.toString()}');
      isLoading = false;
    } on SocketException {
      isLoading = false;
    } on TimeoutException {
      isLoading = false;
    }
  }
}

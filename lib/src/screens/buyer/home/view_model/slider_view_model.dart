import 'dart:async';
import 'dart:io';

import 'package:cards_app/src/core/utils/logger.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/data/remote/app_exception.dart';
import '../models/slider_model.dart';
import '../repositories/slider_repo.dart';

class SliderVM extends ChangeNotifier {
  final SlidersRepo _slidersRepo;

  SliderVM(this._slidersRepo);

  List<SliderModel> sliders = [];
  bool isLoading = false;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  //! Get Slider =====================================
  Future<void> getSlider() async {
    try {
      isLoading = true;
      sliders = await _slidersRepo.getSliders();
      isLoading = false;
      notifyListeners();
    } on FetchDataException catch (e) {
      Log.e('Fetch Data Exception ${e.toString()}');
      isLoading = false;
    } on SocketException {
      isLoading = false;
    } on TimeoutException {
      isLoading = false;
    }
  }

  //! Open Slider Url ================================
  Future<void> openSliderUrl(String? url) async {
    try {
      await _slidersRepo.openSliderUrl(url);
    } on AppException catch (e) {
      Log.e(e.toString());
    }
  }
}

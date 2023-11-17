import 'dart:async';

import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/data/remote/app_exception.dart';
import '../../../../core/data/remote/network/base_api_service.dart';
import '../../../../core/data/remote/response/api_end_points.dart';
import '../models/slider_model.dart';

class SlidersRepo {
  final BaseApiServices networkApiServices;

  SlidersRepo({required this.networkApiServices});

  //! Get Sliders ================================
  Future<List<SliderModel>> getSliders() async {
    try {
      final response =
          await networkApiServices.getResponse(ApiEndPoints.sliders);

      final sliders = (response[ApiStrings.data] as List)
          .map((slider) => SliderModel.fromJson(slider))
          .toList();

      return sliders;
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

//! Open Slider Url ================================
  Future<void> openSliderUrl(String? url) async {
    try {
      final link = Uri.parse(url ?? '');

      await launchUrl(link);
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }
}

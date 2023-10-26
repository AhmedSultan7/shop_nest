import '../../../core/data/remote/network/base_api_service.dart';

class SlidersRepo {
  final BaseApiServices networkApiServices;

  SlidersRepo({required this.networkApiServices});

  // //! Get Sliders ================================
  // Future<List<SliderModel>> getSliders() async {
  //   try {
  //     final response =
  //         await networkApiServices.getResponse(ApiEndPoints.sliders);
  //
  //     final sliders = compute(SliderModel.responseToSliderModel, response);
  //
  //     return sliders;
  //   } on FetchDataException {
  //     rethrow;
  //   } on TimeoutException {
  //     rethrow;
  //   }
  // }
  //
  // //! Open Slider Url ================================
  // Future<void> openSliderUrl(String? url) async {
  //   try {
  //     final link = Uri.parse(url ?? '');
  //
  //     if (await canLaunchUrl(link)) {
  //       await launchUrl(link);
  //     } else {
  //       throw AppException(ApiMessages.errorOccurred);
  //     }
  //   } on FetchDataException {
  //     rethrow;
  //   } on TimeoutException {
  //     rethrow;
  //   }
  // }
}

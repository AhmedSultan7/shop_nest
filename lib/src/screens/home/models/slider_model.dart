import 'package:cards_app/generated/assets.dart';

class SliderModel {
  final String? title;
  final String? image;
  final String? url;

  SliderModel({this.title, this.image, this.url});

  static List<SliderModel> slider = [
    SliderModel(title: 'Slider 1', image: Assets.imagesApex),
    SliderModel(title: 'Slider 2', image: Assets.imagesApex),
    SliderModel(title: 'Slider 3', image: Assets.imagesApex),
  ];

  // factory SliderModel.fromJson(Map<String, dynamic> json) {
  //   return SliderModel(
  //     title: json[ApiStrings.title],
  //     image: json[ApiStrings.image],
  //     url: json[ApiStrings.url],
  //   );
  // }
  //
  // static List<SliderModel> responseToSliderModel(dynamic response) {
  //   final data = response[ApiStrings.banners];
  //
  //   final sliders = List<SliderModel>.from(
  //     data.map(
  //       (model) => SliderModel.fromJson(model),
  //     ),
  //   );
  //
  //   return sliders;
  // }
}

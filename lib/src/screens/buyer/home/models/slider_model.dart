import '../../../../core/data/remote/response/api_strings.dart';
import '../../../shared/media/model/main_media_model.dart';

class SliderModel {
  final String? title;
  final MainMediaModel? image;
  final String? url;

  SliderModel({this.image, required this.url, required this.title});

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    final attributes = json[ApiStrings.attributes];
    final image = attributes[ApiStrings.image] != null
        ? MainMediaModel.fromJson(attributes[ApiStrings.image])
        : null;

    return SliderModel(
      title: attributes[ApiStrings.title],
      image: image,
      url: attributes[ApiStrings.url],
    );
  }
}

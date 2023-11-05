import '../../../../core/data/remote/response/api_strings.dart';

class MainMediaModel {
  final String url;

  MainMediaModel({
    required this.url,
  });

  //! Remote Constructor---------------------------------------
  factory MainMediaModel.fromJson(Map<String, dynamic> json) {
    const data = ApiStrings.data;
    const attributes = ApiStrings.attributes;
    final imageData = json[data][attributes];
    return MainMediaModel(url: imageData[ApiStrings.url] ?? '');
  }

  //! Local Constructor---------------------------------------
  factory MainMediaModel.fromLocalJson(Map<dynamic, dynamic> json) {
    return MainMediaModel(url: json[ApiStrings.url] ?? '');
  }

  factory MainMediaModel.empty() => MainMediaModel(url: '');

  Map<String, dynamic> toMap() {
    return {ApiStrings.url: url};
  }
}

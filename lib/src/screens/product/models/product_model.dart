import 'package:cards_app/src/screens/shared/media/model/main_media_model.dart';

import '../../../core/data/remote/response/api_strings.dart';

class ProductModel {
  final int id;
  final String? name;
  final String? description;
  final num? price;
  final MainMediaModel? image;

  ProductModel(
      {required this.price,
      this.image,
      required this.name,
      required this.id,
      required this.description});

  //! Remote Constructor---------------------------------------
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final attributes = json[ApiStrings.attributes];
    return ProductModel(
      id: json[ApiStrings.id],
      name: attributes[ApiStrings.name] ?? '',
      description: attributes[ApiStrings.description] ?? '',
      price: attributes[ApiStrings.price] ?? 0,
      image: MainMediaModel.fromJson(
        attributes[ApiStrings.image],
      ),
    );
  }

  //! Local Constructor---------------------------------------
  factory ProductModel.fromLocalJson(Map<dynamic, dynamic> json) {
    return ProductModel(
      id: json[ApiStrings.id],
      name: json[ApiStrings.name] ?? '',
      description: json[ApiStrings.description] ?? '',
      price: json[ApiStrings.price] ?? 0,
      image: MainMediaModel.fromLocalJson(
        json[ApiStrings.image],
      ),
    );
  }

  Map toLocalJson() => {
        'id': id,
        'title': name,
        'image': image!.toMap(),
        'price': price,
      };
}

import 'package:cards_app/src/screens/shared/media/model/main_media_model.dart';

import '../../../core/data/remote/response/api_strings.dart';

class ProductModel {
  final int? id;
  final String? name;
  final String? description;
  final num? price;
  final MainMediaModel? image;

  ProductModel({this.price, this.image, this.name, this.id, this.description});

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

  //! Empty Constructor---------------------------------------
  factory ProductModel.empty() {
    return ProductModel(
      id: 0,
      name: null,
      description: null,
      price: null,
      image: MainMediaModel.empty(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) ApiStrings.id: id,
      if (name != null) ApiStrings.name: name,
      if (description != null) ApiStrings.description: description,
      if (price != null) ApiStrings.price: price,
    };
  }

  Map toLocalJson() => {
        'id': id,
        ApiStrings.name: name,
        ApiStrings.description: description,
        'image': image!.toMap(),
        'price': price,
      };
}

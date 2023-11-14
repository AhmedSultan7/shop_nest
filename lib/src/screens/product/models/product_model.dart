import 'package:cards_app/src/screens/shared/media/model/main_media_model.dart';

import '../../../core/data/remote/response/api_strings.dart';

class ProductModel {
  final int? id;
  final String? name;
  final String? description;
  final int? price;
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

  Map toLocalJson() => {
        'id': id,
        ApiStrings.name: name,
        ApiStrings.description: description,
        'image': image!.toMap(),
        'price': price,
      };
}

import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/screens/auth/model/user_model.dart';
import 'package:cards_app/src/screens/seller/product/models/product_model.dart';

class OrderModel {
  final int id;
  final num totalPrice;
  final ProductModel? product;
  final UserModel? user;

  OrderModel({
    required this.id,
    required this.totalPrice,
    required this.product,
    required this.user,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final product = json[ApiStrings.products] != null
        ? ProductModel.fromJson(json[ApiStrings.products])
        : null;

    final user = json[ApiStrings.products] != null
        ? UserModel.fromJson(json[ApiStrings.user])
        : null;
    return OrderModel(
      id: json[ApiStrings.id],
      totalPrice: json[ApiStrings.totalPrice],
      product: product,
      user: user,
    );
  }
}

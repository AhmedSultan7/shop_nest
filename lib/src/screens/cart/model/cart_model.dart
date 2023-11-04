import '../../product/models/product_model.dart';

class CartModel {
  final int id;
  final int quantity;
  final ProductModel product;

  CartModel({
    required this.id,
    required this.quantity,
    required this.product,
  });

  //! Local Constructor---------------------------------------
  factory CartModel.fromLocal(Map<dynamic, dynamic> json) {
    return CartModel(
      id: json['id'],
      quantity: json['quantity'],
      product: ProductModel.fromLocalJson(json['product']),
    );
  }

  Map toLocalJson() =>
      {'id': id, 'quantity': quantity, 'product': product.toLocalJson()};
}

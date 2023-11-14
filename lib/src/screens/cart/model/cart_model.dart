import '../../product/models/product_model.dart';

class CartModel {
  final int id;
  final int key;
  final int quantity;
  final ProductModel product;

  CartModel({
    required this.id,
    required this.key,
    required this.quantity,
    required this.product,
  });

  //! Local Constructor---------------------------------------
  factory CartModel.fromLocal(Map<dynamic, dynamic> json) {
    return CartModel(
      key: json['key'],
      id: json['id'],
      quantity: json['quantity'],
      product: ProductModel.fromLocalJson(json['product']),
    );
  }

  Map toLocalJson() => {
        'id': id,
        'quantity': quantity,
        'key': key,
        'product': product.toLocalJson()
      };
}

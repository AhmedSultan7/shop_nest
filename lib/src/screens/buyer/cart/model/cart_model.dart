import '../../../seller/product/models/product_model.dart';

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
  factory CartModel.fromLocal(int id, Map<dynamic, dynamic> json) {
    return CartModel(
      id: id,
      quantity: json['quantity'],
      product: ProductModel.fromLocalJson(json['product']),
    );
  }

  Map toLocalJson() =>
      {'id': id, 'quantity': quantity, 'product': product.toLocalJson()};

  //! Copy With ---------------------------------------
  CartModel copyWith({
    int? id,
    int? key,
    int? quantity,
    ProductModel? product,
  }) {
    return CartModel(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
    );
  }
}

import 'package:cards_app/src/screens/cart/model/cart_model.dart';
import 'package:cards_app/src/screens/cart/repository/local/cart_local_repo.dart';
import 'package:flutter/cupertino.dart';

class CartVM extends ChangeNotifier {
  final CartLocalRepository cartLocalRepository;

  List<CartModel> cart = [];

  CartVM({required this.cartLocalRepository});

//! Add to cart ======================================
  Future<void> addProductsToCart({required CartModel cart}) async {
    await cartLocalRepository.addProductToCart(cart: cart);
    notifyListeners();
  }

  //! Get Cart  ======================================
  Future<void> getCart() async {
    cart = await cartLocalRepository.getCart();

    notifyListeners();
  } //! delete Cart  ======================================

  Future<void> deleteFromCart({required int index}) async {
    await cartLocalRepository.deleteFromCart(index: index);
    getCart();
    notifyListeners();
  }
}

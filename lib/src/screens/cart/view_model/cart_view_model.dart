import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/utils/logger.dart';
import 'package:cards_app/src/screens/cart/model/cart_model.dart';
import 'package:cards_app/src/screens/cart/repository/local/cart_local_repo.dart';
import 'package:flutter/cupertino.dart';

class CartVM extends ChangeNotifier {
  final CartLocalRepository cartLocalRepository;

  int counter = 0;
  List<CartModel> cartList = [];

  CartVM({required this.cartLocalRepository});

  //! Get Cart  ======================================
  Future<void> getCart() async {
    cartList = await cartLocalRepository.getCart();

    counter = cartList.length;

    notifyListeners();
  }

//! Add to cart ======================================
  Future<void> addProductsToCart(
    BuildContext context, {
    required CartModel cart,
  }) async {
    try {
      Log.e(cartList);

      await cartLocalRepository.addProductToCart(cart: cart);

      getCart();

      if (context.mounted) {
        context.showFlushBar(
          type: FlushBarType.add,
        );
      }
      notifyListeners(); //! TODO-Check Why another notifyListeners() here ?, getCart() Already have it
    } catch (e) {
      if (context.mounted) {
        context.showFlushBar(
          type: FlushBarType.error,
        );
      }
    }
  }

  //! Update Quantity ======================================
  Future<bool> updateQuantity({
    required int productId,
    required int quantity,
  }) async {
    try {
      final cart = currentCart(productId);

      await cartLocalRepository.updateQuantity(cart: cart, quantity: quantity);

      getCart();

      return true;
    } catch (e) {
      Log.e(' Error when you try to update quantity ${e.toString()}');

      return false;
    }
  }

  //! Delete Product From Cart  ======================================
  Future<void> deleteFromCart({required int index}) async {
    await cartLocalRepository.deleteFromCart(index: index);
    getCart();
    notifyListeners();
  }

  //! Check if product is in cart ======================================
  bool isProductInCart(int productId) {
    for (final cart in cartList) {
      if (cart.product.id == productId) {
        return true;
      }
    }

    return false;
  }

  //! Current Cart ======================================
  CartModel currentCart(int productId) {
    final cart =
        cartList.firstWhere((element) => element.product.id == productId);

    return cart;
  }

  //! Delete All Cart ===============================================
  Future<void> clearCart() async {
    try {
      await cartLocalRepository.clearCart();
      getCart();
      notifyListeners();
    } catch (e) {
      Log.e(' Error when you try to delete cart ${e.toString()}');
    }
  }
}

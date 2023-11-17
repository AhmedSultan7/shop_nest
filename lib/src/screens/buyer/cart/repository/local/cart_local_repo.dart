import 'package:cards_app/src/core/consts/app_constants.dart';
import 'package:cards_app/src/core/data/local/hive_helper.dart';
import 'package:cards_app/src/core/utils/logger.dart';
import 'package:cards_app/src/screens/buyer/cart/model/cart_model.dart';

class CartLocalRepository {
  final HiveHelper hiveHelper;

  CartLocalRepository({required this.hiveHelper});

  final _cartHiveKey = AppConsts.cart;

  Future<void> addProductToCart({required CartModel cart}) async {
    try {
      await hiveHelper.setData(_cartHiveKey, data: cart.toLocalJson());
    } catch (e) {
      Log.e(' Can\'t Add To Cart ${e.toString()}');
    }
  }

  Future<List<CartModel>> getCart() async {
    try {
      final cartData = await hiveHelper.getData(boxName: _cartHiveKey);

      final cartList = <CartModel>[];

      cartData.forEach((key, value) {
        cartList.add(CartModel.fromLocal(key, value));
      });

      return cartList;
    } on Exception catch (e) {
      Log.e(e.toString());
      return [];
    }
  }

  //! Update quantity ======================================
  Future<void> updateQuantity({
    required CartModel cart,
    required int quantity,
  }) async {
    try {
      final newCart = cart.copyWith(quantity: quantity);

      await hiveHelper.putData(
        _cartHiveKey,
        key: cart.id,
        data: newCart.toLocalJson(),
      );
    } catch (e) {
      Log.e(' Cart repo update error${e.toString()}');
    }
  }

  Future<void> deleteFromCart({required int index}) async {
    try {
      await hiveHelper.delete(_cartHiveKey, index: index);
    } catch (e) {
      Log.e(' Cart repo delete error${e.toString()}');
    }
  }

//! Delete All Cart ===============================================
  Future<void> clearCart() async {
    try {
      await hiveHelper.clear(_cartHiveKey);
    } catch (e) {
      Log.e(' Error when you try to delete cart ${e.toString()}');
    }
  }
}

import 'package:cards_app/src/core/consts/app_constants.dart';
import 'package:cards_app/src/core/data/local/hive_helper.dart';
import 'package:cards_app/src/core/utils/logger.dart';
import 'package:cards_app/src/screens/cart/model/cart_model.dart';

class CartLocalRepository {
  // final hive = Hive.box(AppConsts.cart);

  final HiveHelper hiveHelper;

  CartLocalRepository({required this.hiveHelper});

  final _cartHiveKey = AppConsts.cart;

  Future<void> addProductToCart({required CartModel cart}) async {
    await hiveHelper.add(_cartHiveKey, data: cart.toLocalJson());
  }

  Future<List<CartModel>> getCart() async {
    try {
      final cartData = await hiveHelper.get(boxName: _cartHiveKey);

      final cartList = List<CartModel>.from(cartData.values.map((cart) {
        return CartModel.fromLocal(cart);
      }));

      return cartList;
    } on Exception catch (e) {
      Log.e(e.toString());
      return [];
    }
  }

  Future<void> deleteFromCart({required int index}) async {
    try {
      await hiveHelper.delete(_cartHiveKey, index: index);
    } catch (e) {
      Log.e(' Cart repo delete error${e.toString()}');
    }
  }
}

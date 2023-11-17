import 'dart:async';

import '../../../seller/product/view_model/product_view_model.dart';

class ProductVM extends SellerProductVM {
  ProductVM(super.productRepo);

  Future<void> getUserProducts() async {
    await super.getProducts();
  }
}

import 'dart:async';
import 'dart:io';

import 'package:cards_app/src/core/data/remote/app_exception.dart';
import 'package:cards_app/src/core/utils/logger.dart';
import 'package:cards_app/src/screens/product/models/product_model.dart';
import 'package:cards_app/src/screens/product/models/repository/product_repo.dart';
import 'package:flutter/cupertino.dart';

class ProductVM extends ChangeNotifier {
  final ProductRepo _productRepo;

  ProductVM(this._productRepo);

  List<ProductModel> products = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  //! Get Products ===================================

  Future<void> getProducts() async {
    try {
      isLoading = true;
      products = await _productRepo.getProducts();
      isLoading = false;
      notifyListeners();
    } on FetchDataException catch (e) {
      Log.e('Fetch Data Exception ${e.toString()}');
      isLoading = false;
    } on SocketException {
      isLoading = false;
    } on TimeoutException {
      isLoading = false;
    }
  }
}

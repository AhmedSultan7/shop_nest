import 'dart:async';
import 'dart:io';

import 'package:cards_app/src/core/data/remote/app_exception.dart';
import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
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
    } on FetchDataException catch (e) {
      Log.e('Fetch Data Exception ${e.toString()}');
      isLoading = false;
    } on SocketException {
      isLoading = false;
    } on TimeoutException {
      isLoading = false;
    }
  }

//! Add Products ===================================
  Future<void> addProduct(BuildContext context,
      {required Map<String, TextEditingController> controllers,
      required String pickedImage}) async {
    try {
      isLoading = true;
      final product = ProductModel(
        name: controllers[ApiStrings.name]!.text,
        description: controllers[ApiStrings.description]!.text,
        price: num.tryParse(controllers[ApiStrings.price]!.text),
      );
      await _productRepo.addProduct(product: product, pickedImage: pickedImage);
      getProducts();
      if (context.mounted) {
        context.back();
        context.showFlushBar(type: FlushBarType.add);
      }
      isLoading = false;
    } on FetchDataException catch (e) {
      Log.e('Fetch Data Exception ${e.toString()}');
      isLoading = false;
    } on SocketException {
      isLoading = false;
    } on TimeoutException {
      isLoading = false;
    }
  }

  //! Edit Product ===================================
  Future<void> editProduct(BuildContext context,
      {required Map<String, TextEditingController> controllers,
      required int id,
      List<String>? fileResult}) async {
    try {
      isLoading = true;
      final product = ProductModel(
        id: id,
        name: controllers[ApiStrings.name]!.text,
        description: controllers[ApiStrings.description]!.text,
        price: num.tryParse(controllers[ApiStrings.price]!.text),
      );
      await _productRepo.editProduct(
        product: product,
        fileResult: fileResult,
      );
      getProducts();
      if (context.mounted) {
        context.back();
        context.showFlushBar(type: FlushBarType.update);
      }
      isLoading = false;
    } on FetchDataException catch (e) {
      Log.e('Fetch Data Exception ${e.toString()}');
      isLoading = false;
    } on SocketException {
      isLoading = false;
    } on TimeoutException {
      isLoading = false;
    }
  }

  //! Delete Products ===================================
  Future<void> deleteProduct(BuildContext context, {required int id}) async {
    try {
      isLoading = true;
      await _productRepo.deleteProduct(id: id);
      getProducts();
      if (context.mounted) {
        context.back();
        context.showFlushBar(type: FlushBarType.delete);
      }
      isLoading = false;
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

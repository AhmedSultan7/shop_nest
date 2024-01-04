import 'dart:async';
import 'dart:io';

import 'package:cards_app/src/core/data/remote/app_exception.dart';
import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/utils/logger.dart';
import 'package:cards_app/src/screens/auth/view_model/auth_view_model.dart';
import 'package:cards_app/src/screens/seller/product/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../shared/loading_view_model/loading_view_model.dart';
import '../repository/product_repo.dart';

class ProductsVM extends LoadingVM {
  final ProductRepo productRepo;

  ProductsVM({required this.productRepo});

  List<ProductModel> products = [];
  List searchedProductsList = [];

  //! Get Products ===================================
  Future<void> getProducts() async {
    try {
      isLoading = true;
      products = await productRepo.getProducts();
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

  // * Search For Products =========================================
  void searchedProductsToSearchedList(String searchedProducts) {
    searchedProductsList = products
        .where((element) =>
            element.name!.toLowerCase().startsWith(searchedProducts))
        .toList();
    notifyListeners();
  }

  void clearSearch({required TextEditingController searchController}) {
    searchedProductsList.clear();
    searchController.clear();
    notifyListeners();
  }

  // * =============================================================

  //! Add Products ===================================
  Future<void> addProduct(
    BuildContext context, {
    required Map<String, TextEditingController> controllers,
    required String pickedImage,
  }) async {
    try {
      isLoading = true;
      final seller = context.read<AuthVM>().user;

      final product = ProductModel(
          name: controllers[ApiStrings.name]!.text,
          description: controllers[ApiStrings.description]!.text,
          price: num.tryParse(controllers[ApiStrings.price]!.text),
          seller: seller);

      await productRepo.addProduct(product: product, pickedImage: pickedImage);
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
      final seller = context.read<AuthVM>().user;

      isLoading = true;
      final product = ProductModel(
          id: id,
          name: controllers[ApiStrings.name]!.text,
          description: controllers[ApiStrings.description]!.text,
          price: num.tryParse(controllers[ApiStrings.price]!.text),
          seller: seller);

      await productRepo.editProduct(
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
      await productRepo.deleteProduct(id: id);
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

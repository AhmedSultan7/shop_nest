import 'dart:async';

import 'package:cards_app/src/core/data/remote/app_exception.dart';
import 'package:cards_app/src/core/data/remote/network/base_api_service.dart';
import 'package:cards_app/src/core/data/remote/response/api_end_points.dart';
import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/screens/product/models/product_model.dart';

class ProductRepo {
  final BaseApiServices _networkApiServices;

  ProductRepo(this._networkApiServices);

  //! Get Products ===================================
  Future<List<ProductModel>> getProducts() async {
    try {
      final response =
          await _networkApiServices.getResponse(ApiEndPoints.products);

      final productsData = (response[ApiStrings.data] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
      return productsData;
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  //! Add Products ===================================
  Future<void> addProduct({
    required ProductModel product,
    required String? pickedImage,
  }) async {
    try {
      await _networkApiServices.postResponse(ApiEndPoints.products,
          fileResult: [pickedImage ?? ''],
          fieldName: ApiStrings.image,
          data: product.toJson());
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  //! Edit Products ===================================
  Future<void> editProduct(
      {required ProductModel product,
      required List<String>? fileResult}) async {
    try {
      await _networkApiServices.putResponse(ApiEndPoints.crudProduct,
          fieldName: ApiStrings.image,
          fileResult: fileResult,
          data: product.toJson());
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

//! Delete Products ===================================
  Future<void> deleteProduct({required int id}) async {
    try {
      await _networkApiServices
          .deleteResponse('${ApiEndPoints.crudProduct}/$id');
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }
}

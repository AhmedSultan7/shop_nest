import 'dart:async';

import 'package:cards_app/src/core/data/remote/app_exception.dart';
import 'package:cards_app/src/core/data/remote/network/base_api_service.dart';
import 'package:cards_app/src/core/data/remote/response/api_end_points.dart';
import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/screens/auth/repository/local_repo/auth_local_repo.dart';
import 'package:cards_app/src/screens/seller/product/models/product_model.dart';

import '../../../auth/model/user_model.dart';

class ProductRepo {
  final BaseApiServices networkApiServices;
  final AuthLocalRepo authLocalRepo;

  ProductRepo({required this.networkApiServices, required this.authLocalRepo});

  //! Get Products ===================================
  Future<List<ProductModel>> getProducts() async {
    try {
      final vendorIdFilter = await UserModel.vendorFilter(authLocalRepo);

      final response = await networkApiServices
          .getResponse(ApiEndPoints.products + vendorIdFilter);

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
      await networkApiServices.postResponse(ApiEndPoints.products,
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
      await networkApiServices.putResponse(ApiEndPoints.products,
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
      await networkApiServices.deleteResponse('${ApiEndPoints.products}/$id');
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }
}

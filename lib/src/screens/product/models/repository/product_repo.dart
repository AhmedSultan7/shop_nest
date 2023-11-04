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
}

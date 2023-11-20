import 'dart:async';

import 'package:cards_app/src/core/data/remote/network/base_api_service.dart';
import 'package:cards_app/src/core/data/remote/response/api_end_points.dart';
import 'package:cards_app/src/screens/buyer/order_history/model/order_model.dart';

class OrderRepo {
  final BaseApiServices networkApiServices;

  OrderRepo({required this.networkApiServices});

  //! Get Order ===================================
  Future<List<OrderModel>> getOrders() async {
    try {
      final response =
          await networkApiServices.getResponse(ApiEndPoints.orders);

      final orderData = List<OrderModel>.from(
          response.map((order) => OrderModel.fromJson(order)));
      return orderData;
    } on FormatException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }
}

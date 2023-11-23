import 'dart:async';

import 'package:cards_app/src/core/data/remote/app_exception.dart';
import 'package:cards_app/src/core/data/remote/network/base_api_service.dart';
import 'package:cards_app/src/core/data/remote/response/api_end_points.dart';
import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/screens/buyer/order_history/model/order_model.dart';

import '../../../auth/repository/local_repo/auth_local_repo.dart';

class OrderRepo {
  final BaseApiServices networkApiServices;
  final AuthLocalRepo authLocalRepo;

  OrderRepo({required this.networkApiServices, required this.authLocalRepo});

  //! Get Order ===================================
  Future<List<OrderModel>> getOrders() async {
    try {
      final userIdFilter = await OrderModel.orderFilter(authLocalRepo);
      final response = await networkApiServices
          .getResponse(ApiEndPoints.orders + userIdFilter);

      final orderData = (response[ApiStrings.data] as List)
          .map((order) => OrderModel.fromJson(order))
          .toList();
      return orderData;
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  //! Add Order ==================================
  Future<void> addOrder({required OrderModel order}) async {
    try {
      await networkApiServices.postResponse(ApiEndPoints.orders,
          data: order.toJson());
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }
}

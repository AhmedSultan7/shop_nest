import 'dart:async';
import 'dart:io';

import 'package:cards_app/src/core/data/remote/app_exception.dart';
import 'package:cards_app/src/screens/auth/model/user_model.dart';
import 'package:cards_app/src/screens/buyer/cart/view_model/cart_view_model.dart';
import 'package:cards_app/src/screens/buyer/order_history/model/order_model.dart';
import 'package:cards_app/src/screens/buyer/order_history/repository/order_repo.dart';
import 'package:cards_app/src/screens/shared/loading_view_model/loading_view_model.dart';

import '../../../../core/utils/logger.dart';

class OrderVM extends LoadingVM {
  final OrderRepo orderRepo;

  OrderVM({required this.orderRepo});

  List<OrderModel> orders = [];

  //! Get Order ===================================
  Future<void> getOrders() async {
    try {
      isLoading = true;
      orders = await orderRepo.getOrders();
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

  //! Add Order ==================================
  Future<void> addOrders({
    required CartVM cartVM,
    required UserModel user,
  }) async {
    try {
      final orderModel = OrderModel(
          totalPrice: cartVM.total,
          sellers: [],
          // cartVM.cartList.map((e) => e.product.seller!).toList(),
          products: cartVM.cartList.map((e) => e.product).toList(),
          user: user);
      isLoading = true;
      await orderRepo.addOrder(order: orderModel);
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

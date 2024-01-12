import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/shared_widgets/empty_widgets/empty_order.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:cards_app/src/core/utils/logger.dart';
import 'package:cards_app/src/screens/buyer/order_history/view_model/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import 'widgets/order_history_widget.dart';

class OrderHistoryScreen extends HookWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderVM = context.read<OrderVM>();
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        orderVM.getOrders();
      });
      return () {};
    }, []);
    return Consumer<OrderVM>(
      builder: (context, orderVM, child) {
        Log.w(orderVM.orders.length);
        if (orderVM.isLoading) {
          return const LoadingWidget();
        }
        if (orderVM.orders.isEmpty) {
          return const EmptyOrderWidget();
        }
        return ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(
            right: AppSpaces.defaultPadding,
            top: AppSpaces.defaultPadding,
            left: AppSpaces.defaultPadding,
          ),
          itemBuilder: (context, index) => OrderHistoryCard(
            order: orderVM.orders[index],
          ),
          separatorBuilder: (context, index) => context.mediumGap,
          itemCount: orderVM.orders.length,
        );
      },
    );
  }
}

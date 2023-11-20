import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:flutter/material.dart';

import 'widgets/order_history_widget.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => OrderHistoryWidget(),
      itemCount: 3,
    ).paddingSymmetric(horizontal: AppSpaces.defaultPadding);
  }
}

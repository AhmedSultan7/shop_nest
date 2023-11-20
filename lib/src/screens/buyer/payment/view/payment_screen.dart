import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/shared_widgets/appbar/main_appbar.dart';
import 'package:cards_app/src/screens/buyer/cart/model/cart_model.dart';
import 'package:cards_app/src/screens/buyer/payment/view/widgets/build_payment_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/app_spaces.dart';
import 'widgets/payment_bottom_nav_bar.dart';

class PaymentScreen extends StatelessWidget {
  final List<CartModel> payment;

  const PaymentScreen({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        isBackButton: true,
        title: context.tr.payment,
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(AppSpaces.defaultPadding),
          itemBuilder: (context, index) =>
              BuildPaymentWidget(payment: payment[index]),
          separatorBuilder: (context, index) => context.mediumGap,
          itemCount: payment.length),
      bottomNavigationBar: PaymentBottomNavBar(payment: payment[0]),
    );
  }
}

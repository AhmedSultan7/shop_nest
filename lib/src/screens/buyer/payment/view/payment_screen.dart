import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/shared_widgets/appbar/main_appbar.dart';
import 'package:cards_app/src/screens/buyer/cart/view_model/cart_view_model.dart';
import 'package:cards_app/src/screens/buyer/payment/view/widgets/build_payment_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/app_spaces.dart';
import 'widgets/payment_bottom_nav_bar.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartVM>(
      builder: (context, cartVM, child) {
        return Scaffold(
          appBar: MainAppBar(
            isBackButton: true,
            title: context.tr.payment,
          ),
          body: ListView.separated(
              padding: const EdgeInsets.all(AppSpaces.defaultPadding),
              itemBuilder: (context, index) =>
                  BuildPaymentWidget(payment: cartVM.cartList[index]),
              separatorBuilder: (context, index) => context.mediumGap,
              itemCount: cartVM.cartList.length),
          bottomNavigationBar: PaymentBottomNavBar(
            cartVM: cartVM,
          ),
        );
      },
    );
  }
}

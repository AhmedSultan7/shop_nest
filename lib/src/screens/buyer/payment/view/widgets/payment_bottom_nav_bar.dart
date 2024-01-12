import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/screens/app.dart';
import 'package:cards_app/src/screens/auth/view_model/auth_view_model.dart';
import 'package:cards_app/src/screens/buyer/order_history/view_model/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

import '../../../../../core/consts/app_constants.dart';
import '../../../../../core/resources/app_radius.dart';
import '../../../../../core/resources/theme/theme.dart';
import '../../../../../core/shared_widgets/box_shadow.dart';
import '../../../cart/view_model/cart_view_model.dart';

class PaymentBottomNavBar extends StatefulWidget {
  final CartVM cartVM;

  const PaymentBottomNavBar({super.key, required this.cartVM});

  @override
  State<PaymentBottomNavBar> createState() => _PaymentBottomNavBarState();
}

class _PaymentBottomNavBarState extends State<PaymentBottomNavBar> {
  final _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];

  final String defaultApplePay = '''{
  "provider": "apple_pay",
  "data": {
    "merchantIdentifier": "merchant.com.simSaudi.simApp",
    "displayName": "Sam's Fish",
    "merchantCapabilities": ["3DS", "debit", "credit"],
    "supportedNetworks": ["amex", "visa", "discover", "masterCard"],
    "countryCode": "SA",
    "currencyCode": "SAR",
    "requiredBillingContactFields": ["emailAddress", "name", "phoneNumber", "postalAddress"],
    "requiredShippingContactFields": [],
    "shippingMethods": [
      {
        "amount": "0.00",
        "detail": "Available within an hour",
        "identifier": "in_store_pickup",
        "label": "In-Store Pickup"
      },
      {
        "amount": "4.99",
        "detail": "5-8 Business Days",
        "identifier": "flat_rate_shipping_id_2",
        "label": "UPS Ground"
      },
      {
        "amount": "29.99",
        "detail": "1-3 Business Days",
        "identifier": "flat_rate_shipping_id_1",
        "label": "FedEx Priority Mail"
      }
    ]
  }
}''';

  @override
  Widget build(BuildContext context) {
    final cartVM = context.read<CartVM>();
    return Container(
      padding: const EdgeInsets.all(AppSpaces.defaultPadding),
      height: context.height * 0.24,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(AppRadius.productRadius),
            topLeft: Radius.circular(AppRadius.productRadius),
          ),
          boxShadow: ConstantsWidgets.darkBoxShadowFromBottom),
      child: Column(
        children: [
          //! Total Products
          Row(
            children: [
              Text(
                context.tr.totalProduct,
                style: context.title,
              ),
              Text(
                cartVM.totalQuantity.toString(),
                style: context.title.copyWith(color: ColorManager.primaryColor),
              ),
            ],
          ),

          context.mediumGap,

          //! Total Order

          Row(
            children: [
              Text(
                context.tr.total,
                style: context.title,
              ),
              Text(
                ' ${cartVM.total.toString()}',
                style: context.title.copyWith(color: ColorManager.primaryColor),
              ),
              context.smallGap,
              Text(
                AppConsts.currency,
                style: context.title.copyWith(color: ColorManager.primaryColor),
              ),
            ],
          ),

          context.smallGap,

          ApplePayButton(
            height: 50,
            width: double.infinity,
            paymentConfiguration:
                PaymentConfiguration.fromJsonString(defaultApplePay),
            paymentItems: cartVM.cartList
                .map((e) => PaymentItem(
                      label: e.product.name,
                      amount: (e.quantity * (e.product.price ?? 0)).toString(),
                      status: PaymentItemStatus.final_price,
                    ))
                .toList(),
            style: ApplePayButtonStyle.black,
            type: ApplePayButtonType.order,
            margin: const EdgeInsets.only(top: 15.0),
            onPaymentResult: (data) {
              if (data['status'] == 'success') {
                final authVM = context.read<AuthVM>();
                context
                    .read<OrderVM>()
                    .addOrders(cartVM: cartVM, user: authVM.user);

                context.toReplacement(const MyApp());

                context.showBarMessage(context.tr.paymentSuccessfully);
              }
            },
            loadingIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
          ),

          // context.mediumGap,

          // Expanded(
          //   child: Button(
          //     onPressed: () {
          //       final authVM = context.read<AuthVM>();
          //
          //       context
          //           .read<OrderVM>()
          //           .addOrders(cartVM: cartVM, user: authVM.user);
          //     },
          //     label: context.tr.pay,
          //     radius: AppRadius.tabBarRadius,
          //   ),
          // )
        ],
      ),
    );
  }
}

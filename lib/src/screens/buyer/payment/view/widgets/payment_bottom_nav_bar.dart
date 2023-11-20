import 'package:cards_app/src/core/consts/app_constants.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:cards_app/src/screens/buyer/cart/model/cart_model.dart';
import 'package:cards_app/src/screens/buyer/cart/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/app_radius.dart';
import '../../../../../core/resources/theme/theme.dart';
import '../../../../../core/shared_widgets/box_shadow.dart';

class PaymentBottomNavBar extends StatelessWidget {
  final CartModel payment;

  const PaymentBottomNavBar({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    final cartVM = context.read<CartVM>();
    return Container(
      padding: const EdgeInsets.all(AppSpaces.defaultPadding),
      height: context.height * 0.2,
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
          Row(
            children: [
              Text(
                context.tr.totalProduct,
                style: context.title,
              ),
              Text(
                cartVM.totalQuantity.toString(),
                style: context.title,
              ),
            ],
          ),
          context.mediumGap,
          Row(
            children: [
              Text(
                context.tr.total,
                style: context.title,
              ),
              Text(
                ' ${cartVM.total.toString()} ${AppConsts.currency}',
                style: context.title,
              ),
            ],
          ),
          context.mediumGap,
          Expanded(
            child: Button(
              onPressed: () {},
              label: context.tr.pay,
              radius: AppRadius.containerProfileRadius,
            ),
          )
        ],
      ),
    );
  }
}

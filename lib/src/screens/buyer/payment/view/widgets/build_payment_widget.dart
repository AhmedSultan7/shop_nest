import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/screens/buyer/cart/model/cart_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../core/resources/app_radius.dart';
import '../../../../../core/shared_widgets/icon_widget/icon_widget.dart';

class BuildPaymentWidget extends StatelessWidget {
  final CartModel payment;

  const BuildPaymentWidget({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //! product image
        Expanded(
          flex: 2,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.baseRadius),
                child: Image.network(
                  payment.product.image!.url,
                  fit: BoxFit.cover,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) {
                    return const IconWidget(icon: Assets.iconsImg);
                  },
                ),
              ),
            ],
          ),
        ),
        context.smallGap,

        //! product name & price
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! Product name
                Text(
                  payment.product.name ?? '',
                  style: context.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        context.smallGap,
        Flexible(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(' X ${payment.quantity.toString()}',
                style: context.labelLarge.copyWith(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}

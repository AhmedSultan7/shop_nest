import 'package:cards_app/src/core/consts/app_constants.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_radius.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/core/shared_widgets/box_shadow.dart';
import 'package:cards_app/src/screens/buyer/order_history/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../core/shared_widgets/icon_widget/icon_widget.dart';

class OrderHistoryWidget extends StatelessWidget {
  final OrderModel order;

  const OrderHistoryWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpaces.defaultPadding),
      width: double.infinity,
      height: 170.h,
      decoration: BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.circular(AppRadius.baseContainerRadius),
          boxShadow: ConstantsWidgets.boxShadow),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //! Order Images
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.baseContainerRadius),
            child: Image.asset(
              Assets.imagesApex ?? '',
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) =>
                  const IconWidget(icon: Assets.iconsNoImage),
            ),
          ),

          //! Total Price & Created At
          Container(
            padding: const EdgeInsets.only(
              top: AppSpaces.smallPadding,
              right: AppSpaces.smallPadding,
              left: AppSpaces.smallPadding,
            ),
            width: double.infinity,
            height: 60.h,
            decoration: const BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(AppRadius.baseContainerRadius),
                  bottomLeft: Radius.circular(AppRadius.baseContainerRadius),
                )),
            child: Column(
              children: [
                Row(
                  children: [
                    //! Total Price
                    Row(
                      children: [
                        Text(
                          context.tr.total,
                          style: context.subTitle,
                        ),
                        Text(
                          '${order.totalPrice} ',
                          style: context.subTitle,
                        ),
                        Text(
                          AppConsts.currency,
                          style: context.subTitle
                              .copyWith(color: ColorManager.primaryColor),
                        ),
                      ],
                    ),

                    const Spacer(),

                    //! Total Products
                    Row(
                      children: [
                        Text(
                          context.tr.totalProduct,
                          style: context.subTitle,
                        ),
                        Text(
                          '${3} ',
                          style: context.subTitle,
                        ),
                      ],
                    ),
                  ],
                ),

                context.smallGap,

                //! Date Time
                Row(
                  children: [
                    Text(
                      context.tr.dateTime,
                      style: context.labelLarge.copyWith(
                          color: ColorManager.darkGrey.withOpacity(0.5)),
                    ),
                    Text(
                      ' ${order.createdAt}',
                      style: context.labelLarge.copyWith(
                          color: ColorManager.darkGrey.withOpacity(0.5)),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

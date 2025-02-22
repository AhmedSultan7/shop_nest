import 'package:cards_app/src/core/consts/app_constants.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_radius.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/core/shared_widgets/box_shadow.dart';
import 'package:cards_app/src/screens/buyer/order_history/model/order_model.dart';
import 'package:cards_app/src/screens/seller/product/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../core/shared_widgets/icon_widget/icon_widget.dart';

class OrderHistoryCard extends StatelessWidget {
  final OrderModel order;

  const OrderHistoryCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: ColorManager.primaryColor,
      shape: LinearBorder.none,
      collapsedBackgroundColor: Colors.transparent,
      childrenPadding: EdgeInsets.zero,
      tilePadding: EdgeInsets.zero,
      title: Container(
        width: double.infinity,
        height: 170.h,
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(AppRadius.baseContainerRadius),
            boxShadow: ConstantsWidgets.boxShadow),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            //! Order Images
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(AppRadius.baseContainerRadius),
              child: Image.network(
                order.products?.firstOrNull?.image?.url ?? '',
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) =>
                    const IconWidget(icon: Assets.iconsNoImage),
              ),
            ),

            //! Total Price & Created At
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpaces.smallPadding,
                  vertical: AppSpaces.xSmallPadding),
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
                            '${order.totalPrice}',
                            style: context.subTitle,
                          ),
                          context.xSmallGap,
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
                            '${order.products?.length ?? 0}',
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
            ),
          ],
        ),
      ),
      children: [
        Container(
          color: Colors.white,
          child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return OrderItemListWidget(
                  product: order.products![index],
                );
              },
              separatorBuilder: (context, index) => context.mediumGap,
              itemCount: order.products!.length),
        )
      ],
    );
  }
}

class OrderItemListWidget extends StatelessWidget {
  final ProductModel product;

  const OrderItemListWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //! product image
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.baseRadius),
          child: Image.network(
            product.image!.url,
            fit: BoxFit.cover,
            height: 70.h,
            width: 70.w,
            errorBuilder: (context, error, stackTrace) {
              return const IconWidget(icon: Assets.iconsImg);
            },
          ),
        ),
        context.smallGap,

        //! product name & price
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Product name
            Text(
              product.name ?? '',
              style: context.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text(
                  product.price.toString(),
                  style: context.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                context.xSmallGap,
                Text(
                  AppConsts.currency,
                  style:
                      context.title.copyWith(color: ColorManager.primaryColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
        context.smallGap,
        Flexible(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(' X ${product.id.toString()}',
                style: context.labelLarge.copyWith(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}

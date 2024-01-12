import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/core/shared_widgets/box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../generated/assets.dart';
import '../../../../core/consts/app_constants.dart';
import '../../../../core/resources/app_radius.dart';
import '../../../../core/shared_widgets/empty_widgets/empty_order.dart';
import '../../../../core/shared_widgets/icon_widget/icon_widget.dart';
import '../../../../core/shared_widgets/shared_widgets.dart';
import '../../../buyer/order_history/model/order_model.dart';
import '../../../buyer/order_history/view_model/order_view_model.dart';
import '../../product/models/product_model.dart';

class SellerOrderScreen extends HookWidget {
  const SellerOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderVM = context.read<OrderVM>();
    useEffect(() {
      orderVM.getOrders();

      return () {};
    }, []);
    return Consumer<OrderVM>(
      builder: (context, orderVM, child) {
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
          itemBuilder: (context, index) => _OrderHistoryWidget(
            order: orderVM.orders[index],
          ),
          separatorBuilder: (context, index) => context.mediumGap,
          itemCount: orderVM.orders.length,
        );
      },
    );
  }
}

class _OrderHistoryWidget extends StatelessWidget {
  final OrderModel order;

  const _OrderHistoryWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: ColorManager.primaryColor,
      shape: LinearBorder.none,
      collapsedBackgroundColor: Colors.transparent,
      childrenPadding: EdgeInsets.zero,
      tilePadding: EdgeInsets.zero,
      title: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 170.h,
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius:
                    BorderRadius.circular(AppRadius.baseContainerRadius),
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
                  width: double.infinity,
                  height: 60.h,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpaces.smallPadding,
                      vertical: AppSpaces.xSmallPadding),
                  decoration: const BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.only(
                        bottomRight:
                            Radius.circular(AppRadius.baseContainerRadius),
                        bottomLeft:
                            Radius.circular(AppRadius.baseContainerRadius),
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

                      //! User Details
                      Row(
                        children: [
                          //! User Name
                          Row(
                            children: [
                              Text(
                                '${context.tr.name}: ',
                                style: context.subTitle,
                              ),
                              Text(
                                order.user?.userName ?? '',
                                style: context.subTitle,
                              ),
                            ],
                          ),
                          const Spacer(),

                          //! User Email
                          Text(
                            order.user?.email ?? '',
                            style: context.subTitle.copyWith(
                              color: ColorManager.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //? order date in the top of the image with container
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpaces.smallPadding),
            decoration: const BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppRadius.baseContainerRadius),
                  topLeft: Radius.circular(AppRadius.baseContainerRadius),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      context.tr.orderNumber,
                      style: context.subTitle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '# ${order.id}',
                      style: context.subTitle.copyWith(
                          color: ColorManager.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  '${order.createdAt}',
                  style: context.labelLarge
                      .copyWith(color: ColorManager.darkGrey.withOpacity(0.5)),
                ),
              ],
            ),
          ),
        ],
      ),
      children: [
        Container(
          color: Colors.white,
          child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _OrderItemListWidget(
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

class _OrderItemListWidget extends StatelessWidget {
  final ProductModel product;

  const _OrderItemListWidget({super.key, required this.product});

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
                  product.price.toString() ?? '',
                  style: context.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                context.xSmallGap,
                Text(
                  AppConsts.currency ?? '',
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

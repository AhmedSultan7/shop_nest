import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/core/shared_widgets/box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/resources/app_radius.dart';

class SellerOrderScreen extends HookWidget {
  const SellerOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.only(
        right: AppSpaces.defaultPadding,
        top: AppSpaces.defaultPadding,
        left: AppSpaces.defaultPadding,
      ),
      itemBuilder: (context, index) => _SellerOrderItemWidget(),
      separatorBuilder: (context, index) => context.mediumGap,
      itemCount: 1,
    );
  }
}

class _SellerOrderItemWidget extends StatelessWidget {
  const _SellerOrderItemWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppRadius.baseContainerRadius),
              color: ColorManager.white,
              boxShadow: ConstantsWidgets.boxShadow),
          child: ExpansionTile(
            expandedAlignment: Alignment.centerRight,
            controlAffinity: ListTileControlAffinity.leading,
            collapsedIconColor: ColorManager.primaryColor,
            shape: InputBorder.none,
            iconColor: ColorManager.primaryColor,
            initiallyExpanded: true,
            title: Row(
              children: [
                Text(
                  context.tr.orderNumber,
                  style: context.title,
                ),
                Text(
                  '# ${1}',
                  style:
                      context.title.copyWith(color: ColorManager.primaryColor),
                ),
              ],
            ),
            children: [
              //! Delivery fee
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${context.tr.totalProduct}3',
                    style: context.labelMedium,
                  ),
                  context.smallGap,
                  Text('${context.tr.dateTime} ${DateTime.now()}',
                      style: context.labelMedium),
                  context.smallGap,
                  Text('${context.tr.total} 315', style: context.labelMedium),
                ],
              ).paddingAll(AppSpaces.smallPadding),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:blur/blur.dart';
import 'package:cards_app/src/core/consts/app_constants.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/core/shared_widgets/box_shadow.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../generated/assets.dart';
import '../../../../../../core/resources/app_radius.dart';
import '../../../../../../core/resources/app_spaces.dart';
import '../../../../../../core/shared_widgets/dialogs/alert_dialog.dart';
import '../../../models/product_model.dart';
import '../../../view_model/product_view_model.dart';
import '../../add_products/add_product.dart';
import '../../product_details/seller_product_details_screen.dart';

class SellerProductCard extends StatelessWidget {
  final ProductModel product;

  const SellerProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<SellerProductVM>(
      builder: (context, productVM, child) {
        return InkWell(
          onTap: () {
            context.to(SellerProductsDetailsScreen(product: product));
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(AppRadius.imageContainerRadius),
                color: Theme.of(context).cardColor,
                boxShadow: ConstantsWidgets.boxShadow),
            child: Stack(
              children: [
                //! image & details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! Product image
                    SizedBox(
                      height: context.height * 0.26,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppRadius.imageContainerRadius,
                        ),
                        child: Image.network(
                          product.image?.url ?? '',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    context.smallGap,

                    //! product title & price & sale price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //! Product Title
                        Text(
                          product.name ?? '',
                          style: context.subTitle.copyWith(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        context.smallGap,
                        //! price and currency
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //! Price Text
                            Text(context.tr.price,
                                style: context.labelLarge
                                    .copyWith(fontWeight: FontWeight.bold)),
                            context.smallGap,

                            //! Price
                            Text('${product.price} ',
                                style: context.title.copyWith(
                                    color: ColorManager.primaryColor)),

                            //! Currency
                            Text(AppConsts.currency,
                                style: context.labelLarge
                                    .copyWith(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ).paddingOnly(
                        left: AppSpaces.smallPadding,
                        right: AppSpaces.smallPadding),
                  ],
                ),

                //! Delete button
                Positioned(
                  left: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: ColorManager.red,
                        borderRadius: BorderRadius.only(
                          bottomRight:
                              Radius.circular(AppRadius.imageContainerRadius),
                          topLeft:
                              Radius.circular(AppRadius.imageContainerRadius),
                        )),
                    child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialogWidget(
                                  isWarningMessage: true,
                                  isLoading: productVM.isLoading,
                                  message: context
                                      .tr.deleteProductConfirmationMessage,
                                  onConfirm: () => productVM
                                      .deleteProduct(context, id: product.id!));
                            },
                          );
                        },
                        icon: const BaseLottieIcon(
                          Assets.animationDelete,
                          height: AppSpaces.iconSize,
                        )),
                  ),
                ),

                //! Edit button
                Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 17,
                    child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => Container(
                                    margin: const EdgeInsets.all(
                                        AppSpaces.defaultPadding),
                                    height: MediaQuery.of(context).size.height *
                                        0.75,
                                    child: AddProductScreen(
                                      product: product,
                                    ),
                                  ));
                        },
                        icon: const BaseLottieIcon(
                          Assets.animationEdit,
                          height: AppSpaces.iconSize,
                        )),
                  ).frosted(
                    blur: 0.9,
                    frostColor: Colors.blueGrey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ).paddingOnly(
                  right: AppSpaces.smallPadding,
                  top: AppSpaces.smallPadding,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

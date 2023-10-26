import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_radius.dart';
import '../../../../core/resources/app_spaces.dart';
import '../../../product/models/product_model.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Products',
          style: context.headLine,
        ),
        context.mediumGap,
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              childAspectRatio: 7 / 11,
            ),
            itemBuilder: (BuildContext context, int index) {
              return _ProductCardWidget(
                product: ProductModel.productList[index],
              );
            }),
      ],
    );
  }
}

class _ProductCardWidget extends StatelessWidget {
  final ProductModel product;

  const _ProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.imageContainerRadius),
        color: Theme.of(context).cardColor,
      ),
      child: Stack(
        children: [
          //! image & details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! Product image
              SizedBox(
                height: 170.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    AppRadius.imageContainerRadius,
                  ),
                  child: Image.asset(
                    product.image ?? '',
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              context.smallGap,

              //! product title & price & sale price
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: context.title.copyWith(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  context.smallGap,
                  //! price and sale price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('\$${product.price} ', style: context.labelLarge),
                    ],
                  ),
                ],
              ).paddingOnly(
                  left: AppSpaces.smallPadding, right: AppSpaces.smallPadding),
            ],
          ),
        ],
      ),
    );
  }
}

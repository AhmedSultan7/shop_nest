import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_radius.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../models/product_model.dart';
import 'components/product_container_details.dart';

class SellerProductsDetailsScreen extends HookWidget {
  final ProductModel product;

  const SellerProductsDetailsScreen({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final quantity = useState<int>(1);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Product image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(AppRadius.productRadius),
                    bottomRight: Radius.circular(AppRadius.productRadius),
                  ),
                  child: SizedBox(
                    height: context.height * 0.6,
                    width: double.infinity,
                    child: Image.network(
                      product.image?.url ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: ColorManager.grey.withOpacity(0.6),
                  radius: 25,
                  child: const BackButtonWidget(
                    isWhite: false,
                  ),
                ).paddingSymmetric(
                    vertical: AppSpaces.defaultPadding,
                    horizontal: AppSpaces.smallPadding),
              ],
            ),
            context.largeGap,

            //! Product name, price , description , category name , delete & edit
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetails(product: product),
                context.xlLargeGap,
              ],
            ).paddingAll(AppSpaces.defaultPadding)
          ],
        ),
      ),
    );
  }
}

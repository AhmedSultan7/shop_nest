import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_radius.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/screens/product/view/product_screen/product_screen.dart';
import 'package:cards_app/src/screens/sub_category/model/sub_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryCardWidget extends StatelessWidget {
  final SubCategoryModel subCategory;

  const SubCategoryCardWidget({
    super.key,
    required this.subCategory,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.to(ProductByCatScreen(subCategory: subCategory)),
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.black,
            borderRadius: BorderRadius.circular(AppRadius.baseRadius)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h,
              child: Image.asset(
                subCategory.image,
                fit: BoxFit.cover,
              ),
            ),
            context.mediumGap,
            Text(
              subCategory.title,
              style: context.whiteSubTitle,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/core/shared_widgets/box_shadow.dart';
import 'package:cards_app/src/screens/category/models/category_model.dart';
import 'package:cards_app/src/screens/sub_category/view/sub_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_radius.dart';
import '../../../../core/resources/app_spaces.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr.category,
          style: context.headLine,
        ),
        context.mediumGap,
        SizedBox(
          height: 120.h,
          child: ListView.builder(
              padding: const EdgeInsets.only(bottom: AppSpaces.xSmallPadding),
              scrollDirection: Axis.horizontal,
              itemCount: CategoryModel.categoryList.length,
              itemBuilder: (context, index) => _CategoryCardWidget(
                    category: CategoryModel.categoryList[index],
                  )),
        ),
      ],
    );
  }
}

class _CategoryCardWidget extends StatelessWidget {
  final CategoryModel category;

  const _CategoryCardWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.to(const SubCategoryScreen()),
      child: Container(
        width: 250.w,
        margin: const EdgeInsets.only(left: AppSpaces.smallPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.baseContainerRadius),
          boxShadow: ConstantsWidgets.boxShadow,
          color: Colors.white,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            //! Product image
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppRadius.baseContainerRadius,
                ),
                child: Image.network(
                  category.image,
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(
                    vertical: AppSpaces.xSmallPadding),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(AppRadius.baseContainerRadius),
                    bottomRight: Radius.circular(AppRadius.baseContainerRadius),
                  ),
                  color: ColorManager.black.withOpacity(0.5),
                ),
                child: Text(
                  category.title,
                  style:
                      context.whiteTitle.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
      ),
    );
  }
}

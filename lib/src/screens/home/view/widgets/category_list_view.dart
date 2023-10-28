import 'package:cards_app/src/core/extensions/extensions.dart';
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
          'Categories',
          style: context.headLine,
        ),
        context.mediumGap,
        SizedBox(
          height: 150.h,
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
        width: 200.w,
        margin: const EdgeInsets.only(left: AppSpaces.smallPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.baseContainerRadius),
          boxShadow: ConstantsWidgets.boxShadow,
          color: Colors.white,
        ),
        child: Stack(
          children: [
            //! image & details
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //! Product image
                SizedBox(
                  width: double.infinity,
                  height: 100.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppRadius.baseRadius,
                    ),
                    child: Image.asset(
                      category.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                context.mediumGap,

                //! product title & price & sale price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.title,
                      style: context.subTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ).paddingOnly(
                    left: AppSpaces.smallPadding,
                    right: AppSpaces.smallPadding),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

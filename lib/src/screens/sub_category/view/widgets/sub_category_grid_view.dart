import 'package:cards_app/src/screens/sub_category/model/sub_category_model.dart';
import 'package:flutter/material.dart';

import 'sub_category_card_widget.dart';

class SubCategoryGridView extends StatelessWidget {
  const SubCategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 5,
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          childAspectRatio: 7 / 8,
        ),
        itemBuilder: (BuildContext context, int index) => SubCategoryCardWidget(
              subCategory: SubCategoryModel.subCategoryList[index],
            ));
  }
}

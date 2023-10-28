import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/shared_widgets/appbar/main_appbar.dart';
import 'package:cards_app/src/screens/sub_category/view/widgets/sub_category_card_widget.dart';
import 'package:flutter/material.dart';

import '../model/sub_category_model.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: context.tr.subCategory,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(AppSpaces.smallPadding),
          itemCount: SubCategoryModel.subCategoryList.length,
          itemBuilder: (BuildContext context, int index) =>
              SubCategoryCardWidget(
                subCategory: SubCategoryModel.subCategoryList[index],
              )),
    );
  }
}

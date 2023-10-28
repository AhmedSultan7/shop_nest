import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/shared_widgets/appbar/main_appbar.dart';
import 'package:flutter/material.dart';

import 'widgets/sub_category_grid_view.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'sub',
      ),
      body: ListView(
        children: [SubCategoryGridView()],
      ).paddingAll(AppSpaces.defaultPadding),
    );
  }
}

import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/shared_widgets/appbar/main_appbar.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:cards_app/src/screens/product/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'widgets/add_product_widget.dart';

class AddProductScreen extends HookWidget {
  final ProductModel? product;

  const AddProductScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    final fieldsControllers = {
      ApiStrings.name: useTextEditingController(text: product?.name),
      ApiStrings.description:
          useTextEditingController(text: product?.description),
      ApiStrings.price:
          useTextEditingController(text: product?.price.toString()),
    };

    final formKey = useState(GlobalKey<FormState>());
    return Form(
      key: formKey.value,
      child: Scaffold(
        appBar: MainAppBar(
          title: context.tr.addProduct,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AddProductWidget(
              product: product ?? ProductModel.empty(),
              controllers: fieldsControllers,
            ),
            context.xlLargeGap,
            Button(label: context.tr.add, onPressed: () {})
          ],
        ).paddingAll(AppSpaces.defaultPadding),
      ),
    );
  }
}

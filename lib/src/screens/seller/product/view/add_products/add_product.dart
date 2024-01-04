import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:cards_app/src/screens/seller/home/view/main_seller_screen.dart';
import 'package:cards_app/src/screens/seller/product/view/product_screen/seller_products_screen.dart';
import 'package:cards_app/src/screens/shared/media/view_models/media_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../view_model/product_view_model.dart';
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
    final productVM = context.read<ProductsVM>();
    final mediaVM = context.read<MediaVM>();
    final isEdit = product != null;

    Future<void> addOrEditProduct() async {
      if (isEdit) {
        await productVM.editProduct(context,
            controllers: fieldsControllers,
            id: product!.id!,
            fileResult: mediaVM.filesPaths);
      } else {
        await productVM.addProduct(context,
            controllers: fieldsControllers,
            pickedImage: mediaVM.filesPaths.first);
      }
    }

    //! ==============================
    Future<void> validateAndAddEditCategory() async {
      if (mediaVM.filesPaths.isEmpty && !isEdit) {
        context.showBarMessage(
          context.tr.pleasePickImage,
          isError: true,
        );
        return;
      }

      if (!formKey.value.currentState!.validate()) return;

      await addOrEditProduct();
    }

    return Form(
      key: formKey.value,
      child: Consumer<ProductsVM>(
        builder: (context, productVM, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AddProductWidget(
                product: product,
                controllers: fieldsControllers,
              ),
              context.xlLargeGap,
              Button(
                  label: isEdit ? context.tr.edit : context.tr.add,
                  isLoading: productVM.isLoading,
                  onPressed: () async {
                    await validateAndAddEditCategory();
                    if (!context.mounted) return;
                    context.toReplacement(const MainSellerScreen());
                  })
            ],
          ).scroll();
        },
      ).paddingAll(AppSpaces.defaultPadding),
    );
  }
}

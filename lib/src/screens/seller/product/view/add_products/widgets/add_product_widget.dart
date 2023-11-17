import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:cards_app/src/screens/shared/media/view_models/media_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';

class AddProductWidget extends StatelessWidget {
  final Map<String, TextEditingController> controllers;
  final ProductModel? product;

  const AddProductWidget({super.key, required this.controllers, this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<MediaVM>(
      builder: (context, mediaVM, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Image ---------------
            Center(
              child: SinglePickImageWidget(
                pickedResult: mediaVM.filesPaths.firstOrNull,
                networkImage: product?.image?.url,
              ),
            ),

            context.xlLargeGap,

            //! Name Field ---------------
            BaseTextField(
              controller: controllers[ApiStrings.name],
              textInputType: TextInputType.name,
              title: context.tr.name,
            ),

            context.fieldsGap,

            //! Description Field ---------------
            BaseTextField(
              controller: controllers[ApiStrings.description],
              title: context.tr.description,
              textInputType: TextInputType.text,
              maxLines: 4,
            ),

            context.fieldsGap,

            //! Price Field ---------------
            SizedBox(
              width: 130.w,
              child: BaseTextField(
                controller: controllers[ApiStrings.price],
                textInputType: TextInputType.number,
                title: context.tr.price,
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_radius.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:flutter/material.dart';
import '../../resources/theme/theme.dart';
import 'base_dialog.dart';

class BaseDeleteDialog extends StatelessWidget {
  final String description;
  final Function() onConfirm;
  final bool isLoading;

  const BaseDeleteDialog({
    super.key,
    required this.description,
    required this.onConfirm,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.baseContainerRadius)),
        child: BaseDialog(
          radius: AppRadius.baseContainerRadius,
          isLoading: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
                vertical: AppSpaces.smallPadding,
                horizontal: AppSpaces.defaultPadding),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.delete,
                          color: ColorManager.errorColor,
                          size: 30,
                        ),
                        context.mediumGap,
                        Text(
                          context.tr.confirmation,
                          style: context.title,
                        ),
                      ],
                    ),

                    context.mediumGap,

                    //? Description
                    Text(
                      description,
                      style: context.subTitle,
                    ),

                    context.largeGap,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //? Cancel Button
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child:
                              Text(context.tr.cancel, style: context.subTitle),
                        ),

                        context.mediumGap,

                        TextButton(
                          onPressed: onConfirm,
                          child: Text(context.tr.confirm,
                              style: context.whiteSubTitle.copyWith(
                                  color: ColorManager.errorColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ).sized(
                      height: 45,
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

void showDeleteDialog({
  required BuildContext context,
  required String description,
  required Function() onConfirm,
}) {
  showDialog(
      context: context,
      builder: (_) => BaseDeleteDialog(
            description: description,
            onConfirm: onConfirm,
          ));
}

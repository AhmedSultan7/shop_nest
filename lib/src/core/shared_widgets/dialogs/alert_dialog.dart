import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../generated/assets.dart';
import '../../resources/app_radius.dart';
import '../../resources/theme/theme.dart';
import 'base_dialog.dart';

class AlertDialogWidget extends StatelessWidget {
  final String message;
  final bool isWarningMessage;
  final Function() onConfirm;
  final bool isLoading;

  const AlertDialogWidget(
      {super.key,
      required this.message,
      this.isWarningMessage = false,
      this.isLoading = false,
      required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    //AlertDialog(
    //       backgroundColor: context.appTheme.cardColor,
    //       //! Header text
    //       title: Row(
    //         children: [
    //           if (widget.isWarningMessage)
    //             SizedBox(
    //                 height: 50,
    //                 width: 50,
    //                 child: Lottie.asset(Assets.animatedAlert)),
    //           context.smallGap,
    //           Text(
    //             context.tr.confirmation,
    //             style: context.title.copyWith(
    //                 color: widget.isWarningMessage
    //                     ? ColorManager.red
    //                     : ColorManager.primaryColor),
    //           ),
    //         ],
    //       ),
    //       //! Message Text
    //       content: Text(
    //         widget.message,
    //         style: context.labelMedium,
    //       ),
    //       //! Confirm Button & dismiss
    //       actions: [
    //         //! Confirm Button
    //         MaterialButton(
    //           elevation: 0,
    //           textColor: Theme.of(context).focusColor,
    //           onPressed: widget.onConfirm,
    //           child: Text(context.tr.confirm,
    //               style: context.labelMedium.copyWith(
    //                   color: widget.isWarningMessage
    //                       ? ColorManager.red
    //                       : ColorManager.primaryColor)),
    //         ),
    //         //!  Dismiss Button
    //         MaterialButton(
    //           elevation: 0,
    //           textColor: ColorManager.primaryColor,
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //           child: Text(
    //             context.tr.dismiss,
    //             style: context.labelMedium.copyWith(
    //                 color: context.isDark
    //                     ? ColorManager.grey.withOpacity(0.4)
    //                     : ColorManager.darkGrey.withOpacity(0.4)),
    //           ),
    //         ),
    //       ],
    //     )

    return BaseDialog(
        isLoading: isLoading,
        radius: AppRadius.baseContainerRadius,
        backgroundColor: context.appTheme.cardColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //! Header text
            Row(
              children: [
                if (isWarningMessage) ...[
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: Lottie.asset(Assets.animationAlert)),
                  context.smallGap,
                ],
                Text(
                  context.tr.confirmation,
                  style: context.title.copyWith(
                      color: isWarningMessage
                          ? ColorManager.red
                          : ColorManager.primaryColor),
                ),
              ],
            ),

            context.mediumGap,

            //! Message Text
            Text(
              message,
              style: context.labelLarge,
            ),

            context.mediumGap,

            //? Buttons ==============================
            //! Confirm Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  elevation: 0,
                  textColor: Theme.of(context).focusColor,
                  onPressed: onConfirm,
                  child: Text(context.tr.confirmation,
                      style: context.labelMedium.copyWith(
                          color: isWarningMessage
                              ? ColorManager.red
                              : ColorManager.primaryColor)),
                ),
                //! Dismiss Button
                MaterialButton(
                  elevation: 0,
                  textColor: ColorManager.primaryColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    context.tr.dismiss,
                    style: context.labelMedium.copyWith(
                        color: ColorManager.darkGrey.withOpacity(0.4)),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

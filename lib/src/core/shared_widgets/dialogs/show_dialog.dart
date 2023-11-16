import 'package:flutter/material.dart';

import 'alert_dialog.dart';

void showAlertDialog(
  BuildContext context, {
  required String message,
  bool isWarningMessage = true,
  required Function() onConfirm,
}) {
  showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialogWidget(
          isWarningMessage: isWarningMessage,
          message: message,
          onConfirm: onConfirm,
        );
      });
}

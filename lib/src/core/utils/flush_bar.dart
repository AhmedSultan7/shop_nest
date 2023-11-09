import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../resources/theme/theme.dart';

Flushbar showBarAlert(BuildContext context, String msg,
    {Color iconColor = Colors.white,
    IconData icon = Icons.check_circle_outline,
    bool isError = false,
    String? title,
    Color? color,
    Function(Flushbar)? onTap}) {
  return Flushbar(
    backgroundColor:
        color ?? (isError ? ColorManager.errorColor : Colors.green),
    title: title,
    message: msg,
    icon: Icon(isError ? Icons.error : icon, size: 28.0, color: iconColor),
    duration: const Duration(seconds: 5),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    padding: const EdgeInsets.all(16),
    borderRadius: BorderRadius.circular(10),
    onTap: onTap,
  )..show(context);
}

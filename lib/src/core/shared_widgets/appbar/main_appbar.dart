import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../shared_widgets.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isBackButton;
  final String? title;
  final bool isLeading;
  final Widget? actionWidget;
  final Function()? onBackPressed;

  const MainAppBar({
    super.key,
    this.actionWidget,
    this.isLeading = true,
    this.isBackButton = true,
    this.title,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      scrolledUnderElevation: 0,
      elevation: 0,
      bottomOpacity: 0,
      shadowColor: Colors.black,
      leading: isBackButton ? BackButtonWidget(onPressed: onBackPressed) : null,
      title: title == null
          ? null
          : Text(
              title!,
              style: context.title,
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

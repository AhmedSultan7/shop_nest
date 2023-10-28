import 'package:flutter/material.dart';

import '../../resources/theme/theme.dart';

class BaseFloatingButton extends StatelessWidget {
  final Color color;
  final Function() onTap;
  final Widget child;

  const BaseFloatingButton({
    super.key,
    required this.child,
    this.color = ColorManager.black,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: UniqueKey(),
      backgroundColor: color,
      onPressed: onTap,
      mini: true,
      shape: const CircleBorder(),
      child: child,
    );
  }
}

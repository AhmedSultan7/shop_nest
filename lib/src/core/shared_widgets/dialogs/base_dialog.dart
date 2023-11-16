import 'package:flutter/material.dart';

import '../../resources/app_radius.dart';
import '../../resources/app_spaces.dart';
import '../shared_widgets.dart';

class BaseDialog extends StatefulWidget {
  final Widget child;
  final double radius;
  final bool isLoading;
  final Color backgroundColor;

  const BaseDialog({
    super.key,
    required this.child,
    required this.isLoading,
    this.radius = AppRadius.baseRadius,
    this.backgroundColor = Colors.white,
  });

  @override
  State<StatefulWidget> createState() => _MainDialog();
}

class _MainDialog extends State<BaseDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return const Center(
        child: LoadingWidget(),
      );
    }
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              margin: EdgeInsets.all(AppSpaces.defaultPadding),
              padding: EdgeInsets.all(AppSpaces.defaultPadding),
              decoration: ShapeDecoration(
                  color: widget.backgroundColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(widget.radius))),
              child: widget.child),
        ),
      ),
    );
  }
}

import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/screens/drawer/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class SliderDrawerWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const SliderDrawerWidget(
      {super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    GlobalKey<SliderDrawerState> drawerKey = GlobalKey<SliderDrawerState>();

    return SliderDrawer(
      isDraggable: true,
      slideDirection: SlideDirection.TOP_TO_BOTTOM,
      key: drawerKey,
      appBar: SliderAppBar(
        title: Text(
          title,
          style: context.title,
        ),
      ),
      slider: HomeDrawer(),
      child: child,
    );
  }
}

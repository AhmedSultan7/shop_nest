import 'package:flutter/material.dart';

class ConstantsWidgets {
  static List<BoxShadow> boxShadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 2,
      blurRadius: 5,
      offset: const Offset(0, 3),
    ),
  ];
  static List<BoxShadow> boxShadowFromBottom = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.3),
      blurRadius: 5.0, // soften the shadow
      spreadRadius: 0.0, //extend the shadow
      offset: Offset(
        0.0, // Move to right 10  horizontally
        3.0, // Move to bottom 10 Vertically
      ),
    )
  ];
  static List<BoxShadow> darkBoxShadowFromBottom = [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      blurRadius: 5.0, // soften the shadow
      spreadRadius: 0.0, //extend the shadow
      offset: Offset(
        0.0, // Move to right 10  horizontally
        3.0, // Move to bottom 10 Vertically
      ),
    )
  ];
}

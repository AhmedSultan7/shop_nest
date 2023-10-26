import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'History Screen',
        style: context.headLine,
      ),
    );
  }
}

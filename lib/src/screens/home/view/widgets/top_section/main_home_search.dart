import 'package:flutter/material.dart';

import '../../../../../core/shared_widgets/shared_widgets.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchWidget(
      initialValue: '',
      onSubmitted: (value) {},
    );
  }
}

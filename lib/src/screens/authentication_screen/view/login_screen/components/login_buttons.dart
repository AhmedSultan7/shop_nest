import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class AuthButtons extends StatelessWidget {
  final String title;

  const AuthButtons({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //! Button back & login text
        Row(
          children: [
            //! back arrow
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
            context.smallGap,
            //! signUp title
            Text(title, style: context.headLine)
          ],
        ),
      ],
    );
  }
}

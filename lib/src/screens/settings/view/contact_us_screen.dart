import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/app_spaces.dart';
import '../../../core/shared_widgets/appbar/main_appbar.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        isBackButton: true,
        title: 'تواصل معنا',
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                textAlign: TextAlign.center,
                'issadeeb000@gmail.com',
                style: context.headLine.copyWith(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              CircleAvatar(
                radius: 25,
                backgroundColor: ColorManager.primaryColor,
                child: Icon(
                  Icons.email,
                  size: 30,
                  color: Colors.white,
                ),
              )
            ],
          ),
          context.largeGap,
          Row(
            children: [
              Text(
                textAlign: TextAlign.center,
                '0201118414599+',
                style: context.headLine.copyWith(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              CircleAvatar(
                radius: 25,
                backgroundColor: ColorManager.primaryColor,
                child: Icon(
                  Icons.phone,
                  size: 30,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ).paddingAll(AppSpaces.defaultPadding),
    );
  }
}

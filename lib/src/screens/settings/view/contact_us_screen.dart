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
          context.mediumGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.info_outline,
                size: 30,
                color: ColorManager.primaryColor,
              ),
              context.smallGap,
              Text(
                textAlign: TextAlign.center,
                'للاعلانات والاستفسارات',
                style: context.headLine.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          context.xlLargeGap,
          Row(
            children: [
              Text(
                textAlign: TextAlign.center,
                'sim.saudi.app@gmail.com',
                style: context.headLine.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const CircleAvatar(
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
                '+966 54 670 9502',
                style: context.headLine.copyWith(fontWeight: FontWeight.bold),
                textDirection: TextDirection.ltr,
              ),
              const Spacer(),
              const CircleAvatar(
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

import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../core/resources/app_radius.dart';
import '../../core/resources/app_spaces.dart';
import '../../core/resources/theme/theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Column(
        children: [
          const _HeaderDrawer(),
          context.largeGap,
          // const AppSettings(),
        ],
      ),
    );
  }
}

class _HeaderDrawer extends StatelessWidget {
  const _HeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          vertical: AppSpaces.largePadding,
          horizontal: AppSpaces.defaultPadding),
      decoration: BoxDecoration(
        color: ColorManager.primaryColor.withOpacity(0.8),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(AppRadius.containerProfileRadius),
            bottomRight: Radius.circular(AppRadius.containerProfileRadius)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          context.smallGap,
          Text(
            'Issa Mohamed',
            style: context.whiteLabelLarge,
          ),
          Text(
            'issaDeeb03@gmail.com',
            style:
                context.whiteLabelMedium.copyWith(fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}

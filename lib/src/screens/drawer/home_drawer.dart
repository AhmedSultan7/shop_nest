import 'package:blur/blur.dart';
import 'package:cards_app/generated/assets.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/shared_widgets/row_icon_and_title.dart';
import 'package:flutter/material.dart';

import '../../core/resources/app_spaces.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Blur(
          blur: 0.4,
          blurColor: Colors.transparent,
          child: Image.asset(
            Assets.imagesSpace,
          ),
        ),
        Column(
          children: [
            const _HeaderDrawer(),
            const _DrawerList().paddingAll(AppSpaces.defaultPadding),
          ],
        ),
      ],
    );
  }
}

class _HeaderDrawer extends StatelessWidget {
  const _HeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
          top: AppSpaces.largePadding + 10,
          left: AppSpaces.defaultPadding,
          bottom: 10),
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Issa Mohamed',
                style: context.whiteTitle,
              ),
              Text(
                'issaDeeb03@gmail.com',
                style: context.whiteLabelMedium
                    .copyWith(fontWeight: FontWeight.w300),
              ),
            ],
          ),
          context.smallGap,
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              height: 50,
              width: 50,
              'https://w7.pngwing.com/pngs/129/292/png-transparent-female-avatar-girl-face-woman-user-flat-classy-users-icon.png',
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerList extends StatelessWidget {
  const _DrawerList();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //! Home & Terms & Contact Us
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Home
            RowIconAndTitle(
              iconPath: Assets.iconsHome,
              title: context.tr.home,
              onTap: () {},
            ),
            context.largeGap,

            //! Terms
            RowIconAndTitle(
              iconPath: Assets.iconsTerms,
              title: context.tr.terms,
              onTap: () {},
            ),
            context.largeGap,

            //! Contact Us
            RowIconAndTitle(
              iconPath: Assets.iconsContact,
              title: context.tr.contactUs,
              onTap: () {},
            ),
          ],
        ),

        context.largeGap,
        //! Policy & About Us & Settings
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Policy
            RowIconAndTitle(
              iconPath: Assets.iconsTerms,
              title: context.tr.policy,
              onTap: () {},
            ),
            context.largeGap,

            //! About Us
            RowIconAndTitle(
              iconPath: Assets.iconsAboutUs,
              title: context.tr.aboutUs,
              onTap: () {},
            ),
            context.largeGap,

            //! Settings
            RowIconAndTitle(
              iconPath: Assets.iconsSettings,
              title: context.tr.settings,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:blur/blur.dart';
import 'package:cards_app/generated/assets.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/shared_widgets/row_icon_and_title.dart';
import 'package:cards_app/src/screens/auth/view_model/auth_view_model.dart';
import 'package:cards_app/src/screens/settings/model/settings_model.dart';
import 'package:cards_app/src/screens/settings/view/edit_profile/profile_screen.dart';
import 'package:cards_app/src/screens/settings/view/policy_screen.dart';
import 'package:cards_app/src/screens/settings/view/terms_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../core/resources/app_spaces.dart';
import '../settings/view/about_us_screen.dart';
import '../settings/view/contact_us_screen.dart';
import '../settings/view_model/setting_view_model.dart';

class HomeDrawer extends HookWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsVM = context.read<SettingsVM>();
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        settingsVM.getSettings();
      });
      return () {};
    }, []);
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
            _DrawerList(
              settings: settingsVM.settings,
            ).paddingOnly(
                right: AppSpaces.defaultPadding,
                bottom: AppSpaces.defaultPadding),
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
    return Consumer<AuthVM>(
      builder: (context, authVM, child) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
              top: AppSpaces.xlLargePadding,
              left: AppSpaces.defaultPadding,
              bottom: 10),
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                authVM.user.userName,
                style: context.whiteTitle,
              ),
              Text(
                authVM.user.email,
                style: context.whiteLabelLarge
                    .copyWith(fontWeight: FontWeight.w100),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DrawerList extends StatelessWidget {
  final SettingsModel settings;

  const _DrawerList({required this.settings});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //! Home & Terms & Contact Us
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Policy
            RowIconAndTitle(
              iconPath: Assets.iconsTerms,
              title: context.tr.policy,
              onTap: () => context.to(const PolicyScreen()),
            ),
            context.largeGap,

            //! Terms
            RowIconAndTitle(
              iconPath: Assets.iconsTerms,
              title: context.tr.terms,
              onTap: () {
                context.to(const TermsScreen());
              },
            ),
            context.largeGap,

            //! Logout
            Consumer<AuthVM>(
              builder: (context, authVM, child) {
                return RowIconAndTitle(
                  iconPath: Assets.iconsLogout,
                  title: context.tr.logout,
                  onTap: () => authVM.logout(context),
                );
              },
            ),
          ],
        ),

        context.largeGap,
        //! Terms & About Us & Settings
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! About Us
            RowIconAndTitle(
              iconPath: Assets.iconsAboutUs,
              title: context.tr.aboutUs,
              onTap: () {
                context.to(const AboutUsScreen());
              },
            ),
            context.largeGap,

            //! Contact Us
            RowIconAndTitle(
              iconPath: Assets.iconsContact,
              title: context.tr.contactUs,
              onTap: () => context.to(const ContactUsScreen()),
            ),
            context.largeGap,

            //! Settings
            RowIconAndTitle(
              iconPath: Assets.iconsSettings,
              title: context.tr.settings,
              onTap: () => context.to(const ProfileScreen()),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/shared_widgets/appbar/main_appbar.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../view_model/setting_view_model.dart';

class TermsScreen extends HookWidget {
  const TermsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final settingsVM = context.read<SettingsVM>();
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        settingsVM.getSettings();
      });
      return () {};
    }, []);

    return Scaffold(
      appBar: MainAppBar(
        isBackButton: true,
        title: context.tr.termsAndCondition,
      ),
      body: settingsVM.isLoading
          ? LoadingWidget()
          : Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  '${settingsVM.settings.termsAndConditions}',
                  style: context.subTitle.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ).paddingAll(AppSpaces.defaultPadding),
    );
  }
}

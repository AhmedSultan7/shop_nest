import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../../core/resources/app_spaces.dart';
import '../../../core/shared_widgets/appbar/main_appbar.dart';
import '../../../core/shared_widgets/shared_widgets.dart';
import '../view_model/setting_view_model.dart';

class PolicyScreen extends HookWidget {
  const PolicyScreen({
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
      appBar: const MainAppBar(
        isBackButton: true,
        title: 'سياسة الخصوصية',
      ),
      body: settingsVM.isLoading
          ? const LoadingWidget()
          : Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  '${settingsVM.settings.privacyPolicy}',
                  style: context.subTitle.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ).paddingAll(AppSpaces.defaultPadding),
    );
  }
}

import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/shared_widgets/appbar/main_appbar.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:cards_app/src/screens/settings/view/edit_profile/widgets/edit_profile_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../../auth/view_model/auth_view_model.dart';

class ProfileScreen extends HookWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authVM = context.read<AuthVM>().user;
    final formKey = useState(GlobalKey<FormState>());
    final fieldsControllers = {
      ApiStrings.email: useTextEditingController(
        text: authVM.email,
      ),
      ApiStrings.username: useTextEditingController(
        text: authVM.userName,
      ),
      ApiStrings.password: useTextEditingController()
    };
    return Scaffold(
      appBar: MainAppBar(
        isBackButton: true,
        title: context.tr.editProfile,
      ),
      body: Consumer<AuthVM>(
        builder: (context, authVM, child) {
          return Column(
            children: [
              //! Edit Fields
              EditProfileFields(
                  controllers: fieldsControllers, formKey: formKey.value),

              context.fieldsGap,

              //! Edit Button
              Button(
                label: context.tr.edit,
                isLoading: authVM.isLoading,
                onPressed: () {
                  if (formKey.value.currentState!.validate()) {
                    authVM.updateUser(context, controllers: fieldsControllers);
                  }
                },
              )
            ],
          );
        },
      ).paddingAll(AppSpaces.defaultPadding),
    );
  }
}

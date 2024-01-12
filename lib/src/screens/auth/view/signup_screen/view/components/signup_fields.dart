import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:cards_app/src/screens/auth/model/user_model.dart';
import 'package:cards_app/src/screens/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupFields extends StatelessWidget {
  final Map<String, TextEditingController> fields;
  final ValueNotifier valueNotifier;

  const SignupFields({
    Key? key,
    required this.fields,
    required this.valueNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authVM = context.read<AuthVM>();
    return Column(
      children: [
        //! User Name formField
        BaseTextField(
          validator: (value) {
            if (value!.isEmpty) {
              return context.tr.pleaseEnterYourUserName;
            } else {
              return null;
            }
          },
          controller: fields[ApiStrings.username],
          textInputType: TextInputType.name,
          icon: const Icon(Icons.drive_file_rename_outline_rounded),
          label: context.tr.name,
        ),

        context.fieldsGap,

        //! email formField
        BaseTextField(
          validator: (value) {
            if (value!.isEmpty) {
              return context.tr.requiredField;
            }

            return null;
          },
          controller: fields[ApiStrings.email],
          textInputType: TextInputType.emailAddress,
          icon: const Icon(Icons.email_rounded),
          label: context.tr.emailAddress,
        ),

        context.fieldsGap,

        //! password formField provider
        BaseTextField(
          validator: (value) {
            if (value!.length < 8) {
              return context.tr.passwordMustContain8Characters;
            } else {
              return null;
            }
          },
          controller: fields[ApiStrings.password],
          textInputType: TextInputType.visiblePassword,
          icon: const Icon(Icons.password_rounded),
          label: context.tr.password,
          isObscure: authVM.isObscure,
          suffixIcon: IconButton(
              onPressed: authVM.isObscurePassword,
              icon: Icon(
                authVM.isObscure
                    ? Icons.remove_red_eye
                    : Icons.visibility_off_rounded,
                color: Colors.grey,
              )),
        ),

        context.fieldsGap,
        //! User Type formField provider
        BaseDropDown(
          onChanged: (value) {
            valueNotifier.value = value;
          },
          asString: (data) => userTypeToString(data),
          data: UserTypeEnum.values,
          label: context.tr.userType,
          selectedValue: valueNotifier.value,
          icon: const Icon(Icons.person),
        )
      ],
    );
  }
}

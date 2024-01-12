import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/auth_view_model.dart';

class LoginFields extends StatelessWidget {
  final Map<String, TextEditingController> controllers;

  const LoginFields({
    Key? key,
    required this.controllers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authVM = context.read<AuthVM>();
    return Column(
      children: [
        //! email formField
        BaseTextField(
          validator: (value) {
            if (value!.isEmpty) {
              return context.tr.requiredField;
            }
            return null;
          },
          controller: controllers[ApiStrings.identifier],
          textInputType: TextInputType.emailAddress,
          icon: const Icon(Icons.email),
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
          controller: controllers[ApiStrings.password],
          textInputType: TextInputType.visiblePassword,
          isObscure: authVM.isObscure,
          suffixIcon: IconButton(
              onPressed: authVM.isObscurePassword,
              icon: Icon(
                authVM.isObscure
                    ? Icons.remove_red_eye
                    : Icons.visibility_off_rounded,
                color: Colors.grey,
              )),
          label: context.tr.password,
        ),
      ],
    );
  }
}

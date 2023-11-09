import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared_widgets/shared_widgets.dart';

class EditProfileFields extends StatelessWidget {
  final Map<String, TextEditingController> controllers;
  final GlobalKey<FormState> formKey;

  const EditProfileFields(
      {super.key, required this.controllers, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          //! Name Field
          BaseTextField(
            validator: (value) {
              if (value!.isEmpty) {
                return context.tr.pleaseEnterYourUserName;
              } else {
                return null;
              }
            },
            controller: controllers[ApiStrings.username],
            icon: const Icon(Icons.drive_file_rename_outline_rounded),
            label: context.tr.name,
          ),

          context.fieldsGap,

          //! Email Field
          BaseTextField(
            validator: (value) {
              if (value!.isEmpty) {
                return context.tr.requiredField;
              }
              if (!value.contains('@gmail.com')) {
                return context.tr.pleaseEnterCorrectEmail;
              }
              return null;
            },
            controller: controllers[ApiStrings.email],
            icon: const Icon(Icons.email_rounded),
            label: context.tr.emailAddress,
          ),

          context.fieldsGap,
          //! Password Field
          BaseTextField(
            isRequired: false,
            validator: (value) {
              if (value!.length < 8) {
                return context.tr.passwordMustContain8Characters;
              } else {
                return null;
              }
            },
            controller: controllers[ApiStrings.password],
            icon: const Icon(Icons.password_rounded),
            label: context.tr.password,
          ),
        ],
      ),
    );
  }
}

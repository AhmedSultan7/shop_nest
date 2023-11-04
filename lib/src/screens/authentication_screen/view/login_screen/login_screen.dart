import 'package:cards_app/generated/assets.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resources/theme/theme.dart';
import '../../../../core/shared_widgets/shared_widgets.dart';
import 'components/login_buttons.dart';
import 'components/login_fields.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(AppSpaces.defaultPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AuthButtons(title: context.tr.login),
                  context.largeGap,
                  Lottie.asset(Assets.animationLogin, repeat: false),
                  //! Login formField
                  LoginFields(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  // //! forget password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget password',
                          style: context.hint.copyWith(
                            color: ColorManager.primaryColor,
                          ),
                        )),
                  ),
                  10.verticalSpace,
                  //! Login Button
                  Button(label: 'login', onPressed: () {}),
                  10.verticalSpace,
                  //! Don't have an account
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

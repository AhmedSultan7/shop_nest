import 'package:cards_app/generated/assets.dart';
import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/utils/logger.dart';
import 'package:cards_app/src/screens/auth/model/user_model.dart';
import 'package:cards_app/src/screens/auth/view/signup_screen/view/components/signup_fields.dart';
import 'package:cards_app/src/screens/auth/view_model/auth_view_model.dart';
import 'package:cards_app/src/screens/home/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/theme/theme.dart';
import '../../../../core/shared_widgets/shared_widgets.dart';
import '../login_screen/login_screen.dart';

class SignupScreen extends HookWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = useState(GlobalKey<FormState>());
    final fieldsController = {
      ApiStrings.username: useTextEditingController(),
      ApiStrings.email: useTextEditingController(text: '@gmail.com'),
      ApiStrings.password: useTextEditingController(text: '123456789'),
    };
    final userTypeValueNotifier = useState<UserTypeEnum?>(null);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Form(
          key: formKey.value,
          child: Padding(
            padding: const EdgeInsets.all(AppSpaces.defaultPadding),
            child: SingleChildScrollView(
              child: Consumer<AuthVM>(
                builder: (context, authVM, child) {
                  return Column(
                    children: [
                      Text(context.tr.signup, style: context.headLine),
                      Lottie.asset(
                          height: 250.h, Assets.animationLogin, repeat: false),
                      //! Login formField
                      SignupFields(
                          fields: fieldsController,
                          valueNotifier: userTypeValueNotifier),

                      context.xlLargeGap,
                      //! Login Button
                      Button(
                          label: context.tr.signup,
                          isLoading: authVM.isLoading,
                          onPressed: () {
                            if (formKey.value.currentState!.validate()) {
                              authVM
                                  .registerUser(
                                      controllers: fieldsController,
                                      valueNotifier: userTypeValueNotifier)
                                  .then((value) {
                                if (value == true) {
                                  context.toReplacement(const MainScreen());
                                  context.showBarMessage(
                                      context.tr.signupSuccessfully);
                                }
                              }).catchError((e) {
                                Log.e(e.toString());
                                context.showBarMessage(
                                    context.tr.emailOrUsernameAreAlreadyTaken,
                                    isError: true);
                              });
                            }
                          }),
                      context.mediumGap,
                      //! Don't have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            context.tr.HaveAnAccount,
                            style: context.labelMedium,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () =>
                                    context.to(const LoginScreen()),
                                child: Text(
                                  context.tr.login,
                                  style: context.labelMedium.copyWith(
                                      color: ColorManager.primaryColor),
                                )),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

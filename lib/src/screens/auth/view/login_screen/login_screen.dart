import 'package:cards_app/generated/assets.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/screens/auth/view_model/auth_view_model.dart';
import 'package:cards_app/src/screens/buyer/home/view/main_buyer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../core/data/remote/response/api_strings.dart';
import '../../../../core/resources/theme/theme.dart';
import '../../../../core/shared_widgets/shared_widgets.dart';
import '../../../seller/home/view/main_seller_screen.dart';
import '../signup_screen/signup_screen.dart';
import 'components/login_fields.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = useState(GlobalKey<FormState>());
    final fieldsController = {
      ApiStrings.identifier: useTextEditingController(text: 'amr@gmail.com'),
      ApiStrings.password: useTextEditingController(text: '123456789'),
    };

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
                      Text(context.tr.login, style: context.headLine),
                      context.largeGap,
                      SizedBox(
                          height: 300.h,
                          child: Lottie.asset(Assets.animationLogin,
                              repeat: false)),
                      //! Login formField
                      LoginFields(controllers: fieldsController),
                      // //! forget password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              context.tr.forgetPassword,
                              style: context.hint.copyWith(
                                color: ColorManager.primaryColor,
                              ),
                            )),
                      ),
                      context.mediumGap,
                      //! Login Button
                      Button(
                          isLoading: authVM.isLoading,
                          label: context.tr.login,
                          onPressed: () {
                            if (formKey.value.currentState!.validate()) {
                              authVM
                                  .login(controllers: fieldsController)
                                  .then((value) {
                                if (value == true) {
                                  context.to(authVM.isSeller
                                      ? const MainBuyerScreen()
                                      : const MainSellerScreen());
                                  context.showBarMessage(
                                    context.tr.loginSuccessfully,
                                  );
                                } else {
                                  context.showBarMessage(
                                      context
                                          .tr.PleaseCheckYourEmailAndPassword,
                                      isError: true);
                                }
                              });
                            }
                          }),
                      context.mediumGap,
                      //! Don't have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            context.tr.dontHaveAnAccount,
                            style: context.labelMedium,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () =>
                                    context.to(const SignupScreen()),
                                child: Text(
                                  context.tr.signup,
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

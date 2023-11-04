// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:learning_platform_app/core/resources/color_manager.dart';
// import 'package:learning_platform_app/core/resources/theme/theme_shortcuts.dart';
// import 'package:learning_platform_app/l10n/app_localizations.dart';
// import 'package:learning_platform_app/src/common_components/button.dart';
// import 'package:learning_platform_app/src/common_components/common_components.dart';
// import 'package:learning_platform_app/src/screens/authentication_screen/view/signup_screen/view/components/signup_fields.dart';
// import '../login_screen/components/login_buttons.dart';
// import '../login_screen/login_screen.dart';
//
// class SignupScreen extends HookWidget {
//   const SignupScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final nameController = useTextEditingController();
//     final emailController = useTextEditingController();
//     final passwordController = useTextEditingController();
//
//     return Scaffold(
//       body: Form(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 50.h,
//                 ),
//                 //! Back Button & google & facebook
//                 AuthButtons(
//                   title: AppLocalizations.of(context)!.signup,
//                 ),
//                 50.verticalSpace,
//                 //! signup formField
//                 SignupFields(
//                   nameController: nameController,
//                   emailController: emailController,
//                   passwordController: passwordController,
//                 ),
//                 20.verticalSpace,
//                 Button(
//                     label: AppLocalizations.of(context)!.signup,
//                     onPressed: () {}),
//                 10.verticalSpace,
//                 //! Already have an account
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       AppLocalizations.of(context)!.alreadyHaveAnAccount,
//                       style: smallHintStyle(context),
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: TextButton(
//                           onPressed: () {
//                             navigateTo(context, const LoginScreen());
//                           },
//                           child: Text(
//                             AppLocalizations.of(context)!.login,
//                             style: smallHintStyle(context)
//                                 ?.copyWith(color: ColorManager.primaryColor),
//                           )),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

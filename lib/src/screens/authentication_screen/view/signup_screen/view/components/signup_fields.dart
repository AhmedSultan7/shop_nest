// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../../../../core/utils/utils.dart';
// import '../../../../../../../l10n/app_localizations.dart';
// import '../../../../../../common_components/main_login.dart';
// import '../../../../../settings_screen/view_model/settings_view_model.dart';
//
// class SignupFields extends HookWidget {
//   final TextEditingController emailController;
//   final TextEditingController? nameController;
//   final TextEditingController passwordController;
//   final _obscurePassword = useState(true);
//
//   SignupFields({
//     Key? key,
//     required this.emailController,
//     required this.passwordController,
//     this.nameController,
//   }) : super(key: key);
//
//   final FocusNode userNameFocusNode = FocusNode();
//   final FocusNode emailFocusNode = FocusNode();
//   final FocusNode passwordFocusNode = FocusNode();
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SettingsVM>(
//       builder: (context, value, child) => Column(
//         children: [
//           //! User Name
//           DefaultFormField(
//             controller: nameController!,
//             type: TextInputType.text,
//             validate: (String? value) {
//               if (value!.isEmpty) {
//                 return 'please enter your Name';
//               }
//               return null;
//             },
//             prefix: FontAwesomeIcons.userNinja,
//             isPassword: false,
//             label: AppLocalizations.of(context)!.namefiled,
//             onSumbmit: (value) {
//               Utils.fieldFocusChange(
//                   context: context,
//                   current: userNameFocusNode,
//                   nextFocus: emailFocusNode);
//             },
//           ),
//           20.verticalSpace,
//           //! email formField
//           DefaultFormField(
//               controller: emailController,
//               type: TextInputType.emailAddress,
//               validate: (String? value) {
//                 if (value!.isEmpty) {
//                   return 'please enter your email address';
//                 }
//                 return null;
//               },
//               isPassword: false,
//               prefix: FontAwesomeIcons.envelopesBulk,
//               label: AppLocalizations.of(context)!.emailAddress),
//           20.verticalSpace,
//           //! password formField
//           ValueListenableBuilder(
//             valueListenable: _obscurePassword,
//             builder: (context, value, child) =>
//                 //! password formField
//                 DefaultFormField(
//               controller: passwordController,
//               type: TextInputType.visiblePassword,
//               validate: (String? value) {
//                 if (value!.isEmpty) {
//                   return 'please enter your password';
//                 } else if (value.length < 6) {
//                   return 'password is too short';
//                 }
//                 return null;
//               },
//               focusNode: passwordFocusNode,
//               isPassword: _obscurePassword.value,
//               obscuringCharacter: '*',
//               prefix: Icons.password,
//               label: AppLocalizations.of(context)!.password,
//               suffix: _obscurePassword.value
//                   ? Icons.remove_red_eye
//                   : Icons.visibility_off,
//               sufixOnpressed: () {
//                 _obscurePassword.value = !_obscurePassword.value;
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

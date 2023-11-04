import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFields extends HookWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final _obscurePassword = useState(true);

  LoginFields({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //! email formField
        BaseTextField(
          controller: emailController,
          textInputType: TextInputType.emailAddress,
          focusNode: emailFocusNode,
          icon: Icon(Icons.email),
          label: 'emailAddress',
        ),
        SizedBox(
          height: 20.h,
        ),
        //! password formField provider
        BaseTextField(
          controller: emailController,
          textInputType: TextInputType.emailAddress,
          focusNode: emailFocusNode,
          icon: Icon(Icons.email),
          label: 'emailAddress',
        ),
      ],
    );
  }
}

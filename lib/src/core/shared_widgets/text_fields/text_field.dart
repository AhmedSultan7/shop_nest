part of '../shared_widgets.dart';

class BaseTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextAlign textAlign;
  final Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? icon;
  final Widget? suffixIcon;
  final String? label;
  final String? hint;
  final int maxLines;
  final bool isWhiteText;
  final String? ignoringMessage;
  final String? Function(String?)? validator;
  final bool isObscure;
  final bool isRequired;
  final String? initialValue;
  final bool enabled;
  final bool readOnly;

  const BaseTextField({
    Key? key,
    this.ignoringMessage,
    this.focusNode,
    this.controller,
    this.isObscure = false,
    this.onTap,
    this.hint,
    this.icon,
    this.suffixIcon,
    this.label,
    this.onChanged,
    this.onSubmitted,
    this.initialValue,
    this.textAlign = TextAlign.start,
    this.contentPadding = const EdgeInsets.all(AppSpaces.defaultPadding),
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.isWhiteText = false,
    this.isRequired = true,
    this.enabled = true,
    this.readOnly = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _textField(context);
  }

  Widget _textField(BuildContext context) {
    validations(value) {
      if (textInputType == TextInputType.number) {
        return Validations.numbersOnly(context, value);
      } else if (textInputType == TextInputType.emailAddress) {
        return Validations.email(context, value);
      } else if (textInputType == TextInputType.phone) {
        return Validations.phoneNumber(context, value);
      }
      return Validations.mustBeNotEmpty(context, value);
    }

    return TextFormField(
      style: isWhiteText ? context.whiteLabelLarge : null,
      onTapOutside: (e) => FocusScope.of(context).unfocus(),
      focusNode: focusNode,
      obscureText: isObscure,
      enabled: enabled,
      readOnly: readOnly,
      controller: controller,
      keyboardType: textInputType,
      inputFormatters: [
        if (textInputType == TextInputType.number)
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.-]'))
      ],
      textAlign: textAlign,
      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      initialValue: initialValue,
      maxLines: maxLines,
      validator: isRequired ? (validator ?? validations) : null,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: context.hint,
        labelStyle: isWhiteText ? context.whiteLabelLarge : context.labelLarge,
        contentPadding: contentPadding,
        labelText: label,
        suffixIcon: suffixIcon,
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpaces.defaultPadding,
                    vertical: AppSpaces.smallPadding),
                child: icon,
              )
            : null,
      ),
    );
  }
}

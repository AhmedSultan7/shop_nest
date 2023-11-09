part of '../shared_widgets.dart';

class BaseTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final Function(String)? onChanged;
  final TextAlign textAlign;
  final Function()? onTap;
  final EdgeInsetsGeometry contentPadding;
  final Widget? icon;
  final Widget? suffixIcon;
  final String? label;
  final String? hint;
  final int maxLines;
  final String? ignoringMessage;
  final String? Function(String?)? validator;
  final bool isObscure;
  final bool isRequired;
  final String? initialValue;
  final String? title;
  final bool? enabled;

  const BaseTextField({
    Key? key,
    this.ignoringMessage,
    this.enabled = true,
    this.focusNode,
    this.controller,
    this.isObscure = false,
    this.onTap,
    this.hint,
    this.icon,
    this.suffixIcon,
    this.label,
    this.onChanged,
    this.initialValue,
    this.textAlign = TextAlign.start,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.isRequired = true,
    this.validator,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: context.labelLarge,
          ),
          context.smallGap,
        ],

        //! Text Field
        _textField(context),
      ],
    );
  }

  Widget _textField(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      cursorColor: ColorManager.primaryColor,
      focusNode: focusNode,
      obscureText: isObscure,
      controller: controller,
      keyboardType: textInputType,
      inputFormatters: [
        if (textInputType == TextInputType.number)
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.-]')),
      ],
      textAlign: textAlign,
      onTap: onTap,
      onChanged: onChanged,
      initialValue: initialValue,
      maxLines: maxLines,
      validator: validator ??
          (value) {
            if (isRequired && value!.isEmpty) {
              return context.tr.requiredField;
            }
            return null;
          },
      style: context.labelMedium,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.baseRadius),
          borderSide: const BorderSide(
              color: Color(0xFF000000), width: 0.9, style: BorderStyle.solid),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF000000), width: 1),
          borderRadius: BorderRadius.circular(AppRadius.baseRadius),
        ),
        hintText: '${context.tr.enter} ${hint ?? title ?? ''}',
        hintStyle: context.hint,
        contentPadding: contentPadding,
        labelText: label,
        suffixIcon: suffixIcon,
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.only(
                    right: AppSpaces.smallPadding,
                    left: AppSpaces.smallPadding),
                child: icon,
              )
            : null,
      ),
    );
  }
}

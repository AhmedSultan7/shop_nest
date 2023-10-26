part of '../shared_widgets.dart';

class Button extends StatelessWidget {
  final String label;
  final Widget? icon;
  final bool haveElevation;
  final void Function()? onPressed;
  final Color? color;
  final bool isPrefixIcon;
  final bool isOutLine;
  final bool isWhiteText;
  final bool isBold;
  final bool enabled;
  final bool isLoading;
  final double radius;

  const Button({
    Key? key,
    required this.label,
    this.haveElevation = true,
    required this.onPressed,
    this.icon,
    this.isPrefixIcon = false,
    this.isLoading = false,
    this.isOutLine = false,
    this.isWhiteText = true,
    this.color = ColorManager.primaryColor,
    this.isBold = true,
    this.enabled = true,
    this.radius = AppRadius.baseRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const LinearProgressIndicator();
    return SizedBox(
      height: 60,
      child: ElevatedButton(
          onPressed: enabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            elevation: haveElevation && !isOutLine ? 3 : 0,
            foregroundColor: isOutLine ? color!.withOpacity(.1) : Colors.white,
            backgroundColor: isOutLine ? Colors.transparent : color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            side: isOutLine
                ? BorderSide(
                    color: color!,
                    width: 1,
                  )
                : BorderSide.none,
          ),
          child: _buildChild(context)),
    );
  }

  Widget _buildChild(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isPrefixIcon && icon != null)
          Row(
            children: [
              icon!,
              context.mediumGap,
            ],
          ),
        Flexible(
          child: Center(
            child: Text(
              label,
              style: isWhiteText
                  ? context.whiteSubTitle.copyWith(
                      color: isOutLine ? color : null,
                      fontWeight: isBold ? FontWeight.bold : null,
                    )
                  : context.subTitle.copyWith(
                      fontWeight: isBold ? FontWeight.bold : null,
                    ),
            ),
          ),
        ),
        if (icon != null && !isPrefixIcon)
          Row(
            children: [
              context.mediumGap,
              icon!,
            ],
          )
      ],
    );
  }
}

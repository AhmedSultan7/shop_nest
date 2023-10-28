part of '../shared_widgets.dart';

class BackButtonWidget extends StatelessWidget {
  final bool isWhite;
  final onPressed;

  const BackButtonWidget({super.key, this.isWhite = true, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed ?? context.back,
        color: !isWhite ? ColorManager.white : ColorManager.black,
        icon: const Icon(
          size: 25,
          Icons.arrow_back_ios_rounded,
        ));
  }
}

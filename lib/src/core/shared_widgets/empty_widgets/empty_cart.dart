part of shared_widgets;

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(Assets.animationCart),
        Text(
          context.tr.emptyCart,
          style: context.title,
        ),
      ],
    );
  }
}

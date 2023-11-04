part of shared_widgets;

class LoadingWidget extends StatelessWidget {
  final bool isLinear;

  const LoadingWidget({
    Key? key,
    this.isLinear = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLinear) {
      return const LinearProgressIndicator();
    }

    return Lottie.asset(
      Assets.animationNoHistory,
      fit: BoxFit.contain,
      height: 120.r,
    );
  }
}

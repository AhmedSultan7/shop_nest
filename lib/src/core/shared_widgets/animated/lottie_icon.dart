part of shared_widgets;

//! Base Lottie Icon ================================================
class BaseLottieIcon extends StatelessWidget {
  final String asset;
  final double height;
  final double width;
  final bool repeat;

  const BaseLottieIcon(this.asset,
      {this.height = 45, this.width = 45, this.repeat = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      asset,
      height: height,
      width: width,
      fit: BoxFit.contain,
      repeat: repeat,
      frameRate: FrameRate.max,
    );
  }
}

//! For Fields ================================================
class BaseLottieFieldIcon extends StatelessWidget {
  final String asset;
  final double height;

  const BaseLottieFieldIcon(this.asset, {super.key, this.height = 35});

  @override
  Widget build(BuildContext context) {
    return BaseLottieIcon(
      asset,
      height: height,
      repeat: false,
    );
  }
}

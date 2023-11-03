part of shared_widgets;

class MainShimmerLoading extends StatelessWidget {
  final Widget child;
  const MainShimmerLoading({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        highlightColor: ColorManager.highlightColor,
        baseColor: ColorManager.shimmerBaseColor,
        child: child);
  }
}

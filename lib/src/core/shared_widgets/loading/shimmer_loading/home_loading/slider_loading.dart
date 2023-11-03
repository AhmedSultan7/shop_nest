part of shared_widgets;

class SliderLoading extends StatelessWidget {
  const SliderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return MainShimmerLoading(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(AppSpaces.defaultPadding),
            height: 130.h,
            width: context.width / 1.2,
            margin: const EdgeInsets.symmetric(horizontal: 22),
            decoration: const BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
          context.mediumGap,
          Container(
            padding: EdgeInsets.all(AppSpaces.defaultPadding),
            height: 10.h,
            width: context.width / 7,
            margin: const EdgeInsets.symmetric(horizontal: 22),
            decoration: const BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
        ],
      ),
    );
  }
}

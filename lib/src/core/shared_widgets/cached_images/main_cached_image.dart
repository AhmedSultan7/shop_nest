part of shared_widgets;

class BaseCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double? radius;

  const BaseCachedImage(
    this.imageUrl, {
    Key? key,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorWidget = const IconWidget(icon: Assets.iconsNoImage)
        .paddingAll(AppSpaces.xlLargePadding);

    return SizedBox(
      height: height,
      width: width,
      child: FastCachedImage(
        fadeInDuration: const Duration(milliseconds: 400),
        url: imageUrl,
        height: height,
        width: width,
        fit: fit,
        loadingBuilder: (context, url) => loadingShimmerWidget(),
        errorBuilder: (context, url, error) => errorWidget,
      ),
    );
  }

  Widget loadingShimmerWidget() => Center(
        child: Shimmer(
          gradient: LinearGradient(
            colors: [
              Colors.grey[300]!,
              Colors.grey[100]!,
            ],
          ),
          child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: radius == null
                    ? null
                    : BorderRadius.all(Radius.circular(radius!)),
              )),
        ),
      );
}

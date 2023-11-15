part of shared_widgets;

class _ViewNetworkImage extends StatelessWidget {
  final String viewedNetworkImage;

  const _ViewNetworkImage({required this.viewedNetworkImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //! Network Image
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.baseContainerRadius),
          child: BaseCachedImage(
            viewedNetworkImage,
            height: 120.h,
            width: 150.w,
          ),
        ),

        //! Edit button
        const _EditButton(),
      ],
    );
  }
}

class _EditButton extends StatelessWidget {
  const _EditButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 7,
      child: CircleAvatar(
        maxRadius: 20,
        backgroundColor: ColorManager.primaryColor.withOpacity(0.8),
        child: IconButton(
            onPressed: () => context.read<MediaVM>().pickFile(context),
            icon: const BaseLottieIcon(
              Assets.animationEdit,
              height: AppSpaces.iconSize,
            )),
      ),
    );
  }
}

part of shared_widgets;

class SinglePickImageWidget extends StatelessWidget {
  final String? pickedResult;
  final String? networkImage;

  const SinglePickImageWidget({
    super.key,
    this.networkImage,
    this.pickedResult,
  });

  @override
  Widget build(BuildContext context) {
    final showPickImageButton = pickedResult == null && networkImage == null;

    //! Pick Image Button ========================================
    if (showPickImageButton) {
      return const _PickImageButton();
    }

    final pickResultIsNotNull = pickedResult != null;

    //! View Picked Image ========================================
    if (pickResultIsNotNull) {
      return _ViewPickedImage(
        pickedResult: pickedResult!,
      );
    }

    //! View Network Image ========================================
    return _ViewNetworkImage(
      viewedNetworkImage: networkImage!,
    );
  }
}

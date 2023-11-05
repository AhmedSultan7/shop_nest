part of shared_widgets;

class SinglePickImageWidget extends StatelessWidget {
  final FilePickerResult? pickedResult;
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

    final pickResultIsNotNull =
        pickedResult?.files != null && pickedResult!.files.isNotEmpty;

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

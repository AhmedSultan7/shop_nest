part of shared_widgets;

class _ViewPickedImage extends StatelessWidget {
  final String? pickedResult;

  const _ViewPickedImage({required this.pickedResult});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //! Picked Image
        Container(
          height: 120.h,
          width: 150.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.file(
              File(pickedResult!),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //! Edit button
        const _EditButton(),
      ],
    );
  }
}

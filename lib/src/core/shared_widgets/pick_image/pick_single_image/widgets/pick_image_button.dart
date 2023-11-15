part of shared_widgets;

class _PickImageButton extends StatelessWidget {
  final int oldFilesLength;

  const _PickImageButton({this.oldFilesLength = 0});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => context
          .read<MediaVM>()
          .pickFile(context, oldFilesLength: oldFilesLength),
      child: Container(
        height: 120.h,
        width: 150.w,
        alignment: Alignment.center,
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(AppRadius.baseContainerRadius),
          dashPattern: const [
            10,
            10,
          ],
          color: Colors.grey,
          strokeWidth: 2,
          child: Container(
              height: 120.h,
              width: 150.w,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconWidget(
                    height: 50.h,
                    width: 50.w,
                    icon: Assets.iconsPickImage,
                  ),
                  Text(
                    context.tr.clickToBrowse,
                    style: context.labelSmall.copyWith(
                        color: Colors.blue, fontWeight: FontWeight.w400),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

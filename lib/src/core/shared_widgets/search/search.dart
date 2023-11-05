part of shared_widgets;

class SearchWidget extends StatelessWidget {
  final String initialValue;
  final Function(String) onSubmitted;

  const SearchWidget({
    super.key,
    required this.initialValue,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 0,
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppRadius.baseRadius),
        child: BaseTextField(
          initialValue: initialValue,
          hint: context.tr.search,
          suffixIcon: const IconWidget(icon: Assets.iconsSearch)
              .paddingAll(AppSpaces.defaultPadding),
        ));
  }
}

part of shared_widgets;

class SearchWidget extends StatelessWidget {
  final Function(String) onChanged;
  final Widget? suffixIcon;
  final TextEditingController? searchController;

  const SearchWidget({
    super.key,
    this.searchController,
    required this.onChanged,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 0,
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppRadius.baseRadius),
        child: BaseTextField(
          controller: searchController,
          onChanged: onChanged,
          hint: context.tr.search,
          suffixIcon: suffixIcon!.paddingAll(AppSpaces.defaultPadding),
        ));
  }
}

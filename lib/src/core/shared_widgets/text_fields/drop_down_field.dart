part of shared_widgets;

class BaseDropDown extends StatelessWidget {
  final dynamic selectedValue;
  final String? label;
  final List<dynamic> data;
  final void Function(dynamic)? onChanged;
  final Widget? icon;
  final String Function(dynamic)? asString;
  final bool isRequired;
  final bool showTitle;

  const BaseDropDown(
      {Key? key,
      required this.onChanged,
      this.asString,
      required this.data,
      required this.label,
      required this.selectedValue,
      this.isRequired = true,
      this.showTitle = true,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          value: selectedValue,
          isExpanded: true,
          borderRadius: BorderRadius.circular(AppRadius.baseRadius),
          items: data.map((e) {
            return DropdownMenuItem(
              value: e,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    asString != null ? asString!(e) : e.toString(),
                    style: context.labelLarge,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: icon == null ? 16.w : 12.w,
            ),
            label: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpaces.smallPadding),
              child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(label!, style: context.labelMedium)),
            ),
            labelStyle: const TextStyle(color: Colors.black),
            border: InputBorder.none,
            fillColor: Colors.transparent,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: icon,
            ),
          ),
          validator: (value) {
            if (value == null) {
              return ' $label ${context.tr.requiredField}';
            }
            return null;
          },
        ),
      ],
    );
  }
}

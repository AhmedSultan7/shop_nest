// import 'package:cards_app/src/screens/drawer/widgets/settings_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../core/consts/app_constants.dart';
//
// class AppSettings extends StatelessWidget {
//   const AppSettings({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SettingsVM>(
//       builder: (context, settingsVM, child) {
//         return Column(
//           children: [
//             //! Change Language
//             SettingsWidget(
//               iconPath: Assets.iconsLang,
//               header: context.tr.languages,
//               trailingWidget: BaseDropDown<Locale>(
//                 value: settingsVM.locale,
//                 onChanged: (value) {
//                   context.toReplacement(const MainScreen());
//                   settingsVM.updateLanguage(value!);
//                 },
//                 data: AppConsts.supportedLocales
//                     .map((loc) => DropdownMenuItem(
//                           value: loc,
//                           child: Text(
//                             context.langText(loc.languageCode),
//                             style: context.labelMedium,
//                           ),
//                         ))
//                     .toList(),
//               ),
//             ),
//
//             context.smallGap,
//
//             //! Change Theme
//
//             SettingsWidget(
//               header: context.tr.appearance,
//               trailingWidget: BaseDropDown<ThemeMode>(
//                 value: settingsVM.themeMode,
//                 onChanged: (value) {
//                   context.back();
//                   settingsVM.changeAppMode(value);
//                 },
//                 data: ThemeMode.values
//                     .map(
//                       (value) => DropdownMenuItem(
//                         value: value,
//                         child: Text(
//                           context.themeText(value.index),
//                           style: context.labelMedium,
//                         ),
//                       ),
//                     )
//                     .toList(),
//               ),
//               iconPath: Assets.iconsApperance,
//             )
//           ],
//         );
//       },
//     );
//   }
// }

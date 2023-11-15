// import 'package:cards_app/src/core/extensions/extensions.dart';
// import 'package:cards_app/src/core/resources/app_radius.dart';
// import 'package:cards_app/src/core/resources/app_spaces.dart';
// import 'package:cards_app/src/core/resources/theme/theme.dart';
// import 'package:cards_app/src/screens/product/view/product_screen/product_screen.dart';
// import 'package:cards_app/src/screens/sub_category/model/sub_category_model.dart';
// import 'package:flutter/material.dart';
//
// class SubCategoryCardWidget extends StatelessWidget {
//   final SubCategoryModel subCategory;
//
//   const SubCategoryCardWidget({
//     super.key,
//     required this.subCategory,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => context.to(ProductByCatScreen(subCategory: subCategory)),
//       child: Container(
//         height: context.height * .15,
//         margin: EdgeInsets.only(bottom: AppSpaces.smallPadding),
//         decoration: BoxDecoration(
//             color: ColorManager.black,
//             borderRadius: BorderRadius.circular(AppRadius.baseRadius)),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: Image.network(
//                 height: context.height * .15,
//                 subCategory.image,
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//               ),
//             ),
//             Positioned.fill(
//               child: Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(.3),
//                   borderRadius: BorderRadius.circular(AppRadius.baseRadius),
//                 ),
//                 child: Center(
//                   child: Text(
//                     subCategory.title,
//                     style: context.headLine.copyWith(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

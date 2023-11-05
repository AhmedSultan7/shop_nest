// // import 'dart:io';
// //
// // import 'package:dotted_border/dotted_border.dart';
// // import 'package:file_picker/file_picker.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:idea2app_vendor_app/src/core/extensions/extensions.dart';
// // import 'package:idea2app_vendor_app/src/core/resources/app_radius.dart';
// // import 'package:idea2app_vendor_app/src/core/shared_widgets/shared_widgets.dart';
// // import 'package:idea2app_vendor_app/src/screens/shared/media/view_models/media_view_model.dart';
// // import 'package:provider/provider.dart';
// //
// // import '../../../../generated/assets.dart';
// // import '../../resources/app_spaces.dart';
// // import '../../resources/theme/theme.dart';
// // import '../cached_images/main_cached_image.dart';
// // import '../icon_widget/icon_widget.dart';
// //
// // class SinglePickImageWidget extends StatelessWidget {
// //   final FilePickerResult? image;
// //   final String? networkImage;
// //
// //   const SinglePickImageWidget({
// //     super.key,
// //     this.networkImage,
// //     this.image,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return _addImageContainer(context, networkImage: networkImage);
// //   }
// //
// //   Widget _addImageContainer(
// //     BuildContext context, {
// //     String? networkImage,
// //   }) {
// //     final showAddButton = image == null && networkImage == null;
// //
// //     if (showAddButton) {
// //       return InkWell(
// //         borderRadius: BorderRadius.circular(20),
// //         onTap: () => context.read<MediaVM>().pickFile(),
// //         child: Container(
// //           height: 120.h,
// //           width: 150.w,
// //           alignment: Alignment.center,
// //           child: DottedBorder(
// //             borderType: BorderType.RRect,
// //             radius: const Radius.circular(AppRadius.baseContainerRadius),
// //             dashPattern: const [
// //               10,
// //               10,
// //             ],
// //             color: Colors.grey,
// //             strokeWidth: 2,
// //             child: Container(
// //                 height: 120.h,
// //                 width: 150.w,
// //                 alignment: Alignment.center,
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     IconWidget(
// //                       height: 50.h,
// //                       width: 50.w,
// //                       icon: Assets.iconsPickImage,
// //                     ),
// //                     Text(
// //                       'Click to browse',
// //                       style: context.labelSmall.copyWith(
// //                           color: Colors.blue, fontWeight: FontWeight.w400),
// //                     )
// //                   ],
// //                 )),
// //           ),
// //         ),
// //       );
// //     }
// //
// //     final pickResultIsNotNull = image?.files != null && image!.files.isNotEmpty;
// //
// //     if (pickResultIsNotNull) {
// //       return Container(
// //         height: 90.h,
// //         width: 110.w,
// //         decoration: BoxDecoration(
// //           borderRadius: BorderRadius.circular(15),
// //         ),
// //         child: ClipRRect(
// //           borderRadius: BorderRadius.circular(15),
// //           child: Image.file(
// //             File(image!.files.first.path!),
// //             fit: BoxFit.cover,
// //           ),
// //         ),
// //       );
// //     }
// //
// //     return Stack(
// //       children: [
// //         ClipRRect(
// //           borderRadius: BorderRadius.circular(AppRadius.baseContainerRadius),
// //           child: BaseCachedImage(
// //             networkImage ?? '',
// //             height: 120.h,
// //             width: 150.w,
// //           ),
// //         ),
// //
// //         //? Edit button
// //         Positioned(
// //           top: 10,
// //           right: 7,
// //           child: CircleAvatar(
// //             maxRadius: 20,
// //             backgroundColor: ColorManager.primaryColor.withOpacity(0.8),
// //             child: IconButton(
// //                 onPressed: () => context.read<MediaVM>().pickFile(),
// //                 icon: const BaseLottieIcon(
// //                   Assets.animatedEdit,
// //                   height: AppSpaces.iconSize,
// //                 )),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
// //
// class PickImageWidget extends StatelessWidget {
//   final bool isSingleImage;
//   final Function()? onTap;
//   final FilePickerResult? image;
//   final List<String?>? images;
//
//   const PickImageWidget({
//     super.key,
//     required this.isSingleImage,
//     required this.onTap,
//     this.images,
//     this.image,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return _addImageContainer(context, isSingleImage, images: images);
//   }
//
//   Widget _addImageContainer(
//     BuildContext context,
//     bool isSingleImage, {
//     List<String?>? images,
//   }) {
//     final viewedImageWidget = ListView.separated(
//             scrollDirection: Axis.horizontal,
//             separatorBuilder: (context, index) => context.mediumGap,
//             itemBuilder: (context, index) {
//               return Row(
//                 children: [
//                   Container(
//                     height: 90.h,
//                     width: 110.w,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(15),
//                       child: Image.file(
//                         File(image!.files[index].path!),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   if (index == image!.files.length - 1 && !isSingleImage) ...[
//                     context.mediumGap,
//                     InkWell(
//                       borderRadius: BorderRadius.circular(20),
//                       onTap: onTap,
//                       child: Container(
//                         height: isSingleImage ? 120.h : 90.h,
//                         width: isSingleImage ? 150.w : 110.w,
//                         alignment: Alignment.center,
//                         child: DottedBorder(
//                           borderType: BorderType.RRect,
//                           radius: const Radius.circular(15),
//                           dashPattern: const [
//                             10,
//                             10,
//                           ],
//                           color: Colors.grey,
//                           strokeWidth: 2,
//                           child: Container(
//                               height: 150,
//                               width: 250,
//                               alignment: Alignment.center,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   IconWidget(
//                                     height: isSingleImage ? 50.h : 35.h,
//                                     width: isSingleImage ? 50.w : 35.w,
//                                     icon: Assets.iconsPickImage,
//                                   ),
//                                   Text(
//                                     'Click to browse',
//                                     style: context.labelSmall.copyWith(
//                                         color: Colors.blue,
//                                         fontWeight: FontWeight.w400),
//                                   )
//                                 ],
//                               )),
//                         ),
//                       ),
//                     ),
//                   ]
//                 ],
//               );
//             },
//             itemCount: image?.files.length ?? 0)
//         .sized(height: 110);
//
//     return image == null && images == null
//         ? InkWell(
//             borderRadius: BorderRadius.circular(20),
//             onTap: onTap,
//             child: Container(
//               height: isSingleImage ? 120.h : 90.h,
//               width: isSingleImage ? 150.w : 110.w,
//               alignment: Alignment.center,
//               child: DottedBorder(
//                 borderType: BorderType.RRect,
//                 radius: const Radius.circular(AppRadius.baseRadius),
//                 dashPattern: const [
//                   10,
//                   10,
//                 ],
//                 color: Colors.grey,
//                 strokeWidth: 2,
//                 child: Container(
//                     height: 150,
//                     width: 250,
//                     alignment: Alignment.center,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconWidget(
//                           height: isSingleImage ? 50.h : 35.h,
//                           width: isSingleImage ? 50.w : 35.w,
//                           icon: Assets.iconsPickImage,
//                         ),
//                         Text(
//                           'Click to browse',
//                           style: context.labelSmall.copyWith(
//                               color: Colors.blue, fontWeight: FontWeight.w400),
//                         )
//                       ],
//                     )),
//               ),
//             ),
//           )
//         : image?.files != null && image!.files.isNotEmpty
//             ? viewedImageWidget
//             : ListView.separated(
//                 itemCount: images?.length ?? 0,
//                 scrollDirection: Axis.horizontal,
//                 separatorBuilder: (_, __) => context.mediumGap,
//                 itemBuilder: (_, index) {
//                   return Row(
//                     children: [
//                       ClipRRect(
//                         borderRadius:
//                             BorderRadius.circular(AppRadius.baseRadius),
//                         child: BaseCachedImage(
//                           images?[index] ?? '',
//                           height: 90.h,
//                           width: 110.w,
//                         ),
//                       ),
//                       if (index == images!.length - 1 && !isSingleImage) ...[
//                         context.mediumGap,
//                         InkWell(
//                           borderRadius: BorderRadius.circular(20),
//                           onTap: onTap,
//                           child: Container(
//                             height: isSingleImage ? 120.h : 90.h,
//                             width: isSingleImage ? 150.w : 110.w,
//                             alignment: Alignment.center,
//                             child: DottedBorder(
//                               borderType: BorderType.RRect,
//                               radius: const Radius.circular(15),
//                               dashPattern: const [
//                                 10,
//                                 10,
//                               ],
//                               color: Colors.grey,
//                               strokeWidth: 2,
//                               child: Container(
//                                   height: 150,
//                                   width: 250,
//                                   alignment: Alignment.center,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       IconWidget(
//                                         height: isSingleImage ? 50.h : 35.h,
//                                         width: isSingleImage ? 50.w : 35.w,
//                                         icon: Assets.iconsPickImage,
//                                       ),
//                                       Text(
//                                         'Click to browse',
//                                         style: context.labelSmall.copyWith(
//                                             color: Colors.blue,
//                                             fontWeight: FontWeight.w400),
//                                       )
//                                     ],
//                                   )),
//                             ),
//                           ),
//                         ),
//                       ]
//                     ],
//                   );
//                 },
//               ).sized(height: 110.h);
//   }
// }

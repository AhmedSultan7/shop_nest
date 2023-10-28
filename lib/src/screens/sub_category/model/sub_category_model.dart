import 'package:cards_app/generated/assets.dart';

class SubCategoryModel {
  final String image;
  final String title;

  SubCategoryModel({
    required this.image,
    required this.title,
  });

  static List<SubCategoryModel> subCategoryList = [
    SubCategoryModel(image: Assets.imagesApex, title: 'PathFinder'),
    SubCategoryModel(image: Assets.imagesApex, title: 'Mirage'),
    SubCategoryModel(image: Assets.imagesApex, title: 'Giby'),
    SubCategoryModel(image: Assets.imagesApex, title: 'Seer'),
    SubCategoryModel(image: Assets.imagesApex, title: 'PathFinder'),
  ];
}

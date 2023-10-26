import 'package:cards_app/generated/assets.dart';

class CategoryModel {
  final String image;
  final String title;

  CategoryModel({required this.image, required this.title});

  static List<CategoryModel> categoryList = [
    CategoryModel(image: Assets.imagesApex, title: 'PathFinder'),
    CategoryModel(image: Assets.imagesApex, title: 'Mirage'),
    CategoryModel(image: Assets.imagesApex, title: 'Giby'),
    CategoryModel(image: Assets.imagesApex, title: 'Seer'),
    CategoryModel(image: Assets.imagesApex, title: 'PathFinder'),
  ];
}

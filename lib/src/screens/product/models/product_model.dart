import 'package:cards_app/generated/assets.dart';

class ProductModel {
  final String image;
  final String title;
  final num price;

  ProductModel({required this.price, required this.image, required this.title});

  static List<ProductModel> productList = [
    ProductModel(
      price: 20,
      image: Assets.imagesApex,
      title: 'PathFinder',
    ),
    ProductModel(
      price: 20,
      image: Assets.imagesApex,
      title: 'PathFinder',
    ),
    ProductModel(
      price: 20,
      image: Assets.imagesApex,
      title: 'PathFinder',
    ),
    ProductModel(
      price: 20,
      image: Assets.imagesApex,
      title: 'PathFinder',
    ),
    ProductModel(
      price: 20,
      image: Assets.imagesApex,
      title: 'PathFinder',
    ),
  ];
}

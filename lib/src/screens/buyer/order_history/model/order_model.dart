import 'package:intl/intl.dart';

import '../../../../core/data/remote/response/api_strings.dart';
import '../../../auth/model/user_model.dart';
import '../../../auth/repository/local_repo/auth_local_repo.dart';
import '../../../seller/product/models/product_model.dart';

class OrderModel {
  final int? id;
  final num? totalPrice;
  final String? createdAt;
  final List<ProductModel>? products;
  final UserModel? user;
  final List<UserModel>? sellers;

  OrderModel({
    this.id,
    required this.totalPrice,
    required this.products,
    required this.sellers,
    this.createdAt,
    required this.user,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    // * -----------------------------------------------

    final product =
        json[ApiStrings.attributes][ApiStrings.products][ApiStrings.data] ?? [];

    final productList =
        List<ProductModel>.from(product.map((e) => ProductModel.fromJson(e)))
            .toList();

    // * -----------------------------------------------

    final sellers =
        json[ApiStrings.attributes][ApiStrings.sellers][ApiStrings.data];

    final sellerList = List<UserModel>.from(
        sellers.map((seller) => UserModel.fromJson(seller))).toList();
    // * -----------------------------------------------

    final user = json[ApiStrings.attributes][ApiStrings.user] != null
        ? UserModel.fromOrderJson(json[ApiStrings.attributes][ApiStrings.user])
        : null;

    // * -----------------------------------------------

    String dateString = json[ApiStrings.attributes][ApiStrings.createdAt];
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(dateTime);

    // * ------------------------------------------------------------------

    return OrderModel(
      id: json[ApiStrings.id],
      totalPrice: json[ApiStrings.attributes][ApiStrings.totalPrice] ?? '',
      products: productList,
      createdAt: formattedDate,
      sellers: sellerList,
      user: user,
    );
  }

  static Future<String> orderFilter(AuthLocalRepo authLocalRepo) async {
    final user = await authLocalRepo.getUserData();

    final userId = user.user!.id;

    final userFilter = '?filters[user][id][\$eq]=$userId';
    return userFilter;
  }

  Map<String, dynamic> toJson() {
    return {
      ApiStrings.totalPrice: totalPrice,
      ApiStrings.user: user!.id,
      ApiStrings.sellers: sellers?.map((seller) => seller.id).toList()
    };
  }
}

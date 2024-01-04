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
  final List<UserModel?> sellers;

  OrderModel({
    this.id,
    required this.totalPrice,
    required this.products,
    this.sellers = const [],
    this.createdAt,
    required this.user,
  });

  //! From Json ---------------------------------------
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final attributes = json[ApiStrings.attributes];

    // * -----------------------------------------------

    final product = attributes[ApiStrings.products][ApiStrings.data] ?? [];

    final productList =
        List<ProductModel>.from(product.map((e) => ProductModel.fromJson(e)))
            .toList();

    // * -----------------------------------------------

    final sellers = attributes[ApiStrings.sellers][ApiStrings.data];

    final sellerList = List<UserModel>.from(
        sellers.map((seller) => UserModel.fromJson(seller))).toList();

    // * -----------------------------------------------

    final user = attributes[ApiStrings.user] != null
        ? UserModel.fromOrderJson(json[ApiStrings.attributes][ApiStrings.user])
        : null;

    // * -----------------------------------------------

    String dateString = attributes[ApiStrings.createdAt];
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(dateTime);

    // * ------------------------------------------------------------------

    return OrderModel(
      id: json[ApiStrings.id],
      totalPrice: attributes[ApiStrings.totalPrice] ?? '',
      products: productList,
      createdAt: formattedDate,
      sellers: sellerList,
      user: user,
    );
  }

  //! Order Filter ===================================
  static Future<String> orderFilter(AuthLocalRepo authLocalRepo) async {
    final user = await authLocalRepo.getUserData();
    final type = user.user?.isSeller  == true ? "sellers" : "user";
    final userId = user.user!.id;

    final userFilter = '?filters[$type][id][\$eq]=$userId';
    return userFilter;
  }

  //! To Json ===================================
  Map<String, dynamic> toJson() {
    return {
      ApiStrings.totalPrice: totalPrice,
      ApiStrings.user: user!.id,
      ApiStrings.sellers: sellers.map((seller) => seller?.id).toList(),
      ApiStrings.products: products?.map((product) => product.id).toList(),
    };
  }
}

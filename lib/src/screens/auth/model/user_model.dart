import 'dart:developer';

import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:cards_app/src/core/utils/logger.dart';
import 'package:cards_app/src/screens/auth/repository/local_repo/auth_local_repo.dart';

enum UserTypeEnum { seller, buyer }

class MainUserModel {
  final String? jwt;
  final UserModel? user;

  const MainUserModel({this.jwt, this.user});

  factory MainUserModel.fromJson(Map<dynamic, dynamic> json) {
    return MainUserModel(
        jwt: json[ApiStrings.jwt],
        user: UserModel.fromJson(json[ApiStrings.user]));
  }

  factory MainUserModel.empty() => const MainUserModel();

  Map<String, dynamic> toJson() {
    return {ApiStrings.jwt: jwt, ApiStrings.user: user?.toJson(sendId: true)};
  }

  //? Copy With ====================================
  MainUserModel copyWith({
    String? jwt,
    UserModel? user,
  }) {
    return MainUserModel(
      jwt: jwt ?? this.jwt,
      user: user ?? this.user,
    );
  }
}

class UserModel {
  final int? id;
  final String userName;
  final String email;
  final String? password;
  final String? identifier;
  final UserTypeEnum? usertype;

  const UserModel({
    this.id,
    this.identifier,
    this.userName = '',
    this.password,
    this.email = '',
    this.usertype,
  });

  bool get isSeller => usertype == UserTypeEnum.seller;

  factory UserModel.fromJson(Map<dynamic, dynamic> json) {
    final userType = json[ApiStrings.userType] == ApiStrings.seller
        ? UserTypeEnum.seller
        : UserTypeEnum.buyer;
    return UserModel(
        id: json[ApiStrings.id],
        userName: json[ApiStrings.username] ?? '',
        email: json[ApiStrings.email] ?? '',
        password: json[ApiStrings.password],
        identifier: json[ApiStrings.identifier] ?? '',
        usertype: userType);
  }

  factory UserModel.fromOrderJson(Map<String, dynamic> json) {
    final data = json[ApiStrings.data];
    final attributes = data[ApiStrings.attributes];
    log('asfasfsaf $json');
    Log.i(' ================verrthtrh${attributes}');

    final userType = attributes[ApiStrings.userType] == ApiStrings.seller
        ? UserTypeEnum.seller
        : UserTypeEnum.buyer;

    return UserModel(
        id: data[ApiStrings.id],
        userName: attributes[ApiStrings.username] ?? '',
        email: attributes[ApiStrings.email] ?? '',
        password: attributes[ApiStrings.password],
        identifier: attributes[ApiStrings.identifier] ?? '',
        usertype: userType);
  }

  factory UserModel.empty() => const UserModel();

  Map<String, dynamic> toJson({
    bool sendId = false,
  }) {
    return {
      if (id != null && sendId) ApiStrings.id: id,
      ApiStrings.username: userName,
      if (password != null && password!.isNotEmpty)
        ApiStrings.password: password,
      ApiStrings.email: email,
      if (identifier != null) ApiStrings.identifier: identifier,
      if (usertype != null) ApiStrings.userType: usertype!.name,
    };
  }

  //? Copy With ====================================
  UserModel copyWith({
    int? id,
    String? userName,
    String? email,
    String? password,
    String? identifier,
    UserTypeEnum? usertype,
  }) {
    return UserModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      identifier: identifier ?? this.identifier,
      usertype: usertype ?? this.usertype,
    );
  }

  static Future<String> vendorFilter(AuthLocalRepo authLocalRepo) async {
    final mainUser = await authLocalRepo.getUserData();

    final isSeller = mainUser.user?.isSeller ?? false ;

    final sellerId = mainUser.user!.id;

    //filters[seller][id][$eq]=23

    final sellerFilter = isSeller ? '?filters[seller][id][\$eq]=$sellerId' : '';

    return sellerFilter;
  }

  static Future<UserModel?> userData(AuthLocalRepo authLocalRepo) async {
    final mainUser = await authLocalRepo.getUserData();

    final user = mainUser.user;

    return user;
  }
}

userTypeToString(UserTypeEnum type) {
  switch (type) {
    case UserTypeEnum.seller:
      return ApiStrings.sellerAr;
    case UserTypeEnum.buyer:
      return ApiStrings.buyerAr;
  }
}

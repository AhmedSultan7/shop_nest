import 'package:cards_app/src/core/data/remote/response/api_strings.dart';

enum UserTypeEnum { seller, buyer }

class UserModel {
  final String? jwt;
  final User? user;

  const UserModel({this.jwt, this.user});

  factory UserModel.fromJson(Map<dynamic, dynamic> json) {
    return UserModel(
        jwt: json[ApiStrings.jwt], user: User.fromJson(json[ApiStrings.user]));
  }

  factory UserModel.empty() => const UserModel();

  Map<String, dynamic> toJson() {
    return {ApiStrings.jwt: jwt, ApiStrings.user: user?.toJson()};
  }
}

class User {
  final int? id;
  final String userName;
  final String email;
  final String? password;
  final String? identifier;
  final UserTypeEnum? usertype;

  const User({
    this.id,
    this.identifier,
    this.userName = '',
    this.password,
    this.email = '',
    this.usertype,
  });

  factory User.fromJson(Map<dynamic, dynamic> json) {
    final userType = json[ApiStrings.userType] == ApiStrings.seller
        ? UserTypeEnum.seller
        : UserTypeEnum.buyer;
    return User(
        id: json[ApiStrings.id],
        userName: json[ApiStrings.username] ?? '',
        email: json[ApiStrings.email] ?? '',
        password: json[ApiStrings.password],
        identifier: json[ApiStrings.identifier] ?? '',
        usertype: userType);
  }

  factory User.empty() => const User();

  Map<String, dynamic> toJson() {
    return {
      if (id != null) ApiStrings.id: id,
      ApiStrings.username: userName,
      if (password != null) ApiStrings.password: password,
      ApiStrings.email: email,
      if (identifier != null) ApiStrings.identifier: identifier,
      if (usertype != null) ApiStrings.userType: usertype!.name,
    };
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

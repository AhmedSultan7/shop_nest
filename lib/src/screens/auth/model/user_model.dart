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
    return {ApiStrings.jwt: jwt, ApiStrings.user: user?.toJson(sendId: true)};
  }

  //? Copy With ====================================
  UserModel copyWith({
    String? jwt,
    User? user,
  }) {
    return UserModel(
      jwt: jwt ?? this.jwt,
      user: user ?? this.user,
    );
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
  User copyWith({
    int? id,
    String? userName,
    String? email,
    String? password,
    String? identifier,
    UserTypeEnum? usertype,
  }) {
    return User(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      identifier: identifier ?? this.identifier,
      usertype: usertype ?? this.usertype,
    );
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

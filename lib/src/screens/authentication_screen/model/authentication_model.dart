class UserModel {
  String? jwt;
  User? user;

  UserModel({this.jwt, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jwt'] = jwt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? email;

  User({
    this.id,
    this.username,
    this.email,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    return data;
  }
}

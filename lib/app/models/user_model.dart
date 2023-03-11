import 'dart:convert';

class UserModel {
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      user: map['user'] as String,
      password: map['password'] as String,
    );
  }
  UserModel({
    required this.user,
    required this.password,
  });
  String user;
  String password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}

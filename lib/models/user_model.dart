import 'dart:convert';

class UserModel {
  final String userName;
  final String userEmail;

  UserModel({required this.userName, required this.userEmail});

  Map<String, dynamic> toMap() => {'username': userName, 'useremail': userEmail};

  factory UserModel.fromMap(Map<String, dynamic> userMap) => UserModel(
      userName: userMap['username']!, userEmail: userMap['useremail']!);

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}

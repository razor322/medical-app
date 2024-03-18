// To parse this JSON data, do
//
//     final modelEditUser = modelEditUserFromJson(jsonString);

import 'dart:convert';

ModelEditUser modelEditUserFromJson(String str) =>
    ModelEditUser.fromJson(json.decode(str));

String modelEditUserToJson(ModelEditUser data) => json.encode(data.toJson());

class ModelEditUser {
  bool isSuccess;
  int value;
  String message;
  String username;
  String email;
  String id;

  ModelEditUser({
    required this.isSuccess,
    required this.value,
    required this.message,
    required this.username,
    required this.email,
    required this.id,
  });

  factory ModelEditUser.fromJson(Map<String, dynamic> json) => ModelEditUser(
        isSuccess: json["is_success"],
        value: json["value"],
        message: json["message"],
        username: json["username"],
        email: json["email"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "is_success": isSuccess,
        "value": value,
        "message": message,
        "username": username,
        "email": email,
        "id": id,
      };
}

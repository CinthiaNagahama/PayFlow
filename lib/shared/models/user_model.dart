import 'dart:convert';

class UserModel {
  final String username;
  final String? userPhotoURL;

  UserModel({required this.username, this.userPhotoURL});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(username: map["username"], userPhotoURL: map["userPhotoURL"]);
  }

  Map<String, dynamic> toMap() => {
        "username": username,
        "userPhotoURL": userPhotoURL,
      };

  factory UserModel.fromJson(String json) => UserModel.fromMap(jsonDecode(json));

  String toJson() => jsonEncode(toMap());
}

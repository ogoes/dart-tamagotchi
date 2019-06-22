import 'dart:convert';


User userFromJson(String source) {
  final json = jsonDecode(source);
  return User.fromJson(json);
}

String userToJson(User source) {
  final data = source.toJson();
  return jsonEncode(data);
}

class User {
  int id;
  String username;
  String password;

  User({
    this.username,
    this.password,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        password: json["password"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() =>
      {"id": id, "username": username, "password": password};
}

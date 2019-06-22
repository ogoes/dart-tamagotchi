import 'dart:convert';

Pet petFromJson(String source) {
  final json = jsonDecode(source);
  return Pet.fromJson(json);
}

String petToJson(Pet source) {
  final data = source.toJson();
  return jsonEncode(data);
}

class Pet {
  int id;
  int userId;
  String name;
  String password;

  Pet({
    this.name,
    this.password,
    this.id,
    this.userId,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        name: json["name"],
        password: json["password"],
        id: json["id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "password": password,
        "user_id": userId,
      };
}

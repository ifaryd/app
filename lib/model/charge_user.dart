// To parse this JSON data, do
//
//     final modelUsers = modelUsersFromJson(jsonString);

import 'dart:convert';

ModelUsers modelUsersFromJson(String str) => ModelUsers.fromJson(json.decode(str));

String modelUsersToJson(ModelUsers data) => json.encode(data.toJson());

class ModelUsers {
    ModelUsers({
      required  this.id,
      required  this.firstName,
      required  this.lastName,
      required  this.telephone,
      required  this.email,
      required  this.avatar,
      required  this.youtube,
      required  this.facebook,
      required  this.createdAt,
      required  this.updatedAt,
      required  this.deletedAt,
    });

    int id;
    String? firstName;
    String? lastName;
    String? telephone;
    dynamic email;
    dynamic avatar;
    dynamic youtube;
    dynamic facebook;
    String createdAt;
    String updatedAt;
    dynamic deletedAt;

    factory ModelUsers.fromJson(Map<String, dynamic> json) => ModelUsers(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        telephone: json["telephone"],
        email: json["email"],
        avatar: json["avatar"],
        youtube: json["youtube"],
        facebook: json["facebook"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "telephone": telephone,
        "email": email,
        "avatar": avatar,
        "youtube": youtube,
        "facebook": facebook,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
    };
}

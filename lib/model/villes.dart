// To parse this JSON data, do
//
//     final villemodel = villemodelFromJson(jsonString);

import 'dart:convert';

Villemodel villemodelFromJson(String str) =>
    Villemodel.fromJson(json.decode(str));

String villemodelToJson(Villemodel data) => json.encode(data.toJson());

class Villemodel {
  Villemodel({
   required this.id,
   required this.libelle,
   required this.description,
   required this.paysId,
   required this.createdAt,
   required this.updatedAt,
   required this.deletedAt,
  });

  int id;
  String libelle;
  dynamic? description;
  int? paysId;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;

  factory Villemodel.fromJson(Map<String, dynamic> json) => Villemodel(
        id: json["id"],
        libelle: json["libelle"],
        description: json["description"],
        paysId: json["pays_id"],
        createdAt: json["created_at"],
        updatedAt:json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
        "description": description,
        "pays_id": paysId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}

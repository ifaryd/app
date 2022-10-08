// To parse this JSON data, do
//
//     final paysmodel = paysmodelFromJson(jsonString);

import 'dart:convert';

Paysmodel paysmodelFromJson(String str) => Paysmodel.fromJson(json.decode(str));

String paysmodelToJson(Paysmodel data) => json.encode(data.toJson());

class Paysmodel {
  Paysmodel({
    required this.id,
    required this.nom,
    required this.sigle,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    //required this.langues,
  });

  int id;
  String nom;
  String sigle;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;
  //List<dynamic>? langues;

  factory Paysmodel.fromJson(Map<String, dynamic> json) => Paysmodel(
        id: json["id"],
        nom: json["nom"],
        sigle: json["sigle"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      //  langues: List<dynamic>.from(json["langues"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "sigle": sigle,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
       // "langues": List<dynamic>.from(langues!.map((x) => x)),
      };
}

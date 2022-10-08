// To parse required this.JSON data, do
//
//     final modelAssemblee = modelAssembleeFromJson(jsonString);

import 'dart:convert';

ModelAssemblee modelAssembleeFromJson(String str) => ModelAssemblee.fromJson(json.decode(str));

String modelAssembleeToJson(ModelAssemblee data) => json.encode(data.toJson());

class ModelAssemblee {
    ModelAssemblee({
        required this.data,
    });

    List<Datum> data;

    factory ModelAssemblee.fromJson(Map<String, dynamic> json) => ModelAssemblee(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.nom,
        required this.villeId,
        required this.localisation,
        required this.addresse,
        required this.photo,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
    });

    int id;
    String nom;
    int villeId;
    dynamic localisation;
    String addresse;
    String photo;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nom: json["nom"],
        villeId: json["ville_id"],
        localisation: json["localisation"],
        addresse: json["addresse"],
        photo: json["photo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "ville_id": villeId,
        "localisation": localisation,
        "addresse": addresse,
        "photo": photo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}

// To parserequired this.JSON data, do
//
//     final modelverset = modelversetFromJson(jsonString);

import 'dart:convert';

class ModelVerset {
    ModelVerset({
       required this.id,
       required this.numero,
       required this.contenu,
       required this.info,
       required this.predicationId,
       required this.createdAt,
       required this.updatedAt,
       required this.deletedAt,
    });

    int id;
    int numero;
    String contenu;
    dynamic info;
    int predicationId;
    String createdAt;
    String updatedAt;
    dynamic deletedAt;

    factory ModelVerset.fromJson(Map<String, dynamic> json) => ModelVerset(
        id: json["id"],
        numero: json["numero"],
        contenu: json["contenu"],
        info: json["info"],
        predicationId: json["predication_id"],
        createdAt:json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "numero": numero,
        "contenu": contenu,
        "info": info,
        "predication_id": predicationId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
    };
}

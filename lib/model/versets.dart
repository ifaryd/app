// To parserequired this.JSON data, do
//
//     final modelverset = modelversetFromJson(jsonString);

import 'dart:convert';

Modelverset modelversetFromJson(String str) => Modelverset.fromJson(json.decode(str));

String modelversetToJson(Modelverset data) => json.encode(data.toJson());

class Modelverset {
    Modelverset({
       required this.versets,
    });

    List<Verset> versets;

    factory Modelverset.fromJson(Map<String, dynamic> json) => Modelverset(
        versets: List<Verset>.from(json["versets"].map((x) => Verset.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "versets": List<dynamic>.from(versets.map((x) => x.toJson())),
    };
}

class Verset {
    Verset({
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
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    factory Verset.fromJson(Map<String, dynamic> json) => Verset(
        id: json["id"],
        numero: json["numero"],
        contenu: json["contenu"],
        info: json["info"],
        predicationId: json["predication_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "numero": numero,
        "contenu": contenu,
        "info": info,
        "predication_id": predicationId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}

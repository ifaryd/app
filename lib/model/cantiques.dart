// To parse this JSON data, do
//
//     final modelCantiques = modelCantiquesFromJson(jsonString);

import 'dart:convert';

ModelCantiques modelCantiquesFromJson(String str) => ModelCantiques.fromJson(json.decode(str));

String modelCantiquesToJson(ModelCantiques data) => json.encode(data.toJson());

class ModelCantiques {
    ModelCantiques({
      required  this.id,
      required  this.titre,
      required  this.lienAudio,
      required  this.nomFichier,
      required  this.contenu,
      required  this.duree,
      required  this.langueId,
      required  this.userId,
      required  this.createdAt,
      required  this.updatedAt,
      required  this.deletedAt,
      required  this.langue,
    });

    int id;
    String titre;
    String lienAudio;
    String nomFichier;
    dynamic? contenu;
    int duree;
    dynamic? langueId;
    int userId;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic? deletedAt;
    dynamic? langue;

    factory ModelCantiques.fromJson(Map<String, dynamic> json) => ModelCantiques(
        id: json["id"],
        titre: json["titre"],
        lienAudio: json["lien_audio"],
        nomFichier: json["nom_fichier"],
        contenu: json["contenu"],
        duree: json["duree"],
        langueId: json["langue_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        langue: json["langue"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titre": titre,
        "lien_audio": lienAudio,
        "nom_fichier": nomFichier,
        "contenu": contenu,
        "duree": duree,
        "langue_id": langueId,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "langue": langue,
    };
}

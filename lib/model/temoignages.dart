// To parse this JSON data, do
//
//     final modelTemoignages = modelTemoignagesFromJson(jsonString);

import 'dart:convert';

ModelTemoignages modelTemoignagesFromJson(String str) => ModelTemoignages.fromJson(json.decode(str));

String modelTemoignagesToJson(ModelTemoignages data) => json.encode(data.toJson());

class ModelTemoignages {
    ModelTemoignages({
      required  this.id,
      required  this.titre,
      required  this.lienVideo,
      required  this.photo,
      required  this.contenu,
      required  this.langueId,
      required  this.createdAt,
      required  this.updatedAt,
      required  this.deletedAt,
    });

    int? id;
    String? titre;
    dynamic? lienVideo;
    dynamic? photo;
    String? contenu;
    int langueId;
    String createdAt;
    String updatedAt;
    dynamic? deletedAt;

    factory ModelTemoignages.fromJson(Map<String, dynamic> json) => ModelTemoignages(
        id: json["id"],
        titre: json["titre"],
        lienVideo: json["lien_video"],
        photo: json["photo"],
        contenu: json["contenu"],
        langueId: json["langue_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titre": titre,
        "lien_video": lienVideo,
        "photo": photo,
        "contenu": contenu,
        "langue_id": langueId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
    };
}

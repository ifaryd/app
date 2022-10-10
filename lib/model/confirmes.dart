// To parse this JSON data, do
//
//     final modelConfirmes = modelConfirmesFromJson(jsonString);

import 'dart:convert';

ModelConfirmes modelConfirmesFromJson(String str) => ModelConfirmes.fromJson(json.decode(str));

String modelConfirmesToJson(ModelConfirmes data) => json.encode(data.toJson());

class ModelConfirmes {
    ModelConfirmes({
      required  this.id,
      required  this.userId,
      required  this.paysId,
      required  this.videoId,
      required  this.langueId,
      required  this.details,
      required  this.createdAt,
      required  this.updatedAt,
      required  this.deletedAt,
    });

    int id;
    int userId;
    int paysId;
    dynamic? videoId;
    int langueId;
    String details;
    String createdAt;
    String updatedAt;
    dynamic? deletedAt;

    factory ModelConfirmes.fromJson(Map<String, dynamic> json) => ModelConfirmes(
        id: json["id"],
        userId: json["user_id"],
        paysId: json["pays_id"],
        videoId: json["video_id"],
        langueId: json["langue_id"],
        details: json["details"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "pays_id": paysId,
        "video_id": videoId,
        "langue_id": langueId,
        "details": details,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
    };
}

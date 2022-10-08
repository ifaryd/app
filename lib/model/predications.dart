class ModelPredications {
    ModelPredications({
      required this.id,
      required this.titre,
      required this.sousTitre,
      required this.numero,
      required this.lienAudio,
      required this.nomAudio,
      required this.lienVideo,
      required this.duree,
      required this.chapitre,
      required this.couverture,
      required this.sermonSimilaire,
      required this.langueId,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt,
    });

    int id;
    String titre;
    String? sousTitre;
    int numero;
    String? lienAudio;
    String? nomAudio;
    dynamic? lienVideo;
    int duree;
    String chapitre;
    String? couverture;
    String? sermonSimilaire;
    int? langueId;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic? deletedAt;

    factory ModelPredications.fromJson(Map<String, dynamic> json) => ModelPredications(
        id: json["id"],
        titre: json["titre"],
        sousTitre: json["sous_titre"],
        numero: json["numero"],
        lienAudio: json["lien_audio"],
        nomAudio: json["nom_audio"],
        lienVideo: json["lien_video"],
        duree: json["duree"],
        chapitre: json["chapitre"],
        couverture: json["couverture"],
        sermonSimilaire: json["sermon_similaire"],
        langueId: json["langue_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titre": titre,
        "sous_titre": sousTitre,
        "numero": numero,
        "lien_audio": lienAudio,
        "nom_audio": nomAudio,
        "lien_video": lienVideo,
        "duree": duree,
        "chapitre": chapitre,
        "couverture": couverture,
        "sermon_similaire": sermonSimilaire,
        "langue_id": langueId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
    };
}

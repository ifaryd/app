class classPredications {
  String? id;
  String? titre;
  String? sous_titre;
  String? numero;
  String? lien_audio;
  String? nom_audio;
  String? lien_video;
  String? duree;
  String? chapitre;
  String? couverture;
  String? sermon_similaire;
  String? langue_id;

  classPredications(
      this.id,
      this.titre,
      this.sous_titre,
      this.numero,
      this.lien_audio,
      this.nom_audio,
      this.lien_video,
      this.duree,
      this.chapitre,
      this.couverture,
      this.sermon_similaire,
      this.langue_id);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titre': titre,
      'sous_titre': sous_titre,
      'numero': numero,
      'lien_audio': lien_audio,
      'nom_audio': nom_audio,
      'lien_video': lien_video,
      'duree': duree,
      'chapitre': chapitre,
      'couverture': couverture,
      'sermon_similaire': sermon_similaire,
      'langue_id': langue_id
    };
  }

  factory classPredications.fromMap(Map<String, dynamic> map) => classPredications(
      map['id'],
      map['titre'],
      map['sous_titre'],
      map['numero'],
      map['lien_audio'],
      map['nom_audio'],
      map['lien_video'],
      map['duree'],
      map['chapitre'],
      map['couverture'],
      map['sermon_similaire'],
      map['langue_id']);
}

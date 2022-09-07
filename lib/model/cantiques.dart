class Cantiques {
  int id;
  String titre;
  String lien_audio;
  String contenu;
  int duree;
  int langue_id;
  int user_id;

  Cantiques(this.id, this.titre, this.lien_audio, this.contenu, this.duree,
      this.langue_id, this.user_id);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titre': titre,
      'lien_audio': lien_audio,
      'contenu': contenu,
      'duree': duree,
      'langue_id': langue_id,
      'user_id': user_id,
    };
  }

  factory Cantiques.fromMap(Map<String, dynamic> map) => Cantiques(
      map['id'],
      map['titre'],
      map['lien_audio'],
      map['contenu'],
      map['duree'],
      map['langue_id'],
      map['user_id']);
}

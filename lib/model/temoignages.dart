class Temoignages {
  int id;
  String titre;
  String lien_video;
  String photo;
  String contenu;
  int langue_id;

  Temoignages(this.id, this.titre, this.lien_video, this.photo, this.contenu,
      this.langue_id);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titre': titre,
      'lien_video': lien_video,
      'photo': photo,
      'contenu': contenu,
      'langue_id': langue_id
    };
  }

  factory Temoignages.fromMap(Map<String, dynamic> map) => Temoignages(
      map['id'],
      map['titre'],
      map['lien_video'],
      map['photo'],
      map['contenu'],
      map['langue_id']);
}

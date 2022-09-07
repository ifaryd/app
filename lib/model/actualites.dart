class Actualites {
  int id;
  String miniature;
  String contenu;
  String video;
  int langue_id;

  Actualites(this.id, this.miniature, this.contenu, this.video, this.langue_id);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'miniature': miniature,
      'contenu': contenu,
      'video': video,
      'langue_id': langue_id
    };
  }

  factory Actualites.fromMap(Map<String, dynamic> map) => Actualites(map['id'],
      map['miniature'], map['contenu'], map['video'], map['langue_id']);
}

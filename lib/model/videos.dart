class Videos {
  int id;
  String titre;
  String url;
  String lieu;
  String description;
  int type_id;
  int langue_id;

  Videos(this.id, this.titre, this.url, this.lieu, this.description,
      this.type_id, this.langue_id);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titre': titre,
      'url': url,
      'lieu': lieu,
      'description': description,
      'type_id': type_id,
      'langue_id': langue_id
    };
  }

  factory Videos.fromMap(Map<String, dynamic> map) => Videos(
      map['id'],
      map['titre'],
      map['url'],
      map['lieu'],
      map['description'],
      map['type_id'],
      map['langue_id']);
}

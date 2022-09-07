class Versets {
  int id;
  int numero;
  String contenu;
  String info;
  int predication_id;

  Versets(this.id, this.numero, this.contenu, this.info, this.predication_id);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'numero': numero,
      'contenu': contenu,
      'info': info,
      'predication_id': predication_id
    };
  }

  factory Versets.fromMap(Map<String, dynamic> map) => Versets(map['id'],
      map['numero'], map['contenu'], map['info'], map['predication_id']);
}

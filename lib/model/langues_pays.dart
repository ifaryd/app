class Langue_pays {
  int id;
  int langue_id;
  int pays_id;
  int principal;

  Langue_pays(this.id, this.langue_id, this.pays_id, this.principal);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'langue_id': langue_id,
      'pays_id': pays_id,
      'principal': principal
    };
  }

  factory Langue_pays.fromMap(Map<String, dynamic> map) => Langue_pays(
      map['id'], map['langue_id'], map['pays_id'], map['principal']);
}

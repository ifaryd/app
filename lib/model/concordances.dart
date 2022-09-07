class Concordances {
  int id;
  int verset_from_id;
  int verset_to_id;

  Concordances(this.id, this.verset_from_id, this.verset_to_id);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'verset_from_id': verset_from_id,
      'verset_to_id': verset_to_id
    };
  }

  factory Concordances.fromMap(Map<String, dynamic> map) =>
      Concordances(map['id'], map['verset_from_id'], map['verset_to_id']);
}

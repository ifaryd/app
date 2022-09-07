class Villes {
  int id;
  String libelle;
  int pays_id;

  Villes(this.id, this.libelle, this.pays_id);

  Map<String, dynamic> toMap() {
    return {'id': id, 'libelle': libelle, 'description': pays_id};
  }

  factory Villes.fromMap(Map<String, dynamic> map) =>
      Villes(map['id'], map['libelle'], map['pays_id']);
}

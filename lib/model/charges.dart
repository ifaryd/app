class Charges {
  int id;
  String libelle;
  String description;

  Charges(this.id, this.libelle, this.description);

  Map<String, dynamic> toMap() {
    return {'id': id, 'libelle': libelle, 'description': description};
  }

  factory Charges.fromMap(Map<String, dynamic> map) =>
      Charges(map['id'], map['libelle'], map['description']);
}

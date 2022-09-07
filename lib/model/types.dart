class Types {
  int id;
  String libelle;
  String description;

  Types(this.id, this.libelle, this.description);

  Map<String, dynamic> toMap() {
    return {'id': id, 'libelle': libelle, 'description': description};
  }

  factory Types.fromMap(Map<String, dynamic> map) =>
      Types(map['id'], map['libelle'], map['description']);
}

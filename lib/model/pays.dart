class Classpays {
  String id;
  String nom;
  String sigle;

  Classpays(this.id, this.nom, this.sigle);

  Map<String, dynamic> toMap() {
    return {'id': id, 'nom': nom, 'sigle': sigle};
  }

  factory Classpays.fromMap(Map<String, dynamic> map) =>
      Classpays(map['id'], map['nom'], map['sigle']);
}

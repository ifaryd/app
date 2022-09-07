class Pays {
  int id;
  String nom;
  String sigle;

  Pays(this.id, this.nom, this.sigle);

  Map<String, dynamic> toMap() {
    return {'id': id, 'nom': nom, 'sigle': sigle};
  }

  factory Pays.fromMap(Map<String, dynamic> map) =>
      Pays(map['id'], map['nom'], map['sigle']);
}

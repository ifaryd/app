class ClassAssemblees {
  int id;
  String nom;
  int ville_id;
  String localisation;
  String addresse;
  String photo;

  ClassAssemblees(this.id, this.nom, this.ville_id, this.localisation, this.addresse,
      this.photo);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'ville_id': ville_id,
      'localisation': localisation,
      'addresse': addresse,
      'photo': photo
    };
  }

  factory ClassAssemblees.fromMap(Map<String, dynamic> map) => ClassAssemblees(
      map['id'],
      map['nom'],
      map['ville_id'],
      map['localisation'],
      map['addresse'],
      map['photo']);
}

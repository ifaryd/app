class Langues {
  int id;
  String libelle;
  String initial;

  Langues(this.id, this.libelle, this.initial);

  Map<String, dynamic> toMap() {
    return {'id': id, 'libelle': libelle, 'initial': initial};
  }

  factory Langues.fromMap(Map<String, dynamic> map) =>
      Langues(map['id'], map['libelle'], map['initial']);
}

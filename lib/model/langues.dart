class LangModel {
  int id;
  String libelle;
  String initial;
  String created_at;
  String updated_at;
  String deleted_at;

  LangModel(this.id, this.libelle, this.initial,this.created_at,this.updated_at,this.deleted_at);

  Map<String, dynamic> toMap() {
    return {'id': id, 'libelle': libelle, 'initial': initial, 'created_at':created_at, 'updated_at':updated_at, 'deleted_at':deleted_at};
  }

  factory LangModel.fromMap(Map<String, dynamic> map) =>
      LangModel(map['id'], map['libelle'], map['initial'], map['created_at'], map['updated_at'], map['deleted_at']);
}

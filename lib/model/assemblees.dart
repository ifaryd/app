class assemblesmodel {
  int? id;
  String? nom;
  int? villeId;
  String? localisation;
  String? addresse;
  String? photo;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  assemblesmodel(
      {
      required this.id,
      required this.nom,
      required this.villeId,
      required this.localisation,
      required this.addresse,
      required this.photo,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt});

  assemblesmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    villeId = json['ville_id'];
    localisation = json['localisation'];
    addresse = json['addresse'];
    photo = json['photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['ville_id'] = this.villeId;
    data['localisation'] = this.localisation;
    data['addresse'] = this.addresse;
    data['photo'] = this.photo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

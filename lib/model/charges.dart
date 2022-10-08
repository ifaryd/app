class ChargeModel {
  int? id;
  String? libelle;
  String? description;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  ChargeModel(
      {required this.id,
      required this.libelle,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt});

  ChargeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    libelle = json['libelle'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['libelle'] = this.libelle;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

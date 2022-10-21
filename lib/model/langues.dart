class LangueModel {
   int? id;
  String? libelle;
  String? initial;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? isdown ; 

  LangueModel(
      {
      required this.id,
      required this.libelle,
      required this.initial,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt,
      required this.isdown,
       });

  LangueModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    libelle = json['libelle'];
    initial = json['initial'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    isdown = json['isdown'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['libelle'] = this.libelle;
    data['initial'] = this.initial;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['isdown'] = this.isdown;
    return data;
  }
}
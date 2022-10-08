class VideoModel {
  int? id;
  String? titre;
  String? url;
  String? lieu;
  String? description;
  int? typeId;
  int? langueId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  VideoModel(
      {
      required this.id,
      required this.titre,
      required this.url,
      required this.lieu,
      required this.description,
      required this.typeId,
      required this.langueId,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt});

  VideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titre = json['titre'];
    url = json['url'];
    lieu = json['lieu'];
    description = json['description'];
    typeId = json['type_id'];
    langueId = json['langue_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titre'] = this.titre;
    data['url'] = this.url;
    data['lieu'] = this.lieu;
    data['description'] = this.description;
    data['type_id'] = this.typeId;
    data['langue_id'] = this.langueId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

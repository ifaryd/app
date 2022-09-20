class ClassLangues {
  String? id;
  String? libelle;
  String? initial;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  ClassLangues({
    this.id,
    this.libelle,
    this.initial,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ClassLangues.fromJson(Map<String, dynamic> json) => ClassLangues(
        id: json["id"],
        libelle: json["libelle"],
        initial: json["initial"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
        "initial": initial,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

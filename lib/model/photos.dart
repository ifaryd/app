class Photos {
  int id;
  String lieu;
  String description;
  int langue_id;

  Photos(this.id, this.lieu, this.description, this.langue_id);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lieu': lieu,
      'description': description,
      'langue_id': langue_id
    };
  }

  factory Photos.fromMap(Map<String, dynamic> map) =>
      Photos(map['id'], map['lieu'], map['description'], map['langue_id']);
}

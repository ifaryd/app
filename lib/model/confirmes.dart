class Confirmes {
  int id;
  int user_id;
  int pays_id;
  int video_id;
  String details;

  Confirmes(this.id, this.user_id, this.pays_id, this.video_id, this.details);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': user_id,
      'pays_id': pays_id,
      'video_id': video_id,
      'details': details
    };
  }

  factory Confirmes.fromMap(Map<String, dynamic> map) => Confirmes(map['id'],
      map['user_id'], map['pays_id'], map['video_id'], map['details']);
}

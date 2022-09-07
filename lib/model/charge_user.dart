class Charge_user {
  int id;
  int charge_id;
  int user_id;
  int pays_id;
  int assemblee_id;
  int principal;
  int position_chantre;

  Charge_user(this.id, this.charge_id, this.user_id, this.pays_id,
      this.assemblee_id, this.principal, this.position_chantre);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'charge_id': charge_id,
      'user_id': user_id,
      'pays_id': pays_id,
      'assemblee_id': assemblee_id,
      'principal': principal,
      'position_chantre': position_chantre
    };
  }

  factory Charge_user.fromMap(Map<String, dynamic> map) => Charge_user(
      map['id'],
      map['charge_id'],
      map['user_id'],
      map['pays_id'],
      map['assemblee_id'],
      map['principal'],
      map['position_chantre']);
}

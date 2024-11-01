class RolDAO {
  int? id;
  String? rol;

  RolDAO({this.id, this.rol});

  factory RolDAO.fromMap(Map<String, dynamic> obj){
    return RolDAO(
      id: obj['id'],
      rol: obj['rol']
    );
  }
}
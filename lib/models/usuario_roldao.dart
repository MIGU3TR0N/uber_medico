class UsuarioRolDAO {
  int? id_usuario;
  String? id_rol;

  UsuarioRolDAO({this.id_usuario, this.id_rol});

  factory UsuarioRolDAO.fromMap(Map<String, dynamic> obj){
    return UsuarioRolDAO(
      id_usuario: obj['id_usuario'],
      id_rol: obj['id_rol']
    );
  }
}
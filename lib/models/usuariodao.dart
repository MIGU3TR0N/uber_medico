class UsuarioDAO {
  int? id;
  String? correo;
  String? clave;
  String? nombre;
  String? apellido_paterno;
  String? apellido_materno;
  String? telefono;
  String? domicilio;
  String? sexo;
  String? foto;

  UsuarioDAO({this.id, this.correo, this.clave, 
              this.nombre, this.apellido_paterno, this.apellido_materno, 
              this.telefono, this.domicilio, this.sexo, 
              this.foto});

  factory UsuarioDAO.fromMap(Map<String, dynamic> obj){
    return UsuarioDAO(
      id: obj['id'],
      correo: obj['correo'],
      clave: obj['clave'],
      nombre: obj['nombre'],
      apellido_paterno: obj['apellido_paterno'],
      apellido_materno: obj['apellido_materno'],
      telefono: obj['telefono'],
      domicilio: obj['domicilio'],
      sexo: obj['sexo'],
      foto: obj['foto']
    );
  }
}
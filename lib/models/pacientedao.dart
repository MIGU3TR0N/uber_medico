class PacienteDAO {
  int? id_usuario;
  String? correo;
  String? nombre;
  String? apellido_paterno;
  String? apellido_materno;
  String? telefono;
  String? domicilio;
  String? sexo;
  String? foto;
  String? rol;

  PacienteDAO({this.id_usuario, this.correo, this.nombre, 
              this.apellido_paterno, this.apellido_materno, 
              this.telefono, this.domicilio, this.sexo, 
              this.foto, this.rol});

  factory PacienteDAO.fromMap(Map<String, dynamic> obj){
    return PacienteDAO(
      id_usuario: obj['id_usuario'],
      correo: obj['correo'],
      nombre: obj['nombre'],
      apellido_paterno: obj['apellido_paterno'],
      apellido_materno: obj['apellido_materno'],
      telefono: obj['telefono'],
      domicilio: obj['domicilio'],
      sexo: obj['sexo'],
      foto: obj['foto'],
      rol: obj['rol']
    );
  }
}
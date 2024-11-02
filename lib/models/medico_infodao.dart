class MedicoInfoDAO {
  int? id_usuario;
  String? correo;
  String? clave;
  String? nombre;
  String? apellido_paterno;
  String? apellido_materno;
  String? telefono;
  String? domicilio;
  String? sexo;
  String? foto;
  String? rol;
  int? id_medico;
  String? especialidad;
  String? hora_inicio;
  String? hora_fin;
  String? dias;
  bool? disponible;

  MedicoInfoDAO({this.id_usuario, this.correo, this.clave, 
              this.nombre, this.apellido_paterno, this.apellido_materno, 
              this.telefono, this.domicilio, this.sexo, 
              this.foto, this.rol, this.id_medico, 
              this.especialidad, this.hora_inicio, this.hora_fin, 
              this.dias, this.disponible});

  factory MedicoInfoDAO.fromMap(Map<String, dynamic> obj){
    return MedicoInfoDAO(
      id_usuario: obj['id_usuario'],
      correo: obj['correo'],
      clave: obj['clave'],
      nombre: obj['nombre'],
      apellido_paterno: obj['apellido_paterno'],
      apellido_materno: obj['apellido_materno'],
      telefono: obj['telefono'],
      domicilio: obj['domicilio'],
      sexo: obj['sexo'],
      foto: obj['foto'],
      rol: obj['rol'],
      id_medico: obj['id_medico'],
      especialidad: obj['especialidad'],
      hora_inicio: obj['hora_inicio'],
      hora_fin: obj['hora_fin'],
      dias: obj['dias'],
      disponible: obj['disponible']
    );
  }
}
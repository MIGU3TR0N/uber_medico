class ConductorInfoDAO {
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
  int? id_conductor;
  String? INE;
  bool? disponible;
  String? licencia;
  String? id_vehiculo;
  String? modelo;
  String? tipo_vehiculo;
  String? placas;

  ConductorInfoDAO({this.id_usuario, this.correo, this.clave, 
              this.nombre, this.apellido_paterno, this.apellido_materno, 
              this.telefono, this.domicilio, this.sexo, 
              this.foto, this.rol, this.id_conductor, 
              this.INE, this.disponible, this.licencia, 
              this.id_vehiculo, this.modelo, this.tipo_vehiculo, 
              this.placas});

  factory ConductorInfoDAO.fromMap(Map<String, dynamic> obj){
    return ConductorInfoDAO(
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
      id_conductor: obj['id_conductor'],
      INE: obj['INE'],
      disponible: obj['disponible'],
      licencia: obj['licencia'],
      id_vehiculo: obj['id_vehiculo'],
      modelo: obj['modelo'],
      tipo_vehiculo: obj['tipo_vehiculo'],
      placas: obj['placas']
    );
  }
}
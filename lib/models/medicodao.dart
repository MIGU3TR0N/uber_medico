class MedicoDAO {
  int? id;
  String? especialidad;
  String? hora_inicio;
  String? hora_fin;
  String? dias;
  bool? disponible;
  String? cedula;
  String? id_usuario;

  MedicoDAO({this.id, this.especialidad, this.hora_inicio, 
             this.hora_fin, this.dias, this.disponible, 
             this.cedula, this.id_usuario});

  factory MedicoDAO.fromMap(Map<String, dynamic> obj){
    return MedicoDAO(
      id: obj['id'],
      especialidad: obj['especialidad'],
      hora_inicio: obj['hora_inicio'],
      hora_fin: obj['hora_fin'],
      dias: obj['dias'],
      disponible: obj['disponible'],
      cedula: obj['cedula'],
      id_usuario: obj['id_usuario']
    );
  }
}
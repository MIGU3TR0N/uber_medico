class MedicoDAO {
  int? id;
  String? especialidad;
  String? hora_inicio;
  String? hora_fin;
  String? dias;
  bool? disponible;
  String? cedula;
  String? id_usuario;

  MedicoDAO({this.id, this.especialidad});

  factory MedicoDAO.fromMap(Map<String, dynamic> obj){
    return MedicoDAO(
      id: obj['id'],
      especialidad: obj['especialidad']
    );
  }
}
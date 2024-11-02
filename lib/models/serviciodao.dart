class ServicioDAO {
  int? id;
  String? hora_inicio;
  String? hora_fin;
  String? id_conductor;
  String? id_cita;

  ServicioDAO({this.id, this.hora_inicio, this.hora_fin, this.id_conductor, this.id_cita});

  factory ServicioDAO.fromMap(Map<String, dynamic> obj){
    return ServicioDAO(
      id: obj['id'],
      hora_inicio: obj['hora_inicio'],
      hora_fin: obj['hora_fin'],
      id_conductor: obj['id_conductor'],
      id_cita: obj['id_cita']
    );
  }
}
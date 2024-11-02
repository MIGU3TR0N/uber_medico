class CitaDAO {
  int? id;
  String? id_paciente;
  String? id_medico;
  String? id_pasajero;

  CitaDAO({this.id, this.id_paciente, this.id_medico, this.id_pasajero});

  factory CitaDAO.fromMap(Map<String, dynamic> obj){
    return CitaDAO(
      id: obj['id'],
      id_paciente: obj['id_paciente'],
      id_medico: obj['id_medico'],
      id_pasajero: obj['id_pasajero']
    );
  }
}
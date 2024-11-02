class ConductorDAO {
  int? id;
  String? INE;
  bool? disponible;
  String? licencia;
  String? id_usuario;
  String? id_vehiculo;

  ConductorDAO({this.id, this.INE, this.disponible, this.licencia, this.id_usuario, this.id_vehiculo});

  factory ConductorDAO.fromMap(Map<String, dynamic> obj){
    return ConductorDAO(
      id: obj['id'],
      INE: obj['INE'],
      disponible: obj['disponible'],
      licencia: obj['licencia'],
      id_usuario: obj['id_usuario'],
      id_vehiculo: obj['id_vehiculo']
    );
  }
}
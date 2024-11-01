class TipoVehiculoDAO {
  int? id;
  String? tipo_vehiculo;

  TipoVehiculoDAO({this.id, this.tipo_vehiculo});

  factory TipoVehiculoDAO.fromMap(Map<String, dynamic> obj){
    return TipoVehiculoDAO(
      id: obj['id'],
      tipo_vehiculo: obj['tipo_vehiculo']
    );
  }
}
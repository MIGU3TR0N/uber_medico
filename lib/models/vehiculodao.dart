class VehiculoDAO {
  int? id;
  String? modelo;
  String? placas;
  String? seguro;
  String? id_tipo_servicio;

  VehiculoDAO({this.id, this.modelo, this.placas, this.seguro, this.id_tipo_servicio});

  factory VehiculoDAO.fromMap(Map<String, dynamic> obj){
    return VehiculoDAO(
      id: obj['id'],
      modelo: obj['modelo'],
      placas: obj['placas'],
      seguro: obj['seguro'],
      id_tipo_servicio: obj['id_tipo_servicio']
    );
  }
}
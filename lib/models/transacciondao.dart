class TransaccionDAO {
  int? id;
  String? fecha;
  String? monto;
  String? id_metodo;
  String? id_detalle_servicio;
  String? id_paciente;
  String? id_conductor;

  TransaccionDAO({this.id, this.fecha, this.monto, 
                  this.id_metodo, this.id_detalle_servicio, this.id_paciente, 
                  this.id_conductor});

  factory TransaccionDAO.fromMap(Map<String, dynamic> obj){
    return TransaccionDAO(
      id: obj['id'],
      fecha: obj['fecha'],
      monto: obj['monto'],
      id_metodo: obj['id_metodo'],
      id_detalle_servicio: obj['id_detalle_servicio'],
      id_paciente: obj['id_pacienet'],
      id_conductor: obj['id_conductor']
    );
  }
}
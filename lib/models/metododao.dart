class MetodoDAO {
  int? id;
  String? metodo;

  MetodoDAO({this.id, this.metodo});

  factory MetodoDAO.fromMap(Map<String, dynamic> obj){
    return MetodoDAO(
      id: obj['id'],
      metodo: obj['metodo']
    );
  }
}
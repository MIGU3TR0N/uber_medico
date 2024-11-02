import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:uber_medico/models/conductor_infodao.dart';
import 'package:uber_medico/models/conductordao.dart';
import 'package:uber_medico/models/medico_infodao.dart';
import 'package:uber_medico/models/medicodao.dart';
import 'package:uber_medico/models/metododao.dart';
import 'package:uber_medico/models/pacientedao.dart';
import 'package:uber_medico/models/roldao.dart';
import 'package:uber_medico/models/tipo_vehiculodao.dart';
import 'package:uber_medico/models/usuario_roldao.dart';
import 'package:uber_medico/models/usuariodao.dart';
import 'package:uber_medico/models/vehiculodao.dart';

class UberMedicoDatabase {
  static const NAMEDB = 'GIGACABLEDB';
  static const VERSIONDB = 1;
  static Database? _database;

  Future<Database> get database async{
    if(_database != null) return _database!;
    return _database = await initDatabase();
  }

  Future<Database> initDatabase() async{
    Directory folder = await getApplicationDocumentsDirectory();
    String path = join(folder.path,NAMEDB);
    return openDatabase(
      path,
      version: VERSIONDB,
      onCreate: (db, version) {
        String query = '''
          CREATE TABLE rol(
          id INTEGER PRIMARY KEY,
          rol VARCHAR(50)  
        );
        ''';
        db.execute(query);
        String query2 = '''
          CREATE TABLE metodo(
          id INTEGER PRIMARY KEY,
          metodo VARCHAR(50)  
        );
        ''';
        db.execute(query2);
        String query3 = '''
          CREATE TABLE tipo_vehiculo(
          id INTEGER PRIMARY KEY,
          tipo_vehiculo VARCHAR(50)  
        );
        ''';
        db.execute(query3);
        String query4 = '''
          CREATE TABLE usuario(
          id INTEGER PRIMARY KEY,
          correo VARCHAR(50) UNIQUE,
          clave VARCHAR(32),
          nombre VARCHAR(50),
          apellido_paterno VARCHAR(50),
          apellido_materno VARCHAR(50),
          telefono VARCHAR(50),
          domicilio VARCHAR(13),
          sexo CHAR(1),
          foto VARCHAR(150)
        );
        ''';
        db.execute(query4);
        String query5 = '''
          CREATE TABLE usuario_rol(
          id_usuario INTEGER,
          id_rol VARCHAR(50),
          CONSTRAINT pk PRIMARY KEY(id_usuario, id_rol),
          CONSTRAINT fk_usuario FOREIGN KEY(id_usuario) REFERENCES usuario(id),
          CONSTRAINT fk_rol FOREIGN KEY(id_rol) REFERENCES rol(id)
        );
        ''';
        db.execute(query5);
        String query6 = '''
          CREATE TABLE vehiculo(
          id INTEGER PRIMARY KEY,
          modelo VARCHAR(50),
          placas VARCHAR(50),
          seguro VARCHAR(150),
          id_tipo_vehiculo INTEGER,
          CONSTRAINT fk_tipo_vehiculo FOREIGN KEY(id_tipo_vehiculo) REFERENCES tipo_vehiculo(id)
        );
        ''';
        db.execute(query6);
        String query7 = '''
          CREATE TABLE medico(
          id INTEGER PRIMARY KEY,
          especialidad VARCHAR(150),
          hora_inicio VARCHAR(10),
          hora_fin VARCHAR(10),
          dias VARCHAR(50),
          disponible BOOLEAN,
          cedula VARCHAR(150),
          id_usuario INTEGER,
          CONSTRAINT fk_usuario FOREIGN KEY(id_usuario) REFERENCES usuario(id)
        );
        ''';
        db.execute(query7);
        String query8 = '''
          CREATE TABLE conductor(
          id INTEGER PRIMARY KEY,
          INE VARCHAR(150),
          disponible BOOLEAN,
          licencia VARCHAR(150),
          id_usuario INTEGER,
          id_vehiculo INTEGER,
          CONSTRAINT fk_usuario FOREIGN KEY(id_usuario) REFERENCES usuario(id),
          CONSTRAINT fk_vehiculo FOREIGN KEY(id_vehiculo) REFERENCES vehiculo(id)
        );
        ''';
        db.execute(query8);
        String query9 = '''
          CREATE TABLE cita(
          id INTEGER PRIMARY KEY,
          id_paciente INTEGER,
          id_medico INTEGER,
          id_pasajero INTEGER,
          CONSTRAINT fk_paciente FOREIGN KEY(id_paciente) REFERENCES usuario(id),
          CONSTRAINT fk_medico FOREIGN KEY(id_medico) REFERENCES usuario(id),
          CONSTRAINT fk_pasajero FOREIGN KEY(id_pasajero) REFERENCES usuario(id)
        );
        ''';
        db.execute(query9);
        String query10 = '''
          CREATE TABLE servicio(
          id INTEGER PRIMARY KEY,
          hora_inicio VARCHAR(10),
          hora_fin VARCHAR(10),
          id_conductor INTEGER,
          id_cita INTEGER,
          CONSTRAINT fk_conductor FOREIGN KEY(id_conductor) REFERENCES usuario(id),
          CONSTRAINT fk_cita FOREIGN KEY(id_cita) REFERENCES cita(id)
        );
        ''';
        db.execute(query10);
        String query11 ='''
         CREATE TABLE transaccion(
          id INTEGER PRIMARY KEY,
          fecha VARCHAR(10),
          monto DECIMAL(5,2),
          id_metodo INTEGER,
          id_detalle_servicio INTEGER,
          id_paciente INTEGER,
          id_conductor INTEGER,
          CONSTRAINT fk_metodo FOREIGN KEY(id_metodo) REFERENCES metodo(id),
          CONSTRAINT fk_detalle_servicio FOREIGN KEY(id_detalle_servicio) REFERENCES detalle_servicio(id),
          CONSTRAINT fk_paciente FOREIGN KEY(id_paciente) REFERENCES paciente(id),
          CONSTRAINT fk_conductor FOREIGN KEY(id_conductor) REFERENCES conductor(id)
        );''';
        db.execute(query11);
        String query12 ='''
        INSERT INTO metodo(metodo) values ('pago con tarjeta'),('efectivo');''';
        db.execute(query12);
        String query13 ='''
        INSERT INTO rol(rol) values ('paciente'),('medico'),('conductor');''';
        db.execute(query13);
        String query14 ='''
        INSERT INTO tipo_vehiculo(tipo_vehiculo) values ('carro mediano'),('carro grande'),('carro chico'),('camioneta'),('camioneta adaptada');''';
        db.execute(query14);
      },
    );
  }
  Future<int> INSERT(String table, Map<String,dynamic> row) async {
    var con = await database;
    return await con.insert(table, row);
  }

  Future<int> UPDATE(String table, Map<String,dynamic> row) async {
    var con = await database;
    return await con.update(table, row, where: 'id = ?', whereArgs: [row['id']]);
  }

  Future<int> DELETE(String table, int id) async {
    var con = await database;
    return await con.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  ///////////////////////
 

  ////////////////

  Future<List<MetodoDAO>?> selectMetodo() async {
    var con = await database;
    var result = await con.query('metodo');
    return result.map((obj) => MetodoDAO.fromMap(obj)).toList(); 
  }

  Future<List<RolDAO>?> selectRol() async {
    var con = await database;
    var result = await con.query('rol');
    return result.map((obj) => RolDAO.fromMap(obj)).toList(); 
  }

  Future<List<TipoVehiculoDAO>?> selectTipoVehiculo() async {
    var con = await database;
    var result = await con.query('tipo_vehiculo');
    return result.map((obj) => TipoVehiculoDAO.fromMap(obj)).toList(); 
  }

  Future<List<UsuarioDAO>?> selectUsuario() async {
    var con = await database;
    var result = await con.query('usuario');
    return result.map((obj) => UsuarioDAO.fromMap(obj)).toList(); 
  }

  Future<List<UsuarioRolDAO>?> selectUsuarioRol() async {
    var con = await database;
    var result = await con.query('usuario_rol');
    return result.map((obj) => UsuarioRolDAO.fromMap(obj)).toList(); 
  }

  Future<List<VehiculoDAO>?> selectVehiculo() async {
    var con = await database;
    var result = await con.query('vehiculo');
    return result.map((obj) => VehiculoDAO.fromMap(obj)).toList(); 
  }

  Future<List<MedicoDAO>?> selectMedico() async {
    var con = await database;
    var result = await con.query('medico');
    return result.map((obj) => MedicoDAO.fromMap(obj)).toList(); 
  }

  Future<List<ConductorDAO>?> selectConductor() async {
    var con = await database;
    var result = await con.query('conductor');
    return result.map((obj) => ConductorDAO.fromMap(obj)).toList(); 
  }

  Future<List<PacienteDAO>?> selectPaciente() async{
    var con = await database;
    var result = await con.rawQuery('''
        SELECT u.id as id_usuario , 
               u.correo, u.nombre, 
               u.apellido_paterno, 
               u.apellido_materno, 
               u.telefono, u.domicilio, 
               u.sexo, u.foto, r.rol from usuario_rol ur 
               join usuario u on u.id = ur.id_usuario 
               join rol r on r.id = ur.id_rol where r.rol = "paciente"
    ''');
    return result.map((obj) => PacienteDAO.fromMap(obj)).toList();
  }

  Future<List<PacienteDAO>?> getOnePaciente(int id) async{
    var con = await database;
    var result = await con.rawQuery('''
        SELECT u.id as id_usuario , 
               u.correo, u.nombre, 
               u.apellido_paterno, 
               u.apellido_materno, 
               u.telefono, u.domicilio, 
               u.sexo, u.foto, r.rol from usuario_rol ur 
               join usuario u on u.id = ur.id_usuario 
               join rol r on r.id = ur.id_rol where r.rol = "paciente" and i.id = ${id}
    ''');
    return result.map((obj) => PacienteDAO.fromMap(obj)).toList();
  }

  Future<List<MedicoInfoDAO>?> selectMedicos() async{
    var con = await database;
    var result = await con.rawQuery('''
        SELECT u.id as id_usuario , 
               u.correo, u.nombre, 
               u.apellido_paterno, 
               u.apellido_materno, 
               u.telefono, u.domicilio, 
               u.sexo, u.foto, r.rol, 
               m.id as id_medico , 
               m.especialidad,
               m.hora_inicio,
               m.hora_fin,
               m.dias,
               m.disponible 
               from usuario_rol ur 
               join usuario u on u.id = ur.id_usuario 
               join rol r on r.id = ur.id_rol 
               join medico m on m.id_usuario = u.id
               where r.rol = "medico"
    ''');
    return result.map((obj) => MedicoInfoDAO.fromMap(obj)).toList();
  }

  Future<List<MedicoInfoDAO>?> getOneMedico(int id) async{
    var con = await database;
    var result = await con.rawQuery('''
        SELECT u.id as id_usuario , 
               u.correo, u.nombre, 
               u.apellido_paterno, 
               u.apellido_materno, 
               u.telefono, u.domicilio, 
               u.sexo, u.foto, r.rol, 
               m.id as id_medico , 
               m.especialidad,
               m.hora_inicio,
               m.hora_fin,
               m.dias,
               m.disponible 
               from usuario_rol ur 
               join usuario u on u.id = ur.id_usuario 
               join rol r on r.id = ur.id_rol 
               join medico m on m.id_usuario = u.id
               where r.rol = "medico" and u.id = ${id}
    ''');
    return result.map((obj) => MedicoInfoDAO.fromMap(obj)).toList();
  }

  Future<List<ConductorInfoDAO>?> selectConductores() async{
    var con = await database;
    var result = await con.rawQuery('''
        SELECT u.id as id_usuario , 
               u.correo, u.nombre, 
               u.apellido_paterno, 
               u.apellido_materno, 
               u.telefono, u.domicilio, 
               u.sexo, u.foto, r.rol, 
               c.id as id_conductor , 
               c.modelo, tv.tipo_vehiculo, 
               c.placas
               from usuario_rol ur 
               join usuario u on u.id = ur.id_usuario 
               join rol r on r.id = ur.id_rol 
               join conductor c on c.id_usuario = u.id 
               join vehiculo vehiculo v on v.id = c.id_vehiculo 
               join tipo_vehiculo tv.id = v.id_tipo_vehiculo 
               where r.rol = "paciente"
    ''');
    return result.map((obj) => ConductorInfoDAO.fromMap(obj)).toList();
  }

  Future<List<ConductorInfoDAO>?> getOneConductor(int id) async{
    var con = await database;
    var result = await con.rawQuery('''
        SELECT u.id as id_usuario , 
               u.correo, u.nombre, 
               u.apellido_paterno, 
               u.apellido_materno, 
               u.telefono, u.domicilio, 
               u.sexo, u.foto, r.rol, 
               c.id as id_conductor , 
               c.modelo, tv.tipo_vehiculo, 
               c.placas
               from usuario_rol ur 
               join usuario u on u.id = ur.id_usuario 
               join rol r on r.id = ur.id_rol 
               join conductor c on c.id_usuario = u.id 
               join vehiculo vehiculo v on v.id = c.id_vehiculo 
               join tipo_vehiculo tv.id = v.id_tipo_vehiculo 
               where r.rol = "paciente" and u.id = ${id}
    ''');
    return result.map((obj) => ConductorInfoDAO.fromMap(obj)).toList();
  }

}
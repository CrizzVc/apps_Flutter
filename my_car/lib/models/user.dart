import 'vehiculo.dart';

class User {
  final String email;
  final String nombre;
  final String saldo;
  final String edad;
  final String pais;
  final String cedula;
  final List<Vehiculo> vehiculos;

  User({
    required this.email,
    required this.nombre,
    required this.saldo,
    required this.edad,
    required this.pais,
    required this.cedula,
    required this.vehiculos,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final vehiculosJson = json['vehiculos'] as List;
    final vehiculos = vehiculosJson.map((v) => Vehiculo.fromJson(v)).toList();

    return User(
      email: json['email'],
      nombre: json['nombre'],
      saldo: json['saldo'],
      edad: json['edad'],
      pais: json['pais'],
      cedula: json['cedula'],
      vehiculos: vehiculos,
    );
  }
}

import 'dart:convert';

class User {
  final String name;
  final String email;
  final int saldo;

  User({
    required this.name,
    required this.email,
    required this.saldo,
  });

  // Constructor factory para crear desde un Map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["nombre"],
      email: json["email"],
      saldo: int.tryParse(json["saldo"].toString()) ?? 0,
    );
  }

  // Método auxiliar para crear directamente desde String
  factory User.fromRawJson(String str) =>
      User.fromJson(jsonDecode(str));
}

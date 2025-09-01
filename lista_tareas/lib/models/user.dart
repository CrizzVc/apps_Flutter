import 'dart:convert';

class User {
  int? id;
  String? name;
  String? email;
  double? saldo;
  User(String data) {
    Map api = jsonDecode(data);
    this.id = api["id"];
    this.name = api["name"];
    this.email = api["email"];
    this.saldo = api["saldo"] != null ? api["saldo"].toDouble() : 0.0;
  }
}
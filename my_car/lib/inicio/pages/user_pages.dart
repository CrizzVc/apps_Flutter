import 'package:flutter/material.dart';
import '../../models/user.dart';

class UserPage extends StatelessWidget {
  final User user;

  const UserPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalles del usuario")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Nombre: ${user.nombre}", style: TextStyle(fontSize: 18)),
            Text("Email: ${user.email}"),
            Text("Saldo: ${user.saldo}"),
            Text("Edad: ${user.edad}"),
            Text("País: ${user.pais}"),
            Text("Cédula: ${user.cedula}"),
            const SizedBox(height: 20),
            Text("Vehículos", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ...user.vehiculos.map((v) => Card(
                  child: ListTile(
                    title: Text("${v.marca} ${v.modelo}"),
                    subtitle: Text("Placa: ${v.placa} | Año: ${v.anio} | Color: ${v.color}"),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}


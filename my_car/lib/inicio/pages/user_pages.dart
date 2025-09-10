import 'package:flutter/material.dart';
import '../../models/user.dart';

class UserPage extends StatelessWidget {
  final User user;

  const UserPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Perfil de ${user.nombre}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Datos principales del usuario
            Text("Nombre: ${user.nombre}", style: const TextStyle(fontSize: 18)),
            Text("Email: ${user.email}"),
            Text("Edad: ${user.edad}"),
            Text("País: ${user.pais}"),
            const SizedBox(height: 20),

            const Text("Vehículos:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Lista de vehículos con tarjetas
            Expanded(
              child: ListView(
                children: user.vehiculos.map((v) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: v.fotoUrl != null && v.fotoUrl!.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              v.fotoUrl!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.directions_car, size: 40, color: Colors.blue);
                              },
                            ),
                          )
                        : const Icon(Icons.directions_car, size: 40, color: Colors.blue),

                      title: Text("${v.marca} ${v.modelo}",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        "Placa: ${v.placa}\nAño: ${v.anio} | Color: ${v.color}",
                      ),
                      isThreeLine: true,
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

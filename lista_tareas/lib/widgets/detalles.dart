import 'package:flutter/material.dart';
import '../models/tarea.dart';

class TareaDetalle extends StatelessWidget {
  final Tarea tarea;

  const TareaDetalle({super.key, required this.tarea});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tarea.titulo)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Prioridad: ${tarea.prioridad}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(tarea.descripcion, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

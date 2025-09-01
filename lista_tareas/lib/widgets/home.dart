import 'package:flutter/material.dart';
import 'package:lista_tareas/models/tarea.dart';
import 'package:lista_tareas/widgets/detalles.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:lista_tareas/models/user.dart';

class Home extends StatelessWidget {
  final User user;
  const Home({super.key, required this.user});

  Future<List<Tarea>> cargarTareas() async {
    final String response = await rootBundle.loadString('assets/userData.json');
    final data = jsonDecode(response);
    return (data['items'] as List)
        .map((item) => Tarea.fromJson(item))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header 
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.menu, color: Colors.white),
                      const Text("14 Sept",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text('Hola, ${user.name}',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text('Contacto: ${user.email}',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.white)),
                  Text('Saldo: ${user.saldo}',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.white)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Texto "Tareas" 
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('Tareas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: FutureBuilder<List<Tarea>>(
                future: cargarTareas(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else {
                    final tareas = snapshot.data!;
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: tareas.length,
                      itemBuilder: (context, index) {
                        final tarea = tareas[index];
                        return _TareaCard(tarea: tarea, index: index);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// cards de tareas
class _TareaCard extends StatefulWidget {
  final Tarea tarea;
  final int index;
  const _TareaCard({required this.tarea, required this.index});

  @override
  State<_TareaCard> createState() => _TareaCardState();
}

class _TareaCardState extends State<_TareaCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => TareaDetalle(tarea: widget.tarea)),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _hovering ? Colors.deepPurple[50] : Colors.white,
            // color: widget.index == 2
            //     ? Colors.deepPurple[100]
            //     : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: _hovering ? Colors.deepPurple.withOpacity(0.4) : Colors.black12,
                blurRadius: _hovering ? 10 : 4,
                offset: const Offset(2, 2),
              )
            ],
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.tarea.titulo,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(widget.tarea.descripcion,
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey[600])),
                ],
              ),
              const Spacer(),
              const Icon(Icons.check_box_outline_blank,
                  color: Colors.deepPurple),
            ],
          ),
        ),
      ),
    );
  }
}

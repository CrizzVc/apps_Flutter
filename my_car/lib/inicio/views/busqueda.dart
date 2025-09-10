import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/user_bloc.dart';
import '../blocs/user_state.dart';
import '../blocs/user_events.dart';
import '../pages/user_pages.dart';

class Busqueda extends StatelessWidget {
  Busqueda({super.key});

  final TextEditingController cedulaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: 350,
        height: 400,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: cedulaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingrese su cédula',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final cedula = cedulaController.text.trim();
                context.read<UserBloc>().add(FetchUserByCedula(cedula));
              },
              child: const Text('Buscar'),
            ),
            const SizedBox(height: 20),

            // 👇 Aquí escuchamos el bloc
            Expanded(
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserInitial) {
                    return const Text("Ingrese una cédula para buscar");
                  } else if (state is UserLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is UserLoaded) {
                    return UserPage(user: state.user); // 👈 Mostramos los datos
                  } else if (state is UserError) {
                    return Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
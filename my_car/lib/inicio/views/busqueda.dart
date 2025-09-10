import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/user_bloc.dart';
import '../blocs/user_state.dart';
import '../blocs/user_events.dart';
import '../pages/user_pages.dart';
import '../views/loader.dart';

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
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserLoaded) {
              // 👇 Navegar a la nueva pantalla
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserPage(user: state.user),
                ),
              );
            } else if (state is UserError) {
              // 👇 Mostrar error con SnackBar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
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

              // 👇 Aquí en lugar de UserPage mostramos solo el loader o mensaje inicial
              Expanded(
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserInitial) {
                      return const Text("Ingrese una cédula para buscar");
                    } else if (state is UserLoading) {
                      return loader();
                    }
                    // No mostramos nada más aquí porque UserLoaded lo maneja el BlocListener
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

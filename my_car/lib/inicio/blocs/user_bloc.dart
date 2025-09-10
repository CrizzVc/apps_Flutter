import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/user.dart';
import '../blocs/user_events.dart';
import 'user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<FetchUserByCedula>((event, emit) async {
      emit(UserLoading());
      try {
        final response = await http.get(
          Uri.parse("https://crizzvc.github.io/apps_Flutter/api.json"),
        );

        if (response.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);

          final users = data.map((u) => User.fromJson(u)).toList();

          // Buscar por cédula
          final user = users.firstWhere(
            (u) => u.cedula == event.cedula,
            orElse: () => User.empty(),
          );

          if (user.cedula.isNotEmpty) {
            emit(UserLoaded(user));
          } else {
            emit(UserError("No se encontró usuario con cédula ${event.cedula}"));
          }
        } else {
          emit(UserError("Error en la API: ${response.statusCode}"));
        }
      } catch (e) {
        emit(UserError("Error: $e"));
      }
    });


  }
}

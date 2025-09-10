abstract class UserEvent {}

class FetchUserByCedula extends UserEvent {
  final String cedula;
  FetchUserByCedula(this.cedula);
}

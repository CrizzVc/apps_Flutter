class Tarea {
  final String titulo;
  final String prioridad;
  final String descripcion;

  Tarea({
    required this.titulo,
    required this.prioridad,
    required this.descripcion,
  });

  factory Tarea.fromJson(Map<String, dynamic> json) {
    return Tarea(
      titulo: json['titulo'],
      prioridad: json['prioridad'],
      descripcion: json['descripcion'],
    );
  }
}

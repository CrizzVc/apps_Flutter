class Vehiculo {
  final String placa;
  final String marca;
  final String modelo;
  final String anio;
  final String color;

  Vehiculo({
    required this.placa,
    required this.marca,
    required this.modelo,
    required this.anio,
    required this.color,
  });

  factory Vehiculo.fromJson(Map<String, dynamic> json) {
    return Vehiculo(
      placa: json['placa'],
      marca: json['marca'],
      modelo: json['modelo'],
      anio: json['anio'],
      color: json['color'],
    );
  }
}

class Vehiculo {
  final String placa;
  final String marca;
  final String modelo;
  final String anio;
  final String color;
  final String? fotoUrl;

  Vehiculo({
    required this.placa,
    required this.marca,
    required this.modelo,
    required this.anio,
    required this.color,
    this.fotoUrl,
  });

  factory Vehiculo.fromJson(Map<String, dynamic> json) {
    return Vehiculo(
      placa: json['placa'],
      marca: json['marca'],
      modelo: json['modelo'],
      anio: json['anio'],
      color: json['color'],
      fotoUrl: json['fotoUrl'],
    );
  }
}

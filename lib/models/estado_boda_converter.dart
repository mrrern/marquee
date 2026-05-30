import 'package:json_annotation/json_annotation.dart';

/// Converter para manejar el campo estado_boda que puede venir como String o int
/// La vista listar_boda devuelve la descripción del estado, no el ID
class EstadoBodaConverter implements JsonConverter<int, dynamic> {
  const EstadoBodaConverter();

  @override
  int fromJson(dynamic value) {
    if (value is int) {
      return value;
    }

    if (value is String) {
      // Mapear descripción del estado a su ID
      final estadoLower = value.toLowerCase().trim();
      switch (estadoLower) {
        case 'cotizando':
          return 1;
        case 'enviado':
          return 2;
        case 'entregado':
          return 3;
        case 'activo':
          return 4;
        case 'completado':
          return 6;
        default:
          // Si no reconocemos el estado, devolver 1 (cotizando) por defecto
          return 1;
      }
    }

    // Si es null o cualquier otro tipo, devolver 1 por defecto
    return 1;
  }

  @override
  dynamic toJson(int value) {
    return value;
  }
}

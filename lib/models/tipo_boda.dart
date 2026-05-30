import 'package:json_annotation/json_annotation.dart';

/// Converter para manejar el campo tipo_boda
class TipoBodaConverter implements JsonConverter<int, dynamic> {
  const TipoBodaConverter();

  @override
  int fromJson(dynamic value) {
    if (value is int) {
      return value;
    }

    if (value is String) {
      // TODO: Implementar mapeo de string a int si es necesario
      // Por ahora devolvemos 1 por defecto
      return 1;
    }

    // Si es null o cualquier otro tipo, devolver 1 por defecto
    return 1;
  }

  @override
  dynamic toJson(int value) {
    return value;
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cotizacion_model.freezed.dart';
part 'cotizacion_model.g.dart';


@freezed
abstract class Cotizacion with _$Cotizacion {
  const Cotizacion._();
  const factory Cotizacion({
    required int id,
    required int bodaId,
    required String archivoAdmin,
    String? archivoCliente,
    required DateTime createdAt,
    bool? firmado,
  }) = _Cotizacion;

  factory Cotizacion.fromJson(Map<String, dynamic> json) =>
      _$CotizacionFromJson(json);
}

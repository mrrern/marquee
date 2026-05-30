import 'package:freezed_annotation/freezed_annotation.dart';

part 'cotizacion_request.freezed.dart';
part 'cotizacion_request.g.dart';

@freezed
abstract class CotizacionRequest with _$CotizacionRequest {
  const factory CotizacionRequest({
    required String userId,
    required String nombre,
    required String email,
    required String telefonoNovio,
    required String telefonoNovia,
    required String lugarCeremonia,
    required bool isSumitedBoda,
    @JsonKey(name: 'isActive') @Default(false) bool isActive,
    required DateTime fechaUltimaBoda,
    required int invitados,
    required String tipoCeremonia,
    @JsonKey(name: 'estado_id') int? estadoId, // Estado de la boda (1-6)
    @JsonKey(name: 'boda_id') int? bodaId, // ID de la boda para acciones
  }) = _CotizacionRequest;

  factory CotizacionRequest.fromJson(Map<String, dynamic> json) =>
      _$CotizacionRequestFromJson(json);
}

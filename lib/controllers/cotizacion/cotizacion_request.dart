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
    required DateTime fechaUltimaBoda,
    required int invitados,
    required String tipoCeremonia,
  }) = _CotizacionRequest;

  factory CotizacionRequest.fromJson(Map<String, dynamic> json) =>
      _$CotizacionRequestFromJson(json);
}

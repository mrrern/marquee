import 'package:freezed_annotation/freezed_annotation.dart';

part 'cotizacion_model.freezed.dart';
part 'cotizacion_model.g.dart';

@freezed
abstract class CotizacionModel with _$CotizacionModel {
  const CotizacionModel._();
  const factory CotizacionModel({
    required int id,
    required int bodaId,
    String? archivoAdmin,
    String? archivoCliente,
    required DateTime createdAt,
    bool? firmado,
  }) = _CotizacionModel;

  factory CotizacionModel.fromJson(Map<String, dynamic> json) =>
      _$CotizacionModelFromJson(json);
}

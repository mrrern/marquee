import 'package:freezed_annotation/freezed_annotation.dart';

part 'cotizacion_model.freezed.dart';
part 'cotizacion_model.g.dart';

@freezed
abstract class CotizacionModel with _$CotizacionModel {
  const CotizacionModel._();
  const factory CotizacionModel({
    required int id,
    @JsonKey(name: 'boda_id') required int bodaId,
    @JsonKey(name: 'file_path_admin') String? archivoAdmin,
    @JsonKey(name: 'file_path_user') String? archivoCliente,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    bool? firmado,
  }) = _CotizacionModel;

  factory CotizacionModel.fromJson(Map<String, dynamic> json) =>
      _$CotizacionModelFromJson(json);
}

@freezed
abstract class CotizacionState with _$CotizacionState {
  const factory CotizacionState({
    @Default([]) List<CotizacionModel> cotizaciones,
    @Default(false) bool isLoading,
    @Default(false) bool hasNextPage,
    @Default(1) int currentPage,
    String? errorMessage,
  }) = _CotizacionState;
}

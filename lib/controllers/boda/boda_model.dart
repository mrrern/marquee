import 'package:bodas/routes/exports.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boda_model.freezed.dart';
part 'boda_model.g.dart';

@freezed
abstract class BodaEstado with _$BodaEstado {
  const factory BodaEstado({
    required int id,
    required String descripcion,
    @Default(false) bool isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _BodaEstado;

  factory BodaEstado.fromJson(Map<String, dynamic> json) =>
      _$BodaEstadoFromJson(json);
}

@freezed
abstract class BodaTipo with _$BodaTipo {
  const factory BodaTipo({
    required int id,
    required String descripcion,
    @Default(false) bool isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _BodaTipo;

  factory BodaTipo.fromJson(Map<String, dynamic> json) =>
      _$BodaTipoFromJson(json);
}

/// Estado del formulario de boda
@freezed
abstract class WeddingFormState with _$WeddingFormState {
  const factory WeddingFormState({
    @Default('') String novioNombre,
    @Default('') String noviaNombre,
    @Default('') String phoneNovio,
    @Default('') String phoneNovia,
    @Default('') String novioEmail,
    @Default('') String noviaEmail,
    @Default('') String invitados,
    @Default('') String ubicacion,
    DateTime? novioBirthday,
    DateTime? noviaBirthday,
    @Default(1) int selectedBodaTipo,
    @Default(false) bool isActive,
  }) = _WeddingFormState;
}

import 'package:bodas/routes/linkspaper.dart';
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
class WeddingFormState {
  final String novioNombre;
  final String noviaNombre;
  final String phoneNovio;
  final String phoneNovia;
  final String novioEmail;
  final String noviaEmail;
  final String invitados;
  final String ubicacion;
  final DateTime? novioBirthday;
  final DateTime? noviaBirthday;
  final int selectedBodaTipo;

  WeddingFormState({
    this.novioNombre = '',
    this.noviaNombre = '',
    this.phoneNovio = '',
    this.phoneNovia = '',
    this.novioEmail = '',
    this.noviaEmail = '',
    this.invitados = '',
    this.ubicacion = '',
    this.novioBirthday,
    this.noviaBirthday,
    this.selectedBodaTipo = 1,
  });

  WeddingFormState copyWith({
    String? novioNombre,
    String? noviaNombre,
    String? phoneNovio,
    String? phoneNovia,
    String? novioEmail,
    String? noviaEmail,
    String? invitados,
    String? ubicacion,
    DateTime? novioBirthday,
    DateTime? noviaBirthday,
    int? selectedBodaTipo,
  }) {
    return WeddingFormState(
      novioNombre: novioNombre ?? this.novioNombre,
      noviaNombre: noviaNombre ?? this.noviaNombre,
      phoneNovio: phoneNovio ?? this.phoneNovio,
      phoneNovia: phoneNovia ?? this.phoneNovia,
      novioEmail: novioEmail ?? this.novioEmail,
      noviaEmail: noviaEmail ?? this.noviaEmail,
      invitados: invitados ?? this.invitados,
      ubicacion: ubicacion ?? this.ubicacion,
      novioBirthday: novioBirthday ?? this.novioBirthday,
      noviaBirthday: noviaBirthday ?? this.noviaBirthday,
      selectedBodaTipo: selectedBodaTipo ?? this.selectedBodaTipo,
    );
  }
}

/// Notifier para el estado del formulario de boda
class WeddingFormNotifier extends StateNotifier<WeddingFormState> {
  WeddingFormNotifier() : super(WeddingFormState());

  void updateNovioNombre(String value) {
    state = state.copyWith(novioNombre: value);
  }

  void updateNoviaNombre(String value) {
    state = state.copyWith(noviaNombre: value);
  }

  void updatePhoneNovio(String value) {
    state = state.copyWith(phoneNovio: value);
  }

  void updatePhoneNovia(String value) {
    state = state.copyWith(phoneNovia: value);
  }

  void updateNovioEmail(String value) {
    state = state.copyWith(novioEmail: value);
  }

  void updateNoviaEmail(String value) {
    state = state.copyWith(noviaEmail: value);
  }

  void updateInvitados(String value) {
    state = state.copyWith(invitados: value);
  }

  void updateUbicacion(String value) {
    state = state.copyWith(ubicacion: value);
  }

  void updateNovioBirthday(DateTime value) {
    state = state.copyWith(novioBirthday: value);
  }

  void updateNoviaBirthday(DateTime value) {
    state = state.copyWith(noviaBirthday: value);
  }

  void updateSelectedBodaTipo(int value) {
    state = state.copyWith(selectedBodaTipo: value);
  }

  void reset() {
    state = WeddingFormState();
  }
}

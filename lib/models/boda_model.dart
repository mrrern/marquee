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

/// Estado del formulario de boda (datos puros — el Notifier vive en boda_logic.dart)
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

/// Estado de paginación para la vista de bodas contratadas
class ContractedPaginationState {
  final List<Map<String, dynamic>> allItems;
  final List<Map<String, dynamic>> currentPageItems;
  final int currentPage;
  final int totalPages;
  final int itemsPerPage;
  final bool isLoading;
  final String? errorMessage;

  const ContractedPaginationState({
    this.allItems = const [],
    this.currentPageItems = const [],
    this.currentPage = 1,
    this.totalPages = 1,
    this.itemsPerPage = 10,
    this.isLoading = false,
    this.errorMessage,
  });

  ContractedPaginationState copyWith({
    List<Map<String, dynamic>>? allItems,
    List<Map<String, dynamic>>? currentPageItems,
    int? currentPage,
    int? totalPages,
    int? itemsPerPage,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ContractedPaginationState(
      allItems: allItems ?? this.allItems,
      currentPageItems: currentPageItems ?? this.currentPageItems,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

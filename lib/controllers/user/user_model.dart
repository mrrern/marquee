import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String nombre,
    required String email,
    required String password,
    @JsonKey(name: 'rol_id') required int rolId,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
abstract class UserInfo with _$UserInfo {
  const factory UserInfo({
    required String id,
    required String nombre,
    required String email,
    required String rol,
    DateTime? createdAt,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

@freezed
abstract class Boda with _$Boda {
  const factory Boda({
    required int id,
    @JsonKey(name: 'user_id') required String usuarioId,
    required DateTime fecha,
    required String ubicacion,
    required double invitados,
    @JsonKey(name: 'estado_boda') required String estadoId,
    @JsonKey(name: 'tipo_boda') required int bodaTipo,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'is_deleted') @Default(false) bool isDeleted,
    @JsonKey(name: 'novio_nombre') required String novioNombre,
    @JsonKey(name: 'novia_nombre') required String noviaNombre,
    @JsonKey(name: 'phone_novio') required String phoneNovio,
    @JsonKey(name: 'phone_novia') required String phoneNovia,
    @JsonKey(name: 'novio_birthday') required DateTime novioBirthday,
    @JsonKey(name: 'novia_birthday') required DateTime noviaBirthday,
    @JsonKey(name: 'novio_email') required String novioEmail,
    @JsonKey(name: 'novia_email') required String noviaEmail,
  }) = _Boda;

  factory Boda.fromJson(Map<String, dynamic> json) => _$BodaFromJson(json);

  const Boda._();

  bool hasInformation() {
    return novioNombre.isNotEmpty &&
        noviaNombre.isNotEmpty &&
        phoneNovio.isNotEmpty &&
        phoneNovia.isNotEmpty &&
        ubicacion.isNotEmpty &&
        invitados > 0;
  }
}

// Agregar estado de paginación para usuarios (Freezed)
@freezed
abstract class PaginateUserState with _$PaginateUserState {
  const factory PaginateUserState({
    @Default([]) List<UserInfo> allUsers,
    @Default([]) List<UserInfo> currentPageUsers,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    @Default(10) int itemsPerPage,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _PaginateUserState;
}

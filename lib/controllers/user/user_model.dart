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
    @Default([]) List<Boda> bodas,
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
    @Default([]) List<Boda> bodas,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

@freezed
abstract class Boda with _$Boda {
  const factory Boda({
    required int id,
    required String usuarioId,
    required DateTime fecha,
    required String ubicacion,
    required double invitados,
    required String estadoId,
    required int bodaTipo,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDeleted,
    required String novioNombre,
    required String noviaNombre,
    required String phoneNovio,
    required String phoneNovia,
    required DateTime novioBirthday,
    required DateTime noviaBirthday,
    required String novioEmail,
    required String noviaEmail,
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

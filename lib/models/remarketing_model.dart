import 'package:freezed_annotation/freezed_annotation.dart';

part 'remarketing_model.freezed.dart';
part 'remarketing_model.g.dart';

@freezed
abstract class RemarketingPagination with _$RemarketingPagination {
  const factory RemarketingPagination({
    @Default(1) int page,
    @Default(20) int pageSize,
    @Default(0) int totalItems,
  }) = _RemarketingPagination;

  factory RemarketingPagination.fromJson(Map<String, dynamic> json) =>
      _$RemarketingPaginationFromJson(json);
}

@freezed
abstract class RemarketingPaginatedResponse
    with _$RemarketingPaginatedResponse {
  const factory RemarketingPaginatedResponse({
    required List<RemarketingUserModel> items,
    required int page,
    required int pageSize,
    @JsonKey(name: 'totalItem') required int totalItems,
  }) = _RemarketingPaginatedResponse;

  factory RemarketingPaginatedResponse.fromJson(Map<String, dynamic> json) =>
      _$RemarketingPaginatedResponseFromJson(json);
}

@freezed
abstract class RemarketingUserModel with _$RemarketingUserModel {
  const factory RemarketingUserModel({
    required String id,
    required String nombre,
    required String email,
    required DateTime fechaCreacion,
    required bool tieneBodaActiva,
    bool? isSelected,
    String? bodaId,
    required String mailto,
  }) = _RemarketingUserModel;

  factory RemarketingUserModel.fromJson(Map<String, dynamic> json) =>
      _$RemarketingUserModelFromJson(json);
}

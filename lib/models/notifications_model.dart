import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_model.freezed.dart';
part 'notifications_model.g.dart';

@freezed
abstract class NotificationsModel with _$NotificationsModel {
  const factory NotificationsModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String type,
    String? title,
    String? body,
    Map<String, dynamic>? data,
    @JsonKey(name: 'read_at') DateTime? readAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _NotificationsModel;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsModelFromJson(json);
}

// Estado para paginación de notificaciones
@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default([]) List<NotificationsModel> notifications,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(1) int currentPage,
    @Default(10) int itemsPerPage,
    @Default(0) int totalPages,
    @Default(0) int unreadCount,
  }) = _NotificationsState;
}

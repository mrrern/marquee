import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_model.freezed.dart';
part 'notes_model.g.dart';

@freezed
abstract class NotesModel with _$NotesModel {
  const factory NotesModel({
    required int id,
    @JsonKey(name: 'boda_id') required int bodaId,
    required String title,
    required String description,
    Map<String, dynamic>? images,
    String? file,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'is_deleted') @Default(false) bool isDeleted,
  }) = _NotesModel;

  factory NotesModel.fromJson(Map<String, dynamic> json) =>
      _$NotesModelFromJson(json);
}

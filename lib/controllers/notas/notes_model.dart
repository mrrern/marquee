import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_model.freezed.dart';
part 'notes_model.g.dart';

@freezed
abstract class NotesModel with _$NotesModel {
  const factory NotesModel({
    required int id,
    required int bodaId,
    required String title,
    required String description,
    Map<String, dynamic>? images,
    String? file,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default(false) bool isDeleted,
  }) = _NotesModel;

  factory NotesModel.fromJson(Map<String, dynamic> json) =>
      _$NotesModelFromJson(json);
}

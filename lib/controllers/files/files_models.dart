import 'package:freezed_annotation/freezed_annotation.dart';

part 'files_models.freezed.dart';
part 'files_models.g.dart';

@freezed
abstract class FilesModel with _$FilesModel {
  const factory FilesModel({
    required int id,
    required String userName,
    required String documentTitle,
    required String filePath,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default(false) bool isDeleted,
  }) = _FilesModel;

  factory FilesModel.fromJson(Map<String, dynamic> json) =>
      _$FilesModelFromJson(json);
}

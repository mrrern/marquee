// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FilesModel _$FilesModelFromJson(Map<String, dynamic> json) => _FilesModel(
      id: (json['id'] as num).toInt(),
      userName: json['userName'] as String,
      documentTitle: json['documentTitle'] as String,
      filePath: json['filePath'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$FilesModelToJson(_FilesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'documentTitle': instance.documentTitle,
      'filePath': instance.filePath,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
    };

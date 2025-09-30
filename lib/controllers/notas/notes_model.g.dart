// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotesModel _$NotesModelFromJson(Map<String, dynamic> json) => _NotesModel(
      id: (json['id'] as num).toInt(),
      bodaId: (json['boda_id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      images: json['images'] as Map<String, dynamic>?,
      file: json['file'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isDeleted: json['is_deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$NotesModelToJson(_NotesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'boda_id': instance.bodaId,
      'title': instance.title,
      'description': instance.description,
      'images': instance.images,
      'file': instance.file,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_deleted': instance.isDeleted,
    };

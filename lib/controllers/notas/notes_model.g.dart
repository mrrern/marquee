// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotesModel _$NotesModelFromJson(Map<String, dynamic> json) => _NotesModel(
      id: (json['id'] as num).toInt(),
      bodaId: (json['bodaId'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      images: json['images'] as Map<String, dynamic>?,
      file: json['file'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$NotesModelToJson(_NotesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bodaId': instance.bodaId,
      'title': instance.title,
      'description': instance.description,
      'images': instance.images,
      'file': instance.file,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
    };

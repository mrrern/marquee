// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boda_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BodaEstado _$BodaEstadoFromJson(Map<String, dynamic> json) => _BodaEstado(
      id: (json['id'] as num).toInt(),
      descripcion: json['descripcion'] as String,
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$BodaEstadoToJson(_BodaEstado instance) =>
    <String, dynamic>{
      'id': instance.id,
      'descripcion': instance.descripcion,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_BodaTipo _$BodaTipoFromJson(Map<String, dynamic> json) => _BodaTipo(
      id: (json['id'] as num).toInt(),
      descripcion: json['descripcion'] as String,
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$BodaTipoToJson(_BodaTipo instance) => <String, dynamic>{
      'id': instance.id,
      'descripcion': instance.descripcion,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

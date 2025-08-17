// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remarketing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemarketingUserModel _$RemarketingUserModelFromJson(
        Map<String, dynamic> json) =>
    _RemarketingUserModel(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
      email: json['email'] as String,
      fechaCreacion: DateTime.parse(json['fechaCreacion'] as String),
      tieneBodaActiva: json['tieneBodaActiva'] as bool,
      isSelected: json['isSelected'] as bool?,
      bodaId: json['bodaId'] as String?,
      mailto: json['mailto'] as String,
    );

Map<String, dynamic> _$RemarketingUserModelToJson(
        _RemarketingUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'email': instance.email,
      'fechaCreacion': instance.fechaCreacion.toIso8601String(),
      'tieneBodaActiva': instance.tieneBodaActiva,
      'isSelected': instance.isSelected,
      'bodaId': instance.bodaId,
      'mailto': instance.mailto,
    };

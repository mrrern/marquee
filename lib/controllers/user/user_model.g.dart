// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      rolId: (json['rol_id'] as num).toInt(),
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'email': instance.email,
      'password': instance.password,
      'rol_id': instance.rolId,
    };

_UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => _UserInfo(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
      email: json['email'] as String,
      rol: json['rol'] as String,
    );

Map<String, dynamic> _$UserInfoToJson(_UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'email': instance.email,
      'rol': instance.rol,
    };

_Boda _$BodaFromJson(Map<String, dynamic> json) => _Boda(
      id: (json['id'] as num).toInt(),
      usuarioId: json['user_id'] as String,
      fecha: DateTime.parse(json['fecha'] as String),
      ubicacion: json['ubicacion'] as String,
      invitados: (json['invitados'] as num).toDouble(),
      estadoId: json['estado_boda'] as String,
      bodaTipo: (json['tipo_boda'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isDeleted: json['is_deleted'] as bool? ?? false,
      novioNombre: json['novio_nombre'] as String,
      noviaNombre: json['novia_nombre'] as String,
      phoneNovio: json['phone_novio'] as String,
      phoneNovia: json['phone_novia'] as String,
      novioBirthday: DateTime.parse(json['novio_birthday'] as String),
      noviaBirthday: DateTime.parse(json['novia_birthday'] as String),
      novioEmail: json['novio_email'] as String,
      noviaEmail: json['novia_email'] as String,
    );

Map<String, dynamic> _$BodaToJson(_Boda instance) => <String, dynamic>{
      'id': instance.id,
      'usuarioId': instance.usuarioId,
      'fecha': instance.fecha.toIso8601String(),
      'ubicacion': instance.ubicacion,
      'invitados': instance.invitados,
      'estadoId': instance.estadoId,
      'bodaTipo': instance.bodaTipo,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'novioNombre': instance.novioNombre,
      'noviaNombre': instance.noviaNombre,
      'phoneNovio': instance.phoneNovio,
      'phoneNovia': instance.phoneNovia,
      'novioBirthday': instance.novioBirthday.toIso8601String(),
      'noviaBirthday': instance.noviaBirthday.toIso8601String(),
      'novioEmail': instance.novioEmail,
      'noviaEmail': instance.noviaEmail,
    };

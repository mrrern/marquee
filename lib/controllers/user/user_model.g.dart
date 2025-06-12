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
      bodas: (json['bodas'] as List<dynamic>?)
              ?.map((e) => Boda.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'email': instance.email,
      'password': instance.password,
      'rol_id': instance.rolId,
      'bodas': instance.bodas,
    };

_UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => _UserInfo(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
      email: json['email'] as String,
      rol: json['rol'] as String,
      bodas: (json['bodas'] as List<dynamic>?)
              ?.map((e) => Boda.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserInfoToJson(_UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'email': instance.email,
      'rol': instance.rol,
      'bodas': instance.bodas,
    };

_Boda _$BodaFromJson(Map<String, dynamic> json) => _Boda(
      id: json['id'] as String,
      usuarioId: json['usuarioId'] as String,
      fecha: DateTime.parse(json['fecha'] as String),
      ubicacion: json['ubicacion'] as String,
      invitados: (json['invitados'] as num).toDouble(),
      estadoId: json['estadoId'] as String,
      bodaTipo: (json['bodaTipo'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isDeleted: json['isDeleted'] as bool? ?? false,
      novioNombre: json['novioNombre'] as String,
      noviaNombre: json['noviaNombre'] as String,
      phoneNovio: json['phoneNovio'] as String,
      phoneNovia: json['phoneNovia'] as String,
      novioBirthday: DateTime.parse(json['novioBirthday'] as String),
      noviaBirthday: DateTime.parse(json['noviaBirthday'] as String),
      novioEmail: json['novioEmail'] as String,
      noviaEmail: json['noviaEmail'] as String,
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

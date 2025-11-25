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
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserInfoToJson(_UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'email': instance.email,
      'rol': instance.rol,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_Boda _$BodaFromJson(Map<String, dynamic> json) => _Boda(
      id: (json['id'] as num).toInt(),
      usuarioId: json['user_id'] as String,
      fecha: DateTime.parse(json['fecha'] as String),
      ubicacion: json['ubicacion'] as String,
      invitados: (json['invitados'] as num).toDouble(),
      isActive: json['is_active'] as bool? ?? false,
      estadoId: const EstadoBodaConverter().fromJson(json['estado_boda']),
      bodaTipo: const TipoBodaConverter().fromJson(json['tipo_boda']),
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
      'user_id': instance.usuarioId,
      'fecha': instance.fecha.toIso8601String(),
      'ubicacion': instance.ubicacion,
      'invitados': instance.invitados,
      'is_active': instance.isActive,
      'estado_boda': const EstadoBodaConverter().toJson(instance.estadoId),
      'tipo_boda': const TipoBodaConverter().toJson(instance.bodaTipo),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'is_deleted': instance.isDeleted,
      'novio_nombre': instance.novioNombre,
      'novia_nombre': instance.noviaNombre,
      'phone_novio': instance.phoneNovio,
      'phone_novia': instance.phoneNovia,
      'novio_birthday': instance.novioBirthday.toIso8601String(),
      'novia_birthday': instance.noviaBirthday.toIso8601String(),
      'novio_email': instance.novioEmail,
      'novia_email': instance.noviaEmail,
    };

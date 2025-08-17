// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotizacion_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CotizacionRequest _$CotizacionRequestFromJson(Map<String, dynamic> json) =>
    _CotizacionRequest(
      userId: json['userId'] as String,
      nombre: json['nombre'] as String,
      email: json['email'] as String,
      telefonoNovio: json['telefonoNovio'] as String,
      telefonoNovia: json['telefonoNovia'] as String,
      lugarCeremonia: json['lugarCeremonia'] as String,
      isSumitedBoda: json['isSumitedBoda'] as bool,
      fechaUltimaBoda: DateTime.parse(json['fechaUltimaBoda'] as String),
      invitados: (json['invitados'] as num).toInt(),
      tipoCeremonia: json['tipoCeremonia'] as String,
    );

Map<String, dynamic> _$CotizacionRequestToJson(_CotizacionRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nombre': instance.nombre,
      'email': instance.email,
      'telefonoNovio': instance.telefonoNovio,
      'telefonoNovia': instance.telefonoNovia,
      'lugarCeremonia': instance.lugarCeremonia,
      'isSumitedBoda': instance.isSumitedBoda,
      'fechaUltimaBoda': instance.fechaUltimaBoda.toIso8601String(),
      'invitados': instance.invitados,
      'tipoCeremonia': instance.tipoCeremonia,
    };

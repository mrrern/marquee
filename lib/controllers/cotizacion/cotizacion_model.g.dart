// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotizacion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CotizacionModel _$CotizacionModelFromJson(Map<String, dynamic> json) =>
    _CotizacionModel(
      id: (json['id'] as num).toInt(),
      bodaId: (json['bodaId'] as num).toInt(),
      archivoAdmin: json['archivoAdmin'] as String?,
      archivoCliente: json['archivoCliente'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      firmado: json['firmado'] as bool?,
    );

Map<String, dynamic> _$CotizacionModelToJson(_CotizacionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bodaId': instance.bodaId,
      'archivoAdmin': instance.archivoAdmin,
      'archivoCliente': instance.archivoCliente,
      'createdAt': instance.createdAt.toIso8601String(),
      'firmado': instance.firmado,
    };

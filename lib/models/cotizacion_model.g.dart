// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotizacion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CotizacionModel _$CotizacionModelFromJson(Map<String, dynamic> json) =>
    _CotizacionModel(
      id: (json['id'] as num).toInt(),
      bodaId: (json['boda_id'] as num).toInt(),
      archivoAdmin: json['file_path_admin'] as String?,
      archivoCliente: json['file_path_user'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      firmado: json['firmado'] as bool?,
    );

Map<String, dynamic> _$CotizacionModelToJson(_CotizacionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'boda_id': instance.bodaId,
      'file_path_admin': instance.archivoAdmin,
      'file_path_user': instance.archivoCliente,
      'created_at': instance.createdAt.toIso8601String(),
      'firmado': instance.firmado,
    };

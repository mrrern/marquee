// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remarketing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemarketingPagination _$RemarketingPaginationFromJson(
        Map<String, dynamic> json) =>
    _RemarketingPagination(
      page: (json['page'] as num?)?.toInt() ?? 1,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
      totalItems: (json['totalItems'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RemarketingPaginationToJson(
        _RemarketingPagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'totalItems': instance.totalItems,
    };

_RemarketingPaginatedResponse _$RemarketingPaginatedResponseFromJson(
        Map<String, dynamic> json) =>
    _RemarketingPaginatedResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => RemarketingUserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      totalItems: (json['totalItem'] as num).toInt(),
    );

Map<String, dynamic> _$RemarketingPaginatedResponseToJson(
        _RemarketingPaginatedResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
      'page': instance.page,
      'pageSize': instance.pageSize,
      'totalItem': instance.totalItems,
    };

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

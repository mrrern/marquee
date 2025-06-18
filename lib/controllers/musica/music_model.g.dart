// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BodaMusic _$BodaMusicFromJson(Map<String, dynamic> json) => _BodaMusic(
      id: (json['id'] as num).toInt(),
      bodaId: (json['bodaId'] as num).toInt(),
      musicReception: json['musicReception'] as String?,
      musicEntradaNovio: json['musicEntradaNovio'] as String?,
      musicEntradaNovia: json['musicEntradaNovia'] as String?,
      musicLect1: json['musicLect1'] as String?,
      musicLect2: json['musicLect2'] as String?,
      musicLect3: json['musicLect3'] as String?,
      musicLect4: json['musicLect4'] as String?,
      musicAlianza: json['musicAlianza'] as String?,
      musicFirma: json['musicFirma'] as String?,
      musicEndCeremony: json['musicEndCeremony'] as String?,
      musicCoctel: json['musicCoctel'] as String?,
      musicType: (json['musicType'] as num?)?.toInt(),
      musicEntranceSalon: json['musicEntranceSalon'] as String?,
      musicDinner: json['musicDinner'] as String?,
      musicCake: json['musicCake'] as String?,
      musicRamos: json['musicRamos'] as String?,
      musicSurpise: json['musicSurpise'] as String?,
      musicBarraNovios: json['musicBarraNovios'] as String?,
      musicBarraOpcional: json['musicBarraOpcional'] as String?,
      musicNovio: json['musicNovio'] as Map<String, dynamic>?,
      musicNovia: json['musicNovia'] as Map<String, dynamic>?,
      invExt: json['invExt'] as bool? ?? false,
      invExtMusic: json['invExtMusic'] as bool? ?? false,
      musicExt: json['musicExt'] as String?,
      invPetition: json['invPetition'] as bool? ?? false,
      forbidenMusic: json['forbidenMusic'] as bool? ?? false,
      musicForbiden: json['musicForbiden'] as String?,
      musicFinal: json['musicFinal'] as String?,
      musicComents: json['musicComents'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$BodaMusicToJson(_BodaMusic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bodaId': instance.bodaId,
      'musicReception': instance.musicReception,
      'musicEntradaNovio': instance.musicEntradaNovio,
      'musicEntradaNovia': instance.musicEntradaNovia,
      'musicLect1': instance.musicLect1,
      'musicLect2': instance.musicLect2,
      'musicLect3': instance.musicLect3,
      'musicLect4': instance.musicLect4,
      'musicAlianza': instance.musicAlianza,
      'musicFirma': instance.musicFirma,
      'musicEndCeremony': instance.musicEndCeremony,
      'musicCoctel': instance.musicCoctel,
      'musicType': instance.musicType,
      'musicEntranceSalon': instance.musicEntranceSalon,
      'musicDinner': instance.musicDinner,
      'musicCake': instance.musicCake,
      'musicRamos': instance.musicRamos,
      'musicSurpise': instance.musicSurpise,
      'musicBarraNovios': instance.musicBarraNovios,
      'musicBarraOpcional': instance.musicBarraOpcional,
      'musicNovio': instance.musicNovio,
      'musicNovia': instance.musicNovia,
      'invExt': instance.invExt,
      'invExtMusic': instance.invExtMusic,
      'musicExt': instance.musicExt,
      'invPetition': instance.invPetition,
      'forbidenMusic': instance.forbidenMusic,
      'musicForbiden': instance.musicForbiden,
      'musicFinal': instance.musicFinal,
      'musicComents': instance.musicComents,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
    };

_MusicType _$MusicTypeFromJson(Map<String, dynamic> json) => _MusicType(
      id: (json['id'] as num).toInt(),
      descripcion: json['descripcion'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isDeleted: json['is_deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$MusicTypeToJson(_MusicType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'descripcion': instance.descripcion,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_deleted': instance.isDeleted,
    };

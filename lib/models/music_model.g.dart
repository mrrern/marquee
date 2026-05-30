// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BodaMusic _$BodaMusicFromJson(Map<String, dynamic> json) => _BodaMusic(
      id: (json['id'] as num).toInt(),
      bodaId: (json['boda_id'] as num).toInt(),
      musicReception: json['music_reception'] as String?,
      musicEntradaNovio: json['music_entrada_novio'] as String?,
      musicEntradaNovia: json['music_entrada_novia'] as String?,
      musicLect1: json['music_lect1'] as String?,
      musicLect2: json['music_lect2'] as String?,
      musicLect3: json['music_lect3'] as String?,
      musicLect4: json['music_lect4'] as String?,
      musicAlianza: json['music_alianza'] as String?,
      musicFirma: json['music_firma'] as String?,
      musicEndCeremony: json['music_end_ceremony'] as String?,
      musicCoctel: json['music_coctel'] as String?,
      musicType: (json['music_type'] as num?)?.toInt(),
      musicEntranceSalon: json['music_entrance_salon'] as String?,
      musicDinner: json['music_dinner'] as String?,
      musicCake: json['music_cake'] as String?,
      musicRamos: json['music_ramos'] as String?,
      musicSurprise: json['music_surprise'] as String?,
      musicBarraNovios: json['music_barra_novios'] as String?,
      musicBarraOpcional: json['music_barra_opcional'] as String?,
      musicNovio: json['music_novio'] as Map<String, dynamic>?,
      musicNovia: json['music_novia'] as Map<String, dynamic>?,
      invExt: json['inv_ext'] as bool? ?? false,
      invExtMusic: json['inv_ext_music'] as bool? ?? false,
      musicExt: json['music_ext'] as String?,
      invPetition: json['inv_petition'] as bool? ?? false,
      forbiddenMusic: json['forbidden_music'] as bool? ?? false,
      musicForbidden: json['music_forbidden'] as String?,
      musicFinal: json['music_final'] as String?,
      musicComments: json['music_comments'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isDeleted: json['is_deleted'] as bool? ?? false,
      musicLecturaExt: json['music_lectura_ext'] as Map<String, dynamic>?,
      musicCoctelPlaylist:
          json['music_coctel_playlist'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$BodaMusicToJson(_BodaMusic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'boda_id': instance.bodaId,
      'music_reception': instance.musicReception,
      'music_entrada_novio': instance.musicEntradaNovio,
      'music_entrada_novia': instance.musicEntradaNovia,
      'music_lect1': instance.musicLect1,
      'music_lect2': instance.musicLect2,
      'music_lect3': instance.musicLect3,
      'music_lect4': instance.musicLect4,
      'music_alianza': instance.musicAlianza,
      'music_firma': instance.musicFirma,
      'music_end_ceremony': instance.musicEndCeremony,
      'music_coctel': instance.musicCoctel,
      'music_type': instance.musicType,
      'music_entrance_salon': instance.musicEntranceSalon,
      'music_dinner': instance.musicDinner,
      'music_cake': instance.musicCake,
      'music_ramos': instance.musicRamos,
      'music_surprise': instance.musicSurprise,
      'music_barra_novios': instance.musicBarraNovios,
      'music_barra_opcional': instance.musicBarraOpcional,
      'music_novio': instance.musicNovio,
      'music_novia': instance.musicNovia,
      'inv_ext': instance.invExt,
      'inv_ext_music': instance.invExtMusic,
      'music_ext': instance.musicExt,
      'inv_petition': instance.invPetition,
      'forbidden_music': instance.forbiddenMusic,
      'music_forbidden': instance.musicForbidden,
      'music_final': instance.musicFinal,
      'music_comments': instance.musicComments,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_deleted': instance.isDeleted,
      'music_lectura_ext': instance.musicLecturaExt,
      'music_coctel_playlist': instance.musicCoctelPlaylist,
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

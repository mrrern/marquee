import 'package:freezed_annotation/freezed_annotation.dart';

part 'music_model.freezed.dart';
part 'music_model.g.dart';

@freezed
abstract class BodaMusic with _$BodaMusic {
  const factory BodaMusic({
    required int id,
    @JsonKey(name: 'boda_id') required int bodaId,
    @JsonKey(name: 'music_reception') String? musicReception,
    @JsonKey(name: 'music_entrada_novio') String? musicEntradaNovio,
    @JsonKey(name: 'music_entrada_novia') String? musicEntradaNovia,
    @JsonKey(name: 'music_lect1') String? musicLect1,
    @JsonKey(name: 'music_lect2') String? musicLect2,
    @JsonKey(name: 'music_lect3') String? musicLect3,
    @JsonKey(name: 'music_lect4') String? musicLect4,
    @JsonKey(name: 'music_alianza') String? musicAlianza,
    @JsonKey(name: 'music_firma') String? musicFirma,
    @JsonKey(name: 'music_end_ceremony') String? musicEndCeremony,
    @JsonKey(name: 'music_coctel') String? musicCoctel,
    @JsonKey(name: 'music_type') int? musicType,
    @JsonKey(name: 'music_entrance_salon') String? musicEntranceSalon,
    @JsonKey(name: 'music_dinner') String? musicDinner,
    @JsonKey(name: 'music_cake') String? musicCake,
    @JsonKey(name: 'music_ramos') String? musicRamos,
    // Corregido: music_surpise -> music_surprise
    @JsonKey(name: 'music_surprise') String? musicSurprise,
    @JsonKey(name: 'music_barra_novios') String? musicBarraNovios,
    @JsonKey(name: 'music_barra_opcional') String? musicBarraOpcional,
    @JsonKey(name: 'music_novio') Map<String, dynamic>? musicNovio,
    @JsonKey(name: 'music_novia') Map<String, dynamic>? musicNovia,
    @JsonKey(name: 'inv_ext') @Default(false) bool invExt,
    @JsonKey(name: 'inv_ext_music') @Default(false) bool invExtMusic,
    @JsonKey(name: 'music_ext') String? musicExt,
    @JsonKey(name: 'inv_petition') @Default(false) bool invPetition,
    // Corregido: forbiden_music -> forbidden_music
    @JsonKey(name: 'forbidden_music') @Default(false) bool forbiddenMusic,
    // Corregido: music_forbiden -> music_forbidden
    @JsonKey(name: 'music_forbidden') String? musicForbidden,
    @JsonKey(name: 'music_final') String? musicFinal,
    // Corregido: music_coments -> music_comments
    @JsonKey(name: 'music_comments') String? musicComments,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'is_deleted') @Default(false) bool isDeleted,
    // Corregido: music_lec_ext -> music_lectura_ext
    @JsonKey(name: 'music_lectura_ext') Map<String, dynamic>? musicLecturaExt,
    @JsonKey(name: 'music_coctel_playlist')
    Map<String, dynamic>? musicCoctelPlaylist,
  }) = _BodaMusic;

  factory BodaMusic.fromJson(Map<String, dynamic> json) =>
      _$BodaMusicFromJson(json);
}

@freezed
abstract class MusicType with _$MusicType {
  const factory MusicType({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'descripcion') required String descripcion,
    @JsonKey(name: 'created_at') required DateTime? createdAt,
    @JsonKey(name: 'updated_at') required DateTime? updatedAt,
    @JsonKey(name: 'is_deleted') @Default(false) bool isDeleted,
  }) = _MusicType;

  factory MusicType.fromJson(Map<String, dynamic> json) =>
      _$MusicTypeFromJson(json);
}

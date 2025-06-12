import 'package:freezed_annotation/freezed_annotation.dart';

part 'music_model.freezed.dart';
part 'music_model.g.dart';

@freezed
abstract class BodaMusic with _$BodaMusic {
  const factory BodaMusic({
    required int id,
    required int bodaId,
    String? musicReception,
    String? musicEntradaNovio,
    String? musicEntradaNovia,
    String? musicLect1,
    String? musicLect2,
    String? musicLect3,
    String? musicLect4,
    String? musicAlianza,
    String? musicFirma,
    String? musicEndCeremony,
    String? musicCoctel,
    String? musicEntranceSalon,
    String? musicDinner,
    String? musicCake,
    String? musicRamos,
    String? musicSurpise,
    String? musicBarraNovios,
    String? musicBarraOpcional,
    Map<String, dynamic>? musicNovio,
    Map<String, dynamic>? musicNovia,
    @Default(false) bool invExt,
    @Default(false) bool invExtMusic,
    String? musicExt,
    @Default(false) bool invPetition,
    @Default(false) bool forbidenMusic,
    String? musicForbiden,
    String? musicFinal,
    String? musicComents,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default(false) bool isDeleted,
  }) = _BodaMusic;

  factory BodaMusic.fromJson(Map<String, dynamic> json) =>
      _$BodaMusicFromJson(json);
}

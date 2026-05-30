// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BodaMusic {
  int get id;
  @JsonKey(name: 'boda_id')
  int get bodaId;
  @JsonKey(name: 'music_reception')
  String? get musicReception;
  @JsonKey(name: 'music_entrada_novio')
  String? get musicEntradaNovio;
  @JsonKey(name: 'music_entrada_novia')
  String? get musicEntradaNovia;
  @JsonKey(name: 'music_lect1')
  String? get musicLect1;
  @JsonKey(name: 'music_lect2')
  String? get musicLect2;
  @JsonKey(name: 'music_lect3')
  String? get musicLect3;
  @JsonKey(name: 'music_lect4')
  String? get musicLect4;
  @JsonKey(name: 'music_alianza')
  String? get musicAlianza;
  @JsonKey(name: 'music_firma')
  String? get musicFirma;
  @JsonKey(name: 'music_end_ceremony')
  String? get musicEndCeremony;
  @JsonKey(name: 'music_coctel')
  String? get musicCoctel;
  @JsonKey(name: 'music_type')
  int? get musicType;
  @JsonKey(name: 'music_entrance_salon')
  String? get musicEntranceSalon;
  @JsonKey(name: 'music_dinner')
  String? get musicDinner;
  @JsonKey(name: 'music_cake')
  String? get musicCake;
  @JsonKey(name: 'music_ramos')
  String? get musicRamos; // Corregido: music_surpise -> music_surprise
  @JsonKey(name: 'music_surprise')
  String? get musicSurprise;
  @JsonKey(name: 'music_barra_novios')
  String? get musicBarraNovios;
  @JsonKey(name: 'music_barra_opcional')
  String? get musicBarraOpcional;
  @JsonKey(name: 'music_novio')
  Map<String, dynamic>? get musicNovio;
  @JsonKey(name: 'music_novia')
  Map<String, dynamic>? get musicNovia;
  @JsonKey(name: 'inv_ext')
  bool get invExt;
  @JsonKey(name: 'inv_ext_music')
  bool get invExtMusic;
  @JsonKey(name: 'music_ext')
  String? get musicExt;
  @JsonKey(name: 'inv_petition')
  bool get invPetition; // Corregido: forbiden_music -> forbidden_music
  @JsonKey(name: 'forbidden_music')
  bool get forbiddenMusic; // Corregido: music_forbiden -> music_forbidden
  @JsonKey(name: 'music_forbidden')
  String? get musicForbidden;
  @JsonKey(name: 'music_final')
  String? get musicFinal; // Corregido: music_coments -> music_comments
  @JsonKey(name: 'music_comments')
  String? get musicComments;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @JsonKey(name: 'is_deleted')
  bool get isDeleted; // Corregido: music_lec_ext -> music_lectura_ext
  @JsonKey(name: 'music_lectura_ext')
  Map<String, dynamic>? get musicLecturaExt;
  @JsonKey(name: 'music_coctel_playlist')
  Map<String, dynamic>? get musicCoctelPlaylist;

  /// Create a copy of BodaMusic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BodaMusicCopyWith<BodaMusic> get copyWith =>
      _$BodaMusicCopyWithImpl<BodaMusic>(this as BodaMusic, _$identity);

  /// Serializes this BodaMusic to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BodaMusic &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bodaId, bodaId) || other.bodaId == bodaId) &&
            (identical(other.musicReception, musicReception) ||
                other.musicReception == musicReception) &&
            (identical(other.musicEntradaNovio, musicEntradaNovio) ||
                other.musicEntradaNovio == musicEntradaNovio) &&
            (identical(other.musicEntradaNovia, musicEntradaNovia) ||
                other.musicEntradaNovia == musicEntradaNovia) &&
            (identical(other.musicLect1, musicLect1) ||
                other.musicLect1 == musicLect1) &&
            (identical(other.musicLect2, musicLect2) ||
                other.musicLect2 == musicLect2) &&
            (identical(other.musicLect3, musicLect3) ||
                other.musicLect3 == musicLect3) &&
            (identical(other.musicLect4, musicLect4) ||
                other.musicLect4 == musicLect4) &&
            (identical(other.musicAlianza, musicAlianza) ||
                other.musicAlianza == musicAlianza) &&
            (identical(other.musicFirma, musicFirma) ||
                other.musicFirma == musicFirma) &&
            (identical(other.musicEndCeremony, musicEndCeremony) ||
                other.musicEndCeremony == musicEndCeremony) &&
            (identical(other.musicCoctel, musicCoctel) ||
                other.musicCoctel == musicCoctel) &&
            (identical(other.musicType, musicType) ||
                other.musicType == musicType) &&
            (identical(other.musicEntranceSalon, musicEntranceSalon) ||
                other.musicEntranceSalon == musicEntranceSalon) &&
            (identical(other.musicDinner, musicDinner) ||
                other.musicDinner == musicDinner) &&
            (identical(other.musicCake, musicCake) ||
                other.musicCake == musicCake) &&
            (identical(other.musicRamos, musicRamos) ||
                other.musicRamos == musicRamos) &&
            (identical(other.musicSurprise, musicSurprise) ||
                other.musicSurprise == musicSurprise) &&
            (identical(other.musicBarraNovios, musicBarraNovios) ||
                other.musicBarraNovios == musicBarraNovios) &&
            (identical(other.musicBarraOpcional, musicBarraOpcional) ||
                other.musicBarraOpcional == musicBarraOpcional) &&
            const DeepCollectionEquality()
                .equals(other.musicNovio, musicNovio) &&
            const DeepCollectionEquality()
                .equals(other.musicNovia, musicNovia) &&
            (identical(other.invExt, invExt) || other.invExt == invExt) &&
            (identical(other.invExtMusic, invExtMusic) ||
                other.invExtMusic == invExtMusic) &&
            (identical(other.musicExt, musicExt) ||
                other.musicExt == musicExt) &&
            (identical(other.invPetition, invPetition) ||
                other.invPetition == invPetition) &&
            (identical(other.forbiddenMusic, forbiddenMusic) ||
                other.forbiddenMusic == forbiddenMusic) &&
            (identical(other.musicForbidden, musicForbidden) ||
                other.musicForbidden == musicForbidden) &&
            (identical(other.musicFinal, musicFinal) ||
                other.musicFinal == musicFinal) &&
            (identical(other.musicComments, musicComments) ||
                other.musicComments == musicComments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            const DeepCollectionEquality()
                .equals(other.musicLecturaExt, musicLecturaExt) &&
            const DeepCollectionEquality()
                .equals(other.musicCoctelPlaylist, musicCoctelPlaylist));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        bodaId,
        musicReception,
        musicEntradaNovio,
        musicEntradaNovia,
        musicLect1,
        musicLect2,
        musicLect3,
        musicLect4,
        musicAlianza,
        musicFirma,
        musicEndCeremony,
        musicCoctel,
        musicType,
        musicEntranceSalon,
        musicDinner,
        musicCake,
        musicRamos,
        musicSurprise,
        musicBarraNovios,
        musicBarraOpcional,
        const DeepCollectionEquality().hash(musicNovio),
        const DeepCollectionEquality().hash(musicNovia),
        invExt,
        invExtMusic,
        musicExt,
        invPetition,
        forbiddenMusic,
        musicForbidden,
        musicFinal,
        musicComments,
        createdAt,
        updatedAt,
        isDeleted,
        const DeepCollectionEquality().hash(musicLecturaExt),
        const DeepCollectionEquality().hash(musicCoctelPlaylist)
      ]);

  @override
  String toString() {
    return 'BodaMusic(id: $id, bodaId: $bodaId, musicReception: $musicReception, musicEntradaNovio: $musicEntradaNovio, musicEntradaNovia: $musicEntradaNovia, musicLect1: $musicLect1, musicLect2: $musicLect2, musicLect3: $musicLect3, musicLect4: $musicLect4, musicAlianza: $musicAlianza, musicFirma: $musicFirma, musicEndCeremony: $musicEndCeremony, musicCoctel: $musicCoctel, musicType: $musicType, musicEntranceSalon: $musicEntranceSalon, musicDinner: $musicDinner, musicCake: $musicCake, musicRamos: $musicRamos, musicSurprise: $musicSurprise, musicBarraNovios: $musicBarraNovios, musicBarraOpcional: $musicBarraOpcional, musicNovio: $musicNovio, musicNovia: $musicNovia, invExt: $invExt, invExtMusic: $invExtMusic, musicExt: $musicExt, invPetition: $invPetition, forbiddenMusic: $forbiddenMusic, musicForbidden: $musicForbidden, musicFinal: $musicFinal, musicComments: $musicComments, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, musicLecturaExt: $musicLecturaExt, musicCoctelPlaylist: $musicCoctelPlaylist)';
  }
}

/// @nodoc
abstract mixin class $BodaMusicCopyWith<$Res> {
  factory $BodaMusicCopyWith(BodaMusic value, $Res Function(BodaMusic) _then) =
      _$BodaMusicCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'boda_id') int bodaId,
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
      @JsonKey(name: 'music_surprise') String? musicSurprise,
      @JsonKey(name: 'music_barra_novios') String? musicBarraNovios,
      @JsonKey(name: 'music_barra_opcional') String? musicBarraOpcional,
      @JsonKey(name: 'music_novio') Map<String, dynamic>? musicNovio,
      @JsonKey(name: 'music_novia') Map<String, dynamic>? musicNovia,
      @JsonKey(name: 'inv_ext') bool invExt,
      @JsonKey(name: 'inv_ext_music') bool invExtMusic,
      @JsonKey(name: 'music_ext') String? musicExt,
      @JsonKey(name: 'inv_petition') bool invPetition,
      @JsonKey(name: 'forbidden_music') bool forbiddenMusic,
      @JsonKey(name: 'music_forbidden') String? musicForbidden,
      @JsonKey(name: 'music_final') String? musicFinal,
      @JsonKey(name: 'music_comments') String? musicComments,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'is_deleted') bool isDeleted,
      @JsonKey(name: 'music_lectura_ext') Map<String, dynamic>? musicLecturaExt,
      @JsonKey(name: 'music_coctel_playlist')
      Map<String, dynamic>? musicCoctelPlaylist});
}

/// @nodoc
class _$BodaMusicCopyWithImpl<$Res> implements $BodaMusicCopyWith<$Res> {
  _$BodaMusicCopyWithImpl(this._self, this._then);

  final BodaMusic _self;
  final $Res Function(BodaMusic) _then;

  /// Create a copy of BodaMusic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bodaId = null,
    Object? musicReception = freezed,
    Object? musicEntradaNovio = freezed,
    Object? musicEntradaNovia = freezed,
    Object? musicLect1 = freezed,
    Object? musicLect2 = freezed,
    Object? musicLect3 = freezed,
    Object? musicLect4 = freezed,
    Object? musicAlianza = freezed,
    Object? musicFirma = freezed,
    Object? musicEndCeremony = freezed,
    Object? musicCoctel = freezed,
    Object? musicType = freezed,
    Object? musicEntranceSalon = freezed,
    Object? musicDinner = freezed,
    Object? musicCake = freezed,
    Object? musicRamos = freezed,
    Object? musicSurprise = freezed,
    Object? musicBarraNovios = freezed,
    Object? musicBarraOpcional = freezed,
    Object? musicNovio = freezed,
    Object? musicNovia = freezed,
    Object? invExt = null,
    Object? invExtMusic = null,
    Object? musicExt = freezed,
    Object? invPetition = null,
    Object? forbiddenMusic = null,
    Object? musicForbidden = freezed,
    Object? musicFinal = freezed,
    Object? musicComments = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = null,
    Object? musicLecturaExt = freezed,
    Object? musicCoctelPlaylist = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bodaId: null == bodaId
          ? _self.bodaId
          : bodaId // ignore: cast_nullable_to_non_nullable
              as int,
      musicReception: freezed == musicReception
          ? _self.musicReception
          : musicReception // ignore: cast_nullable_to_non_nullable
              as String?,
      musicEntradaNovio: freezed == musicEntradaNovio
          ? _self.musicEntradaNovio
          : musicEntradaNovio // ignore: cast_nullable_to_non_nullable
              as String?,
      musicEntradaNovia: freezed == musicEntradaNovia
          ? _self.musicEntradaNovia
          : musicEntradaNovia // ignore: cast_nullable_to_non_nullable
              as String?,
      musicLect1: freezed == musicLect1
          ? _self.musicLect1
          : musicLect1 // ignore: cast_nullable_to_non_nullable
              as String?,
      musicLect2: freezed == musicLect2
          ? _self.musicLect2
          : musicLect2 // ignore: cast_nullable_to_non_nullable
              as String?,
      musicLect3: freezed == musicLect3
          ? _self.musicLect3
          : musicLect3 // ignore: cast_nullable_to_non_nullable
              as String?,
      musicLect4: freezed == musicLect4
          ? _self.musicLect4
          : musicLect4 // ignore: cast_nullable_to_non_nullable
              as String?,
      musicAlianza: freezed == musicAlianza
          ? _self.musicAlianza
          : musicAlianza // ignore: cast_nullable_to_non_nullable
              as String?,
      musicFirma: freezed == musicFirma
          ? _self.musicFirma
          : musicFirma // ignore: cast_nullable_to_non_nullable
              as String?,
      musicEndCeremony: freezed == musicEndCeremony
          ? _self.musicEndCeremony
          : musicEndCeremony // ignore: cast_nullable_to_non_nullable
              as String?,
      musicCoctel: freezed == musicCoctel
          ? _self.musicCoctel
          : musicCoctel // ignore: cast_nullable_to_non_nullable
              as String?,
      musicType: freezed == musicType
          ? _self.musicType
          : musicType // ignore: cast_nullable_to_non_nullable
              as int?,
      musicEntranceSalon: freezed == musicEntranceSalon
          ? _self.musicEntranceSalon
          : musicEntranceSalon // ignore: cast_nullable_to_non_nullable
              as String?,
      musicDinner: freezed == musicDinner
          ? _self.musicDinner
          : musicDinner // ignore: cast_nullable_to_non_nullable
              as String?,
      musicCake: freezed == musicCake
          ? _self.musicCake
          : musicCake // ignore: cast_nullable_to_non_nullable
              as String?,
      musicRamos: freezed == musicRamos
          ? _self.musicRamos
          : musicRamos // ignore: cast_nullable_to_non_nullable
              as String?,
      musicSurprise: freezed == musicSurprise
          ? _self.musicSurprise
          : musicSurprise // ignore: cast_nullable_to_non_nullable
              as String?,
      musicBarraNovios: freezed == musicBarraNovios
          ? _self.musicBarraNovios
          : musicBarraNovios // ignore: cast_nullable_to_non_nullable
              as String?,
      musicBarraOpcional: freezed == musicBarraOpcional
          ? _self.musicBarraOpcional
          : musicBarraOpcional // ignore: cast_nullable_to_non_nullable
              as String?,
      musicNovio: freezed == musicNovio
          ? _self.musicNovio
          : musicNovio // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      musicNovia: freezed == musicNovia
          ? _self.musicNovia
          : musicNovia // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      invExt: null == invExt
          ? _self.invExt
          : invExt // ignore: cast_nullable_to_non_nullable
              as bool,
      invExtMusic: null == invExtMusic
          ? _self.invExtMusic
          : invExtMusic // ignore: cast_nullable_to_non_nullable
              as bool,
      musicExt: freezed == musicExt
          ? _self.musicExt
          : musicExt // ignore: cast_nullable_to_non_nullable
              as String?,
      invPetition: null == invPetition
          ? _self.invPetition
          : invPetition // ignore: cast_nullable_to_non_nullable
              as bool,
      forbiddenMusic: null == forbiddenMusic
          ? _self.forbiddenMusic
          : forbiddenMusic // ignore: cast_nullable_to_non_nullable
              as bool,
      musicForbidden: freezed == musicForbidden
          ? _self.musicForbidden
          : musicForbidden // ignore: cast_nullable_to_non_nullable
              as String?,
      musicFinal: freezed == musicFinal
          ? _self.musicFinal
          : musicFinal // ignore: cast_nullable_to_non_nullable
              as String?,
      musicComments: freezed == musicComments
          ? _self.musicComments
          : musicComments // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      musicLecturaExt: freezed == musicLecturaExt
          ? _self.musicLecturaExt
          : musicLecturaExt // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      musicCoctelPlaylist: freezed == musicCoctelPlaylist
          ? _self.musicCoctelPlaylist
          : musicCoctelPlaylist // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BodaMusic].
extension BodaMusicPatterns on BodaMusic {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BodaMusic value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BodaMusic() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BodaMusic value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodaMusic():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BodaMusic value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodaMusic() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
            @JsonKey(name: 'boda_id') int bodaId,
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
            @JsonKey(name: 'music_surprise') String? musicSurprise,
            @JsonKey(name: 'music_barra_novios') String? musicBarraNovios,
            @JsonKey(name: 'music_barra_opcional') String? musicBarraOpcional,
            @JsonKey(name: 'music_novio') Map<String, dynamic>? musicNovio,
            @JsonKey(name: 'music_novia') Map<String, dynamic>? musicNovia,
            @JsonKey(name: 'inv_ext') bool invExt,
            @JsonKey(name: 'inv_ext_music') bool invExtMusic,
            @JsonKey(name: 'music_ext') String? musicExt,
            @JsonKey(name: 'inv_petition') bool invPetition,
            @JsonKey(name: 'forbidden_music') bool forbiddenMusic,
            @JsonKey(name: 'music_forbidden') String? musicForbidden,
            @JsonKey(name: 'music_final') String? musicFinal,
            @JsonKey(name: 'music_comments') String? musicComments,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt,
            @JsonKey(name: 'is_deleted') bool isDeleted,
            @JsonKey(name: 'music_lectura_ext')
            Map<String, dynamic>? musicLecturaExt,
            @JsonKey(name: 'music_coctel_playlist')
            Map<String, dynamic>? musicCoctelPlaylist)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BodaMusic() when $default != null:
        return $default(
            _that.id,
            _that.bodaId,
            _that.musicReception,
            _that.musicEntradaNovio,
            _that.musicEntradaNovia,
            _that.musicLect1,
            _that.musicLect2,
            _that.musicLect3,
            _that.musicLect4,
            _that.musicAlianza,
            _that.musicFirma,
            _that.musicEndCeremony,
            _that.musicCoctel,
            _that.musicType,
            _that.musicEntranceSalon,
            _that.musicDinner,
            _that.musicCake,
            _that.musicRamos,
            _that.musicSurprise,
            _that.musicBarraNovios,
            _that.musicBarraOpcional,
            _that.musicNovio,
            _that.musicNovia,
            _that.invExt,
            _that.invExtMusic,
            _that.musicExt,
            _that.invPetition,
            _that.forbiddenMusic,
            _that.musicForbidden,
            _that.musicFinal,
            _that.musicComments,
            _that.createdAt,
            _that.updatedAt,
            _that.isDeleted,
            _that.musicLecturaExt,
            _that.musicCoctelPlaylist);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
            @JsonKey(name: 'boda_id') int bodaId,
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
            @JsonKey(name: 'music_surprise') String? musicSurprise,
            @JsonKey(name: 'music_barra_novios') String? musicBarraNovios,
            @JsonKey(name: 'music_barra_opcional') String? musicBarraOpcional,
            @JsonKey(name: 'music_novio') Map<String, dynamic>? musicNovio,
            @JsonKey(name: 'music_novia') Map<String, dynamic>? musicNovia,
            @JsonKey(name: 'inv_ext') bool invExt,
            @JsonKey(name: 'inv_ext_music') bool invExtMusic,
            @JsonKey(name: 'music_ext') String? musicExt,
            @JsonKey(name: 'inv_petition') bool invPetition,
            @JsonKey(name: 'forbidden_music') bool forbiddenMusic,
            @JsonKey(name: 'music_forbidden') String? musicForbidden,
            @JsonKey(name: 'music_final') String? musicFinal,
            @JsonKey(name: 'music_comments') String? musicComments,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt,
            @JsonKey(name: 'is_deleted') bool isDeleted,
            @JsonKey(name: 'music_lectura_ext')
            Map<String, dynamic>? musicLecturaExt,
            @JsonKey(name: 'music_coctel_playlist')
            Map<String, dynamic>? musicCoctelPlaylist)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodaMusic():
        return $default(
            _that.id,
            _that.bodaId,
            _that.musicReception,
            _that.musicEntradaNovio,
            _that.musicEntradaNovia,
            _that.musicLect1,
            _that.musicLect2,
            _that.musicLect3,
            _that.musicLect4,
            _that.musicAlianza,
            _that.musicFirma,
            _that.musicEndCeremony,
            _that.musicCoctel,
            _that.musicType,
            _that.musicEntranceSalon,
            _that.musicDinner,
            _that.musicCake,
            _that.musicRamos,
            _that.musicSurprise,
            _that.musicBarraNovios,
            _that.musicBarraOpcional,
            _that.musicNovio,
            _that.musicNovia,
            _that.invExt,
            _that.invExtMusic,
            _that.musicExt,
            _that.invPetition,
            _that.forbiddenMusic,
            _that.musicForbidden,
            _that.musicFinal,
            _that.musicComments,
            _that.createdAt,
            _that.updatedAt,
            _that.isDeleted,
            _that.musicLecturaExt,
            _that.musicCoctelPlaylist);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int id,
            @JsonKey(name: 'boda_id') int bodaId,
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
            @JsonKey(name: 'music_surprise') String? musicSurprise,
            @JsonKey(name: 'music_barra_novios') String? musicBarraNovios,
            @JsonKey(name: 'music_barra_opcional') String? musicBarraOpcional,
            @JsonKey(name: 'music_novio') Map<String, dynamic>? musicNovio,
            @JsonKey(name: 'music_novia') Map<String, dynamic>? musicNovia,
            @JsonKey(name: 'inv_ext') bool invExt,
            @JsonKey(name: 'inv_ext_music') bool invExtMusic,
            @JsonKey(name: 'music_ext') String? musicExt,
            @JsonKey(name: 'inv_petition') bool invPetition,
            @JsonKey(name: 'forbidden_music') bool forbiddenMusic,
            @JsonKey(name: 'music_forbidden') String? musicForbidden,
            @JsonKey(name: 'music_final') String? musicFinal,
            @JsonKey(name: 'music_comments') String? musicComments,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt,
            @JsonKey(name: 'is_deleted') bool isDeleted,
            @JsonKey(name: 'music_lectura_ext')
            Map<String, dynamic>? musicLecturaExt,
            @JsonKey(name: 'music_coctel_playlist')
            Map<String, dynamic>? musicCoctelPlaylist)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodaMusic() when $default != null:
        return $default(
            _that.id,
            _that.bodaId,
            _that.musicReception,
            _that.musicEntradaNovio,
            _that.musicEntradaNovia,
            _that.musicLect1,
            _that.musicLect2,
            _that.musicLect3,
            _that.musicLect4,
            _that.musicAlianza,
            _that.musicFirma,
            _that.musicEndCeremony,
            _that.musicCoctel,
            _that.musicType,
            _that.musicEntranceSalon,
            _that.musicDinner,
            _that.musicCake,
            _that.musicRamos,
            _that.musicSurprise,
            _that.musicBarraNovios,
            _that.musicBarraOpcional,
            _that.musicNovio,
            _that.musicNovia,
            _that.invExt,
            _that.invExtMusic,
            _that.musicExt,
            _that.invPetition,
            _that.forbiddenMusic,
            _that.musicForbidden,
            _that.musicFinal,
            _that.musicComments,
            _that.createdAt,
            _that.updatedAt,
            _that.isDeleted,
            _that.musicLecturaExt,
            _that.musicCoctelPlaylist);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BodaMusic implements BodaMusic {
  const _BodaMusic(
      {required this.id,
      @JsonKey(name: 'boda_id') required this.bodaId,
      @JsonKey(name: 'music_reception') this.musicReception,
      @JsonKey(name: 'music_entrada_novio') this.musicEntradaNovio,
      @JsonKey(name: 'music_entrada_novia') this.musicEntradaNovia,
      @JsonKey(name: 'music_lect1') this.musicLect1,
      @JsonKey(name: 'music_lect2') this.musicLect2,
      @JsonKey(name: 'music_lect3') this.musicLect3,
      @JsonKey(name: 'music_lect4') this.musicLect4,
      @JsonKey(name: 'music_alianza') this.musicAlianza,
      @JsonKey(name: 'music_firma') this.musicFirma,
      @JsonKey(name: 'music_end_ceremony') this.musicEndCeremony,
      @JsonKey(name: 'music_coctel') this.musicCoctel,
      @JsonKey(name: 'music_type') this.musicType,
      @JsonKey(name: 'music_entrance_salon') this.musicEntranceSalon,
      @JsonKey(name: 'music_dinner') this.musicDinner,
      @JsonKey(name: 'music_cake') this.musicCake,
      @JsonKey(name: 'music_ramos') this.musicRamos,
      @JsonKey(name: 'music_surprise') this.musicSurprise,
      @JsonKey(name: 'music_barra_novios') this.musicBarraNovios,
      @JsonKey(name: 'music_barra_opcional') this.musicBarraOpcional,
      @JsonKey(name: 'music_novio') final Map<String, dynamic>? musicNovio,
      @JsonKey(name: 'music_novia') final Map<String, dynamic>? musicNovia,
      @JsonKey(name: 'inv_ext') this.invExt = false,
      @JsonKey(name: 'inv_ext_music') this.invExtMusic = false,
      @JsonKey(name: 'music_ext') this.musicExt,
      @JsonKey(name: 'inv_petition') this.invPetition = false,
      @JsonKey(name: 'forbidden_music') this.forbiddenMusic = false,
      @JsonKey(name: 'music_forbidden') this.musicForbidden,
      @JsonKey(name: 'music_final') this.musicFinal,
      @JsonKey(name: 'music_comments') this.musicComments,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'is_deleted') this.isDeleted = false,
      @JsonKey(name: 'music_lectura_ext')
      final Map<String, dynamic>? musicLecturaExt,
      @JsonKey(name: 'music_coctel_playlist')
      final Map<String, dynamic>? musicCoctelPlaylist})
      : _musicNovio = musicNovio,
        _musicNovia = musicNovia,
        _musicLecturaExt = musicLecturaExt,
        _musicCoctelPlaylist = musicCoctelPlaylist;
  factory _BodaMusic.fromJson(Map<String, dynamic> json) =>
      _$BodaMusicFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'boda_id')
  final int bodaId;
  @override
  @JsonKey(name: 'music_reception')
  final String? musicReception;
  @override
  @JsonKey(name: 'music_entrada_novio')
  final String? musicEntradaNovio;
  @override
  @JsonKey(name: 'music_entrada_novia')
  final String? musicEntradaNovia;
  @override
  @JsonKey(name: 'music_lect1')
  final String? musicLect1;
  @override
  @JsonKey(name: 'music_lect2')
  final String? musicLect2;
  @override
  @JsonKey(name: 'music_lect3')
  final String? musicLect3;
  @override
  @JsonKey(name: 'music_lect4')
  final String? musicLect4;
  @override
  @JsonKey(name: 'music_alianza')
  final String? musicAlianza;
  @override
  @JsonKey(name: 'music_firma')
  final String? musicFirma;
  @override
  @JsonKey(name: 'music_end_ceremony')
  final String? musicEndCeremony;
  @override
  @JsonKey(name: 'music_coctel')
  final String? musicCoctel;
  @override
  @JsonKey(name: 'music_type')
  final int? musicType;
  @override
  @JsonKey(name: 'music_entrance_salon')
  final String? musicEntranceSalon;
  @override
  @JsonKey(name: 'music_dinner')
  final String? musicDinner;
  @override
  @JsonKey(name: 'music_cake')
  final String? musicCake;
  @override
  @JsonKey(name: 'music_ramos')
  final String? musicRamos;
// Corregido: music_surpise -> music_surprise
  @override
  @JsonKey(name: 'music_surprise')
  final String? musicSurprise;
  @override
  @JsonKey(name: 'music_barra_novios')
  final String? musicBarraNovios;
  @override
  @JsonKey(name: 'music_barra_opcional')
  final String? musicBarraOpcional;
  final Map<String, dynamic>? _musicNovio;
  @override
  @JsonKey(name: 'music_novio')
  Map<String, dynamic>? get musicNovio {
    final value = _musicNovio;
    if (value == null) return null;
    if (_musicNovio is EqualUnmodifiableMapView) return _musicNovio;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _musicNovia;
  @override
  @JsonKey(name: 'music_novia')
  Map<String, dynamic>? get musicNovia {
    final value = _musicNovia;
    if (value == null) return null;
    if (_musicNovia is EqualUnmodifiableMapView) return _musicNovia;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'inv_ext')
  final bool invExt;
  @override
  @JsonKey(name: 'inv_ext_music')
  final bool invExtMusic;
  @override
  @JsonKey(name: 'music_ext')
  final String? musicExt;
  @override
  @JsonKey(name: 'inv_petition')
  final bool invPetition;
// Corregido: forbiden_music -> forbidden_music
  @override
  @JsonKey(name: 'forbidden_music')
  final bool forbiddenMusic;
// Corregido: music_forbiden -> music_forbidden
  @override
  @JsonKey(name: 'music_forbidden')
  final String? musicForbidden;
  @override
  @JsonKey(name: 'music_final')
  final String? musicFinal;
// Corregido: music_coments -> music_comments
  @override
  @JsonKey(name: 'music_comments')
  final String? musicComments;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;
// Corregido: music_lec_ext -> music_lectura_ext
  final Map<String, dynamic>? _musicLecturaExt;
// Corregido: music_lec_ext -> music_lectura_ext
  @override
  @JsonKey(name: 'music_lectura_ext')
  Map<String, dynamic>? get musicLecturaExt {
    final value = _musicLecturaExt;
    if (value == null) return null;
    if (_musicLecturaExt is EqualUnmodifiableMapView) return _musicLecturaExt;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _musicCoctelPlaylist;
  @override
  @JsonKey(name: 'music_coctel_playlist')
  Map<String, dynamic>? get musicCoctelPlaylist {
    final value = _musicCoctelPlaylist;
    if (value == null) return null;
    if (_musicCoctelPlaylist is EqualUnmodifiableMapView)
      return _musicCoctelPlaylist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of BodaMusic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BodaMusicCopyWith<_BodaMusic> get copyWith =>
      __$BodaMusicCopyWithImpl<_BodaMusic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BodaMusicToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BodaMusic &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bodaId, bodaId) || other.bodaId == bodaId) &&
            (identical(other.musicReception, musicReception) ||
                other.musicReception == musicReception) &&
            (identical(other.musicEntradaNovio, musicEntradaNovio) ||
                other.musicEntradaNovio == musicEntradaNovio) &&
            (identical(other.musicEntradaNovia, musicEntradaNovia) ||
                other.musicEntradaNovia == musicEntradaNovia) &&
            (identical(other.musicLect1, musicLect1) ||
                other.musicLect1 == musicLect1) &&
            (identical(other.musicLect2, musicLect2) ||
                other.musicLect2 == musicLect2) &&
            (identical(other.musicLect3, musicLect3) ||
                other.musicLect3 == musicLect3) &&
            (identical(other.musicLect4, musicLect4) ||
                other.musicLect4 == musicLect4) &&
            (identical(other.musicAlianza, musicAlianza) ||
                other.musicAlianza == musicAlianza) &&
            (identical(other.musicFirma, musicFirma) ||
                other.musicFirma == musicFirma) &&
            (identical(other.musicEndCeremony, musicEndCeremony) ||
                other.musicEndCeremony == musicEndCeremony) &&
            (identical(other.musicCoctel, musicCoctel) ||
                other.musicCoctel == musicCoctel) &&
            (identical(other.musicType, musicType) ||
                other.musicType == musicType) &&
            (identical(other.musicEntranceSalon, musicEntranceSalon) ||
                other.musicEntranceSalon == musicEntranceSalon) &&
            (identical(other.musicDinner, musicDinner) ||
                other.musicDinner == musicDinner) &&
            (identical(other.musicCake, musicCake) ||
                other.musicCake == musicCake) &&
            (identical(other.musicRamos, musicRamos) ||
                other.musicRamos == musicRamos) &&
            (identical(other.musicSurprise, musicSurprise) ||
                other.musicSurprise == musicSurprise) &&
            (identical(other.musicBarraNovios, musicBarraNovios) ||
                other.musicBarraNovios == musicBarraNovios) &&
            (identical(other.musicBarraOpcional, musicBarraOpcional) ||
                other.musicBarraOpcional == musicBarraOpcional) &&
            const DeepCollectionEquality()
                .equals(other._musicNovio, _musicNovio) &&
            const DeepCollectionEquality()
                .equals(other._musicNovia, _musicNovia) &&
            (identical(other.invExt, invExt) || other.invExt == invExt) &&
            (identical(other.invExtMusic, invExtMusic) ||
                other.invExtMusic == invExtMusic) &&
            (identical(other.musicExt, musicExt) ||
                other.musicExt == musicExt) &&
            (identical(other.invPetition, invPetition) ||
                other.invPetition == invPetition) &&
            (identical(other.forbiddenMusic, forbiddenMusic) ||
                other.forbiddenMusic == forbiddenMusic) &&
            (identical(other.musicForbidden, musicForbidden) ||
                other.musicForbidden == musicForbidden) &&
            (identical(other.musicFinal, musicFinal) ||
                other.musicFinal == musicFinal) &&
            (identical(other.musicComments, musicComments) ||
                other.musicComments == musicComments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            const DeepCollectionEquality()
                .equals(other._musicLecturaExt, _musicLecturaExt) &&
            const DeepCollectionEquality()
                .equals(other._musicCoctelPlaylist, _musicCoctelPlaylist));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        bodaId,
        musicReception,
        musicEntradaNovio,
        musicEntradaNovia,
        musicLect1,
        musicLect2,
        musicLect3,
        musicLect4,
        musicAlianza,
        musicFirma,
        musicEndCeremony,
        musicCoctel,
        musicType,
        musicEntranceSalon,
        musicDinner,
        musicCake,
        musicRamos,
        musicSurprise,
        musicBarraNovios,
        musicBarraOpcional,
        const DeepCollectionEquality().hash(_musicNovio),
        const DeepCollectionEquality().hash(_musicNovia),
        invExt,
        invExtMusic,
        musicExt,
        invPetition,
        forbiddenMusic,
        musicForbidden,
        musicFinal,
        musicComments,
        createdAt,
        updatedAt,
        isDeleted,
        const DeepCollectionEquality().hash(_musicLecturaExt),
        const DeepCollectionEquality().hash(_musicCoctelPlaylist)
      ]);

  @override
  String toString() {
    return 'BodaMusic(id: $id, bodaId: $bodaId, musicReception: $musicReception, musicEntradaNovio: $musicEntradaNovio, musicEntradaNovia: $musicEntradaNovia, musicLect1: $musicLect1, musicLect2: $musicLect2, musicLect3: $musicLect3, musicLect4: $musicLect4, musicAlianza: $musicAlianza, musicFirma: $musicFirma, musicEndCeremony: $musicEndCeremony, musicCoctel: $musicCoctel, musicType: $musicType, musicEntranceSalon: $musicEntranceSalon, musicDinner: $musicDinner, musicCake: $musicCake, musicRamos: $musicRamos, musicSurprise: $musicSurprise, musicBarraNovios: $musicBarraNovios, musicBarraOpcional: $musicBarraOpcional, musicNovio: $musicNovio, musicNovia: $musicNovia, invExt: $invExt, invExtMusic: $invExtMusic, musicExt: $musicExt, invPetition: $invPetition, forbiddenMusic: $forbiddenMusic, musicForbidden: $musicForbidden, musicFinal: $musicFinal, musicComments: $musicComments, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, musicLecturaExt: $musicLecturaExt, musicCoctelPlaylist: $musicCoctelPlaylist)';
  }
}

/// @nodoc
abstract mixin class _$BodaMusicCopyWith<$Res>
    implements $BodaMusicCopyWith<$Res> {
  factory _$BodaMusicCopyWith(
          _BodaMusic value, $Res Function(_BodaMusic) _then) =
      __$BodaMusicCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'boda_id') int bodaId,
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
      @JsonKey(name: 'music_surprise') String? musicSurprise,
      @JsonKey(name: 'music_barra_novios') String? musicBarraNovios,
      @JsonKey(name: 'music_barra_opcional') String? musicBarraOpcional,
      @JsonKey(name: 'music_novio') Map<String, dynamic>? musicNovio,
      @JsonKey(name: 'music_novia') Map<String, dynamic>? musicNovia,
      @JsonKey(name: 'inv_ext') bool invExt,
      @JsonKey(name: 'inv_ext_music') bool invExtMusic,
      @JsonKey(name: 'music_ext') String? musicExt,
      @JsonKey(name: 'inv_petition') bool invPetition,
      @JsonKey(name: 'forbidden_music') bool forbiddenMusic,
      @JsonKey(name: 'music_forbidden') String? musicForbidden,
      @JsonKey(name: 'music_final') String? musicFinal,
      @JsonKey(name: 'music_comments') String? musicComments,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'is_deleted') bool isDeleted,
      @JsonKey(name: 'music_lectura_ext') Map<String, dynamic>? musicLecturaExt,
      @JsonKey(name: 'music_coctel_playlist')
      Map<String, dynamic>? musicCoctelPlaylist});
}

/// @nodoc
class __$BodaMusicCopyWithImpl<$Res> implements _$BodaMusicCopyWith<$Res> {
  __$BodaMusicCopyWithImpl(this._self, this._then);

  final _BodaMusic _self;
  final $Res Function(_BodaMusic) _then;

  /// Create a copy of BodaMusic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? bodaId = null,
    Object? musicReception = freezed,
    Object? musicEntradaNovio = freezed,
    Object? musicEntradaNovia = freezed,
    Object? musicLect1 = freezed,
    Object? musicLect2 = freezed,
    Object? musicLect3 = freezed,
    Object? musicLect4 = freezed,
    Object? musicAlianza = freezed,
    Object? musicFirma = freezed,
    Object? musicEndCeremony = freezed,
    Object? musicCoctel = freezed,
    Object? musicType = freezed,
    Object? musicEntranceSalon = freezed,
    Object? musicDinner = freezed,
    Object? musicCake = freezed,
    Object? musicRamos = freezed,
    Object? musicSurprise = freezed,
    Object? musicBarraNovios = freezed,
    Object? musicBarraOpcional = freezed,
    Object? musicNovio = freezed,
    Object? musicNovia = freezed,
    Object? invExt = null,
    Object? invExtMusic = null,
    Object? musicExt = freezed,
    Object? invPetition = null,
    Object? forbiddenMusic = null,
    Object? musicForbidden = freezed,
    Object? musicFinal = freezed,
    Object? musicComments = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = null,
    Object? musicLecturaExt = freezed,
    Object? musicCoctelPlaylist = freezed,
  }) {
    return _then(_BodaMusic(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bodaId: null == bodaId
          ? _self.bodaId
          : bodaId // ignore: cast_nullable_to_non_nullable
              as int,
      musicReception: freezed == musicReception
          ? _self.musicReception
          : musicReception // ignore: cast_nullable_to_non_nullable
              as String?,
      musicEntradaNovio: freezed == musicEntradaNovio
          ? _self.musicEntradaNovio
          : musicEntradaNovio // ignore: cast_nullable_to_non_nullable
              as String?,
      musicEntradaNovia: freezed == musicEntradaNovia
          ? _self.musicEntradaNovia
          : musicEntradaNovia // ignore: cast_nullable_to_non_nullable
              as String?,
      musicLect1: freezed == musicLect1
          ? _self.musicLect1
          : musicLect1 // ignore: cast_nullable_to_non_nullable
              as String?,
      musicLect2: freezed == musicLect2
          ? _self.musicLect2
          : musicLect2 // ignore: cast_nullable_to_non_nullable
              as String?,
      musicLect3: freezed == musicLect3
          ? _self.musicLect3
          : musicLect3 // ignore: cast_nullable_to_non_nullable
              as String?,
      musicLect4: freezed == musicLect4
          ? _self.musicLect4
          : musicLect4 // ignore: cast_nullable_to_non_nullable
              as String?,
      musicAlianza: freezed == musicAlianza
          ? _self.musicAlianza
          : musicAlianza // ignore: cast_nullable_to_non_nullable
              as String?,
      musicFirma: freezed == musicFirma
          ? _self.musicFirma
          : musicFirma // ignore: cast_nullable_to_non_nullable
              as String?,
      musicEndCeremony: freezed == musicEndCeremony
          ? _self.musicEndCeremony
          : musicEndCeremony // ignore: cast_nullable_to_non_nullable
              as String?,
      musicCoctel: freezed == musicCoctel
          ? _self.musicCoctel
          : musicCoctel // ignore: cast_nullable_to_non_nullable
              as String?,
      musicType: freezed == musicType
          ? _self.musicType
          : musicType // ignore: cast_nullable_to_non_nullable
              as int?,
      musicEntranceSalon: freezed == musicEntranceSalon
          ? _self.musicEntranceSalon
          : musicEntranceSalon // ignore: cast_nullable_to_non_nullable
              as String?,
      musicDinner: freezed == musicDinner
          ? _self.musicDinner
          : musicDinner // ignore: cast_nullable_to_non_nullable
              as String?,
      musicCake: freezed == musicCake
          ? _self.musicCake
          : musicCake // ignore: cast_nullable_to_non_nullable
              as String?,
      musicRamos: freezed == musicRamos
          ? _self.musicRamos
          : musicRamos // ignore: cast_nullable_to_non_nullable
              as String?,
      musicSurprise: freezed == musicSurprise
          ? _self.musicSurprise
          : musicSurprise // ignore: cast_nullable_to_non_nullable
              as String?,
      musicBarraNovios: freezed == musicBarraNovios
          ? _self.musicBarraNovios
          : musicBarraNovios // ignore: cast_nullable_to_non_nullable
              as String?,
      musicBarraOpcional: freezed == musicBarraOpcional
          ? _self.musicBarraOpcional
          : musicBarraOpcional // ignore: cast_nullable_to_non_nullable
              as String?,
      musicNovio: freezed == musicNovio
          ? _self._musicNovio
          : musicNovio // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      musicNovia: freezed == musicNovia
          ? _self._musicNovia
          : musicNovia // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      invExt: null == invExt
          ? _self.invExt
          : invExt // ignore: cast_nullable_to_non_nullable
              as bool,
      invExtMusic: null == invExtMusic
          ? _self.invExtMusic
          : invExtMusic // ignore: cast_nullable_to_non_nullable
              as bool,
      musicExt: freezed == musicExt
          ? _self.musicExt
          : musicExt // ignore: cast_nullable_to_non_nullable
              as String?,
      invPetition: null == invPetition
          ? _self.invPetition
          : invPetition // ignore: cast_nullable_to_non_nullable
              as bool,
      forbiddenMusic: null == forbiddenMusic
          ? _self.forbiddenMusic
          : forbiddenMusic // ignore: cast_nullable_to_non_nullable
              as bool,
      musicForbidden: freezed == musicForbidden
          ? _self.musicForbidden
          : musicForbidden // ignore: cast_nullable_to_non_nullable
              as String?,
      musicFinal: freezed == musicFinal
          ? _self.musicFinal
          : musicFinal // ignore: cast_nullable_to_non_nullable
              as String?,
      musicComments: freezed == musicComments
          ? _self.musicComments
          : musicComments // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      musicLecturaExt: freezed == musicLecturaExt
          ? _self._musicLecturaExt
          : musicLecturaExt // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      musicCoctelPlaylist: freezed == musicCoctelPlaylist
          ? _self._musicCoctelPlaylist
          : musicCoctelPlaylist // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
mixin _$MusicType {
  @JsonKey(name: 'id')
  int get id;
  @JsonKey(name: 'descripcion')
  String get descripcion;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @JsonKey(name: 'is_deleted')
  bool get isDeleted;

  /// Create a copy of MusicType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MusicTypeCopyWith<MusicType> get copyWith =>
      _$MusicTypeCopyWithImpl<MusicType>(this as MusicType, _$identity);

  /// Serializes this MusicType to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MusicType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.descripcion, descripcion) ||
                other.descripcion == descripcion) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, descripcion, createdAt, updatedAt, isDeleted);

  @override
  String toString() {
    return 'MusicType(id: $id, descripcion: $descripcion, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
  }
}

/// @nodoc
abstract mixin class $MusicTypeCopyWith<$Res> {
  factory $MusicTypeCopyWith(MusicType value, $Res Function(MusicType) _then) =
      _$MusicTypeCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'descripcion') String descripcion,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'is_deleted') bool isDeleted});
}

/// @nodoc
class _$MusicTypeCopyWithImpl<$Res> implements $MusicTypeCopyWith<$Res> {
  _$MusicTypeCopyWithImpl(this._self, this._then);

  final MusicType _self;
  final $Res Function(MusicType) _then;

  /// Create a copy of MusicType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? descripcion = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      descripcion: null == descripcion
          ? _self.descripcion
          : descripcion // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [MusicType].
extension MusicTypePatterns on MusicType {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MusicType value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MusicType() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MusicType value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MusicType():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MusicType value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MusicType() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'descripcion') String descripcion,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt,
            @JsonKey(name: 'is_deleted') bool isDeleted)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MusicType() when $default != null:
        return $default(_that.id, _that.descripcion, _that.createdAt,
            _that.updatedAt, _that.isDeleted);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'descripcion') String descripcion,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt,
            @JsonKey(name: 'is_deleted') bool isDeleted)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MusicType():
        return $default(_that.id, _that.descripcion, _that.createdAt,
            _that.updatedAt, _that.isDeleted);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'descripcion') String descripcion,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'updated_at') DateTime? updatedAt,
            @JsonKey(name: 'is_deleted') bool isDeleted)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MusicType() when $default != null:
        return $default(_that.id, _that.descripcion, _that.createdAt,
            _that.updatedAt, _that.isDeleted);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MusicType implements MusicType {
  const _MusicType(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'descripcion') required this.descripcion,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'is_deleted') this.isDeleted = false});
  factory _MusicType.fromJson(Map<String, dynamic> json) =>
      _$MusicTypeFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'descripcion')
  final String descripcion;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  /// Create a copy of MusicType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MusicTypeCopyWith<_MusicType> get copyWith =>
      __$MusicTypeCopyWithImpl<_MusicType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MusicTypeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MusicType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.descripcion, descripcion) ||
                other.descripcion == descripcion) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, descripcion, createdAt, updatedAt, isDeleted);

  @override
  String toString() {
    return 'MusicType(id: $id, descripcion: $descripcion, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
  }
}

/// @nodoc
abstract mixin class _$MusicTypeCopyWith<$Res>
    implements $MusicTypeCopyWith<$Res> {
  factory _$MusicTypeCopyWith(
          _MusicType value, $Res Function(_MusicType) _then) =
      __$MusicTypeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'descripcion') String descripcion,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'is_deleted') bool isDeleted});
}

/// @nodoc
class __$MusicTypeCopyWithImpl<$Res> implements _$MusicTypeCopyWith<$Res> {
  __$MusicTypeCopyWithImpl(this._self, this._then);

  final _MusicType _self;
  final $Res Function(_MusicType) _then;

  /// Create a copy of MusicType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? descripcion = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = null,
  }) {
    return _then(_MusicType(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      descripcion: null == descripcion
          ? _self.descripcion
          : descripcion // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cotizacion_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CotizacionRequest {
  String get userId;
  String get nombre;
  String get email;
  String get telefonoNovio;
  String get telefonoNovia;
  String get lugarCeremonia;
  bool get isSumitedBoda;
  DateTime get fechaUltimaBoda;
  int get invitados;
  String get tipoCeremonia;

  /// Create a copy of CotizacionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CotizacionRequestCopyWith<CotizacionRequest> get copyWith =>
      _$CotizacionRequestCopyWithImpl<CotizacionRequest>(
          this as CotizacionRequest, _$identity);

  /// Serializes this CotizacionRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CotizacionRequest &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.telefonoNovio, telefonoNovio) ||
                other.telefonoNovio == telefonoNovio) &&
            (identical(other.telefonoNovia, telefonoNovia) ||
                other.telefonoNovia == telefonoNovia) &&
            (identical(other.lugarCeremonia, lugarCeremonia) ||
                other.lugarCeremonia == lugarCeremonia) &&
            (identical(other.isSumitedBoda, isSumitedBoda) ||
                other.isSumitedBoda == isSumitedBoda) &&
            (identical(other.fechaUltimaBoda, fechaUltimaBoda) ||
                other.fechaUltimaBoda == fechaUltimaBoda) &&
            (identical(other.invitados, invitados) ||
                other.invitados == invitados) &&
            (identical(other.tipoCeremonia, tipoCeremonia) ||
                other.tipoCeremonia == tipoCeremonia));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      nombre,
      email,
      telefonoNovio,
      telefonoNovia,
      lugarCeremonia,
      isSumitedBoda,
      fechaUltimaBoda,
      invitados,
      tipoCeremonia);

  @override
  String toString() {
    return 'CotizacionRequest(userId: $userId, nombre: $nombre, email: $email, telefonoNovio: $telefonoNovio, telefonoNovia: $telefonoNovia, lugarCeremonia: $lugarCeremonia, isSumitedBoda: $isSumitedBoda, fechaUltimaBoda: $fechaUltimaBoda, invitados: $invitados, tipoCeremonia: $tipoCeremonia)';
  }
}

/// @nodoc
abstract mixin class $CotizacionRequestCopyWith<$Res> {
  factory $CotizacionRequestCopyWith(
          CotizacionRequest value, $Res Function(CotizacionRequest) _then) =
      _$CotizacionRequestCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      String nombre,
      String email,
      String telefonoNovio,
      String telefonoNovia,
      String lugarCeremonia,
      bool isSumitedBoda,
      DateTime fechaUltimaBoda,
      int invitados,
      String tipoCeremonia});
}

/// @nodoc
class _$CotizacionRequestCopyWithImpl<$Res>
    implements $CotizacionRequestCopyWith<$Res> {
  _$CotizacionRequestCopyWithImpl(this._self, this._then);

  final CotizacionRequest _self;
  final $Res Function(CotizacionRequest) _then;

  /// Create a copy of CotizacionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? nombre = null,
    Object? email = null,
    Object? telefonoNovio = null,
    Object? telefonoNovia = null,
    Object? lugarCeremonia = null,
    Object? isSumitedBoda = null,
    Object? fechaUltimaBoda = null,
    Object? invitados = null,
    Object? tipoCeremonia = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _self.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      telefonoNovio: null == telefonoNovio
          ? _self.telefonoNovio
          : telefonoNovio // ignore: cast_nullable_to_non_nullable
              as String,
      telefonoNovia: null == telefonoNovia
          ? _self.telefonoNovia
          : telefonoNovia // ignore: cast_nullable_to_non_nullable
              as String,
      lugarCeremonia: null == lugarCeremonia
          ? _self.lugarCeremonia
          : lugarCeremonia // ignore: cast_nullable_to_non_nullable
              as String,
      isSumitedBoda: null == isSumitedBoda
          ? _self.isSumitedBoda
          : isSumitedBoda // ignore: cast_nullable_to_non_nullable
              as bool,
      fechaUltimaBoda: null == fechaUltimaBoda
          ? _self.fechaUltimaBoda
          : fechaUltimaBoda // ignore: cast_nullable_to_non_nullable
              as DateTime,
      invitados: null == invitados
          ? _self.invitados
          : invitados // ignore: cast_nullable_to_non_nullable
              as int,
      tipoCeremonia: null == tipoCeremonia
          ? _self.tipoCeremonia
          : tipoCeremonia // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CotizacionRequest implements CotizacionRequest {
  const _CotizacionRequest(
      {required this.userId,
      required this.nombre,
      required this.email,
      required this.telefonoNovio,
      required this.telefonoNovia,
      required this.lugarCeremonia,
      required this.isSumitedBoda,
      required this.fechaUltimaBoda,
      required this.invitados,
      required this.tipoCeremonia});
  factory _CotizacionRequest.fromJson(Map<String, dynamic> json) =>
      _$CotizacionRequestFromJson(json);

  @override
  final String userId;
  @override
  final String nombre;
  @override
  final String email;
  @override
  final String telefonoNovio;
  @override
  final String telefonoNovia;
  @override
  final String lugarCeremonia;
  @override
  final bool isSumitedBoda;
  @override
  final DateTime fechaUltimaBoda;
  @override
  final int invitados;
  @override
  final String tipoCeremonia;

  /// Create a copy of CotizacionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CotizacionRequestCopyWith<_CotizacionRequest> get copyWith =>
      __$CotizacionRequestCopyWithImpl<_CotizacionRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CotizacionRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CotizacionRequest &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.telefonoNovio, telefonoNovio) ||
                other.telefonoNovio == telefonoNovio) &&
            (identical(other.telefonoNovia, telefonoNovia) ||
                other.telefonoNovia == telefonoNovia) &&
            (identical(other.lugarCeremonia, lugarCeremonia) ||
                other.lugarCeremonia == lugarCeremonia) &&
            (identical(other.isSumitedBoda, isSumitedBoda) ||
                other.isSumitedBoda == isSumitedBoda) &&
            (identical(other.fechaUltimaBoda, fechaUltimaBoda) ||
                other.fechaUltimaBoda == fechaUltimaBoda) &&
            (identical(other.invitados, invitados) ||
                other.invitados == invitados) &&
            (identical(other.tipoCeremonia, tipoCeremonia) ||
                other.tipoCeremonia == tipoCeremonia));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      nombre,
      email,
      telefonoNovio,
      telefonoNovia,
      lugarCeremonia,
      isSumitedBoda,
      fechaUltimaBoda,
      invitados,
      tipoCeremonia);

  @override
  String toString() {
    return 'CotizacionRequest(userId: $userId, nombre: $nombre, email: $email, telefonoNovio: $telefonoNovio, telefonoNovia: $telefonoNovia, lugarCeremonia: $lugarCeremonia, isSumitedBoda: $isSumitedBoda, fechaUltimaBoda: $fechaUltimaBoda, invitados: $invitados, tipoCeremonia: $tipoCeremonia)';
  }
}

/// @nodoc
abstract mixin class _$CotizacionRequestCopyWith<$Res>
    implements $CotizacionRequestCopyWith<$Res> {
  factory _$CotizacionRequestCopyWith(
          _CotizacionRequest value, $Res Function(_CotizacionRequest) _then) =
      __$CotizacionRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      String nombre,
      String email,
      String telefonoNovio,
      String telefonoNovia,
      String lugarCeremonia,
      bool isSumitedBoda,
      DateTime fechaUltimaBoda,
      int invitados,
      String tipoCeremonia});
}

/// @nodoc
class __$CotizacionRequestCopyWithImpl<$Res>
    implements _$CotizacionRequestCopyWith<$Res> {
  __$CotizacionRequestCopyWithImpl(this._self, this._then);

  final _CotizacionRequest _self;
  final $Res Function(_CotizacionRequest) _then;

  /// Create a copy of CotizacionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? nombre = null,
    Object? email = null,
    Object? telefonoNovio = null,
    Object? telefonoNovia = null,
    Object? lugarCeremonia = null,
    Object? isSumitedBoda = null,
    Object? fechaUltimaBoda = null,
    Object? invitados = null,
    Object? tipoCeremonia = null,
  }) {
    return _then(_CotizacionRequest(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _self.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      telefonoNovio: null == telefonoNovio
          ? _self.telefonoNovio
          : telefonoNovio // ignore: cast_nullable_to_non_nullable
              as String,
      telefonoNovia: null == telefonoNovia
          ? _self.telefonoNovia
          : telefonoNovia // ignore: cast_nullable_to_non_nullable
              as String,
      lugarCeremonia: null == lugarCeremonia
          ? _self.lugarCeremonia
          : lugarCeremonia // ignore: cast_nullable_to_non_nullable
              as String,
      isSumitedBoda: null == isSumitedBoda
          ? _self.isSumitedBoda
          : isSumitedBoda // ignore: cast_nullable_to_non_nullable
              as bool,
      fechaUltimaBoda: null == fechaUltimaBoda
          ? _self.fechaUltimaBoda
          : fechaUltimaBoda // ignore: cast_nullable_to_non_nullable
              as DateTime,
      invitados: null == invitados
          ? _self.invitados
          : invitados // ignore: cast_nullable_to_non_nullable
              as int,
      tipoCeremonia: null == tipoCeremonia
          ? _self.tipoCeremonia
          : tipoCeremonia // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

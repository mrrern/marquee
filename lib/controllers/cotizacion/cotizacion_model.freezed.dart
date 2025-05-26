// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cotizacion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cotizacion {
  int get id;
  int get bodaId;
  String get archivoAdmin;
  String? get archivoCliente;
  DateTime get createdAt;
  bool? get firmado;

  /// Create a copy of Cotizacion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CotizacionCopyWith<Cotizacion> get copyWith =>
      _$CotizacionCopyWithImpl<Cotizacion>(this as Cotizacion, _$identity);

  /// Serializes this Cotizacion to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Cotizacion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bodaId, bodaId) || other.bodaId == bodaId) &&
            (identical(other.archivoAdmin, archivoAdmin) ||
                other.archivoAdmin == archivoAdmin) &&
            (identical(other.archivoCliente, archivoCliente) ||
                other.archivoCliente == archivoCliente) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.firmado, firmado) || other.firmado == firmado));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, bodaId, archivoAdmin,
      archivoCliente, createdAt, firmado);

  @override
  String toString() {
    return 'Cotizacion(id: $id, bodaId: $bodaId, archivoAdmin: $archivoAdmin, archivoCliente: $archivoCliente, createdAt: $createdAt, firmado: $firmado)';
  }
}

/// @nodoc
abstract mixin class $CotizacionCopyWith<$Res> {
  factory $CotizacionCopyWith(
          Cotizacion value, $Res Function(Cotizacion) _then) =
      _$CotizacionCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int bodaId,
      String archivoAdmin,
      String? archivoCliente,
      DateTime createdAt,
      bool? firmado});
}

/// @nodoc
class _$CotizacionCopyWithImpl<$Res> implements $CotizacionCopyWith<$Res> {
  _$CotizacionCopyWithImpl(this._self, this._then);

  final Cotizacion _self;
  final $Res Function(Cotizacion) _then;

  /// Create a copy of Cotizacion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bodaId = null,
    Object? archivoAdmin = null,
    Object? archivoCliente = freezed,
    Object? createdAt = null,
    Object? firmado = freezed,
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
      archivoAdmin: null == archivoAdmin
          ? _self.archivoAdmin
          : archivoAdmin // ignore: cast_nullable_to_non_nullable
              as String,
      archivoCliente: freezed == archivoCliente
          ? _self.archivoCliente
          : archivoCliente // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firmado: freezed == firmado
          ? _self.firmado
          : firmado // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Cotizacion extends Cotizacion {
  const _Cotizacion(
      {required this.id,
      required this.bodaId,
      required this.archivoAdmin,
      this.archivoCliente,
      required this.createdAt,
      this.firmado})
      : super._();
  factory _Cotizacion.fromJson(Map<String, dynamic> json) =>
      _$CotizacionFromJson(json);

  @override
  final int id;
  @override
  final int bodaId;
  @override
  final String archivoAdmin;
  @override
  final String? archivoCliente;
  @override
  final DateTime createdAt;
  @override
  final bool? firmado;

  /// Create a copy of Cotizacion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CotizacionCopyWith<_Cotizacion> get copyWith =>
      __$CotizacionCopyWithImpl<_Cotizacion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CotizacionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Cotizacion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bodaId, bodaId) || other.bodaId == bodaId) &&
            (identical(other.archivoAdmin, archivoAdmin) ||
                other.archivoAdmin == archivoAdmin) &&
            (identical(other.archivoCliente, archivoCliente) ||
                other.archivoCliente == archivoCliente) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.firmado, firmado) || other.firmado == firmado));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, bodaId, archivoAdmin,
      archivoCliente, createdAt, firmado);

  @override
  String toString() {
    return 'Cotizacion(id: $id, bodaId: $bodaId, archivoAdmin: $archivoAdmin, archivoCliente: $archivoCliente, createdAt: $createdAt, firmado: $firmado)';
  }
}

/// @nodoc
abstract mixin class _$CotizacionCopyWith<$Res>
    implements $CotizacionCopyWith<$Res> {
  factory _$CotizacionCopyWith(
          _Cotizacion value, $Res Function(_Cotizacion) _then) =
      __$CotizacionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int bodaId,
      String archivoAdmin,
      String? archivoCliente,
      DateTime createdAt,
      bool? firmado});
}

/// @nodoc
class __$CotizacionCopyWithImpl<$Res> implements _$CotizacionCopyWith<$Res> {
  __$CotizacionCopyWithImpl(this._self, this._then);

  final _Cotizacion _self;
  final $Res Function(_Cotizacion) _then;

  /// Create a copy of Cotizacion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? bodaId = null,
    Object? archivoAdmin = null,
    Object? archivoCliente = freezed,
    Object? createdAt = null,
    Object? firmado = freezed,
  }) {
    return _then(_Cotizacion(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bodaId: null == bodaId
          ? _self.bodaId
          : bodaId // ignore: cast_nullable_to_non_nullable
              as int,
      archivoAdmin: null == archivoAdmin
          ? _self.archivoAdmin
          : archivoAdmin // ignore: cast_nullable_to_non_nullable
              as String,
      archivoCliente: freezed == archivoCliente
          ? _self.archivoCliente
          : archivoCliente // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firmado: freezed == firmado
          ? _self.firmado
          : firmado // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on

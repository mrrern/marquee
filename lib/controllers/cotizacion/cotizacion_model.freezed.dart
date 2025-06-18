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
mixin _$CotizacionModel {
  int get id;
  int get bodaId;
  String? get archivoAdmin;
  String? get archivoCliente;
  DateTime get createdAt;
  bool? get firmado;

  /// Create a copy of CotizacionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CotizacionModelCopyWith<CotizacionModel> get copyWith =>
      _$CotizacionModelCopyWithImpl<CotizacionModel>(
          this as CotizacionModel, _$identity);

  /// Serializes this CotizacionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CotizacionModel &&
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
    return 'CotizacionModel(id: $id, bodaId: $bodaId, archivoAdmin: $archivoAdmin, archivoCliente: $archivoCliente, createdAt: $createdAt, firmado: $firmado)';
  }
}

/// @nodoc
abstract mixin class $CotizacionModelCopyWith<$Res> {
  factory $CotizacionModelCopyWith(
          CotizacionModel value, $Res Function(CotizacionModel) _then) =
      _$CotizacionModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int bodaId,
      String? archivoAdmin,
      String? archivoCliente,
      DateTime createdAt,
      bool? firmado});
}

/// @nodoc
class _$CotizacionModelCopyWithImpl<$Res>
    implements $CotizacionModelCopyWith<$Res> {
  _$CotizacionModelCopyWithImpl(this._self, this._then);

  final CotizacionModel _self;
  final $Res Function(CotizacionModel) _then;

  /// Create a copy of CotizacionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bodaId = null,
    Object? archivoAdmin = freezed,
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
      archivoAdmin: freezed == archivoAdmin
          ? _self.archivoAdmin
          : archivoAdmin // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _CotizacionModel extends CotizacionModel {
  const _CotizacionModel(
      {required this.id,
      required this.bodaId,
      this.archivoAdmin,
      this.archivoCliente,
      required this.createdAt,
      this.firmado})
      : super._();
  factory _CotizacionModel.fromJson(Map<String, dynamic> json) =>
      _$CotizacionModelFromJson(json);

  @override
  final int id;
  @override
  final int bodaId;
  @override
  final String? archivoAdmin;
  @override
  final String? archivoCliente;
  @override
  final DateTime createdAt;
  @override
  final bool? firmado;

  /// Create a copy of CotizacionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CotizacionModelCopyWith<_CotizacionModel> get copyWith =>
      __$CotizacionModelCopyWithImpl<_CotizacionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CotizacionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CotizacionModel &&
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
    return 'CotizacionModel(id: $id, bodaId: $bodaId, archivoAdmin: $archivoAdmin, archivoCliente: $archivoCliente, createdAt: $createdAt, firmado: $firmado)';
  }
}

/// @nodoc
abstract mixin class _$CotizacionModelCopyWith<$Res>
    implements $CotizacionModelCopyWith<$Res> {
  factory _$CotizacionModelCopyWith(
          _CotizacionModel value, $Res Function(_CotizacionModel) _then) =
      __$CotizacionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int bodaId,
      String? archivoAdmin,
      String? archivoCliente,
      DateTime createdAt,
      bool? firmado});
}

/// @nodoc
class __$CotizacionModelCopyWithImpl<$Res>
    implements _$CotizacionModelCopyWith<$Res> {
  __$CotizacionModelCopyWithImpl(this._self, this._then);

  final _CotizacionModel _self;
  final $Res Function(_CotizacionModel) _then;

  /// Create a copy of CotizacionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? bodaId = null,
    Object? archivoAdmin = freezed,
    Object? archivoCliente = freezed,
    Object? createdAt = null,
    Object? firmado = freezed,
  }) {
    return _then(_CotizacionModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bodaId: null == bodaId
          ? _self.bodaId
          : bodaId // ignore: cast_nullable_to_non_nullable
              as int,
      archivoAdmin: freezed == archivoAdmin
          ? _self.archivoAdmin
          : archivoAdmin // ignore: cast_nullable_to_non_nullable
              as String?,
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

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boda_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BodaEstado {
  int get id;
  String get descripcion;
  bool get isDeleted;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  /// Create a copy of BodaEstado
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BodaEstadoCopyWith<BodaEstado> get copyWith =>
      _$BodaEstadoCopyWithImpl<BodaEstado>(this as BodaEstado, _$identity);

  /// Serializes this BodaEstado to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BodaEstado &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.descripcion, descripcion) ||
                other.descripcion == descripcion) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, descripcion, isDeleted, createdAt, updatedAt);

  @override
  String toString() {
    return 'BodaEstado(id: $id, descripcion: $descripcion, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $BodaEstadoCopyWith<$Res> {
  factory $BodaEstadoCopyWith(
          BodaEstado value, $Res Function(BodaEstado) _then) =
      _$BodaEstadoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String descripcion,
      bool isDeleted,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$BodaEstadoCopyWithImpl<$Res> implements $BodaEstadoCopyWith<$Res> {
  _$BodaEstadoCopyWithImpl(this._self, this._then);

  final BodaEstado _self;
  final $Res Function(BodaEstado) _then;

  /// Create a copy of BodaEstado
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? descripcion = null,
    Object? isDeleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BodaEstado implements BodaEstado {
  const _BodaEstado(
      {required this.id,
      required this.descripcion,
      this.isDeleted = false,
      this.createdAt,
      this.updatedAt});
  factory _BodaEstado.fromJson(Map<String, dynamic> json) =>
      _$BodaEstadoFromJson(json);

  @override
  final int id;
  @override
  final String descripcion;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  /// Create a copy of BodaEstado
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BodaEstadoCopyWith<_BodaEstado> get copyWith =>
      __$BodaEstadoCopyWithImpl<_BodaEstado>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BodaEstadoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BodaEstado &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.descripcion, descripcion) ||
                other.descripcion == descripcion) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, descripcion, isDeleted, createdAt, updatedAt);

  @override
  String toString() {
    return 'BodaEstado(id: $id, descripcion: $descripcion, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$BodaEstadoCopyWith<$Res>
    implements $BodaEstadoCopyWith<$Res> {
  factory _$BodaEstadoCopyWith(
          _BodaEstado value, $Res Function(_BodaEstado) _then) =
      __$BodaEstadoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String descripcion,
      bool isDeleted,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$BodaEstadoCopyWithImpl<$Res> implements _$BodaEstadoCopyWith<$Res> {
  __$BodaEstadoCopyWithImpl(this._self, this._then);

  final _BodaEstado _self;
  final $Res Function(_BodaEstado) _then;

  /// Create a copy of BodaEstado
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? descripcion = null,
    Object? isDeleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_BodaEstado(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      descripcion: null == descripcion
          ? _self.descripcion
          : descripcion // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$BodaTipo {
  int get id;
  String get descripcion;
  bool get isDeleted;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  /// Create a copy of BodaTipo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BodaTipoCopyWith<BodaTipo> get copyWith =>
      _$BodaTipoCopyWithImpl<BodaTipo>(this as BodaTipo, _$identity);

  /// Serializes this BodaTipo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BodaTipo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.descripcion, descripcion) ||
                other.descripcion == descripcion) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, descripcion, isDeleted, createdAt, updatedAt);

  @override
  String toString() {
    return 'BodaTipo(id: $id, descripcion: $descripcion, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $BodaTipoCopyWith<$Res> {
  factory $BodaTipoCopyWith(BodaTipo value, $Res Function(BodaTipo) _then) =
      _$BodaTipoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String descripcion,
      bool isDeleted,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$BodaTipoCopyWithImpl<$Res> implements $BodaTipoCopyWith<$Res> {
  _$BodaTipoCopyWithImpl(this._self, this._then);

  final BodaTipo _self;
  final $Res Function(BodaTipo) _then;

  /// Create a copy of BodaTipo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? descripcion = null,
    Object? isDeleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BodaTipo implements BodaTipo {
  const _BodaTipo(
      {required this.id,
      required this.descripcion,
      this.isDeleted = false,
      this.createdAt,
      this.updatedAt});
  factory _BodaTipo.fromJson(Map<String, dynamic> json) =>
      _$BodaTipoFromJson(json);

  @override
  final int id;
  @override
  final String descripcion;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  /// Create a copy of BodaTipo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BodaTipoCopyWith<_BodaTipo> get copyWith =>
      __$BodaTipoCopyWithImpl<_BodaTipo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BodaTipoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BodaTipo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.descripcion, descripcion) ||
                other.descripcion == descripcion) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, descripcion, isDeleted, createdAt, updatedAt);

  @override
  String toString() {
    return 'BodaTipo(id: $id, descripcion: $descripcion, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$BodaTipoCopyWith<$Res>
    implements $BodaTipoCopyWith<$Res> {
  factory _$BodaTipoCopyWith(_BodaTipo value, $Res Function(_BodaTipo) _then) =
      __$BodaTipoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String descripcion,
      bool isDeleted,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$BodaTipoCopyWithImpl<$Res> implements _$BodaTipoCopyWith<$Res> {
  __$BodaTipoCopyWithImpl(this._self, this._then);

  final _BodaTipo _self;
  final $Res Function(_BodaTipo) _then;

  /// Create a copy of BodaTipo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? descripcion = null,
    Object? isDeleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_BodaTipo(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      descripcion: null == descripcion
          ? _self.descripcion
          : descripcion // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on

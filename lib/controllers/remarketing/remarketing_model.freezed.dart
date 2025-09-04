// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remarketing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemarketingUserModel {
  String get id;
  String get nombre;
  String get email;
  DateTime get fechaCreacion;
  bool get tieneBodaActiva;
  bool? get isSelected;
  String? get bodaId;
  String get mailto;

  /// Create a copy of RemarketingUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemarketingUserModelCopyWith<RemarketingUserModel> get copyWith =>
      _$RemarketingUserModelCopyWithImpl<RemarketingUserModel>(
          this as RemarketingUserModel, _$identity);

  /// Serializes this RemarketingUserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemarketingUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fechaCreacion, fechaCreacion) ||
                other.fechaCreacion == fechaCreacion) &&
            (identical(other.tieneBodaActiva, tieneBodaActiva) ||
                other.tieneBodaActiva == tieneBodaActiva) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.bodaId, bodaId) || other.bodaId == bodaId) &&
            (identical(other.mailto, mailto) || other.mailto == mailto));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nombre, email, fechaCreacion,
      tieneBodaActiva, isSelected, bodaId, mailto);

  @override
  String toString() {
    return 'RemarketingUserModel(id: $id, nombre: $nombre, email: $email, fechaCreacion: $fechaCreacion, tieneBodaActiva: $tieneBodaActiva, isSelected: $isSelected, bodaId: $bodaId, mailto: $mailto)';
  }
}

/// @nodoc
abstract mixin class $RemarketingUserModelCopyWith<$Res> {
  factory $RemarketingUserModelCopyWith(RemarketingUserModel value,
          $Res Function(RemarketingUserModel) _then) =
      _$RemarketingUserModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String nombre,
      String email,
      DateTime fechaCreacion,
      bool tieneBodaActiva,
      bool? isSelected,
      String? bodaId,
      String mailto});
}

/// @nodoc
class _$RemarketingUserModelCopyWithImpl<$Res>
    implements $RemarketingUserModelCopyWith<$Res> {
  _$RemarketingUserModelCopyWithImpl(this._self, this._then);

  final RemarketingUserModel _self;
  final $Res Function(RemarketingUserModel) _then;

  /// Create a copy of RemarketingUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nombre = null,
    Object? email = null,
    Object? fechaCreacion = null,
    Object? tieneBodaActiva = null,
    Object? isSelected = freezed,
    Object? bodaId = freezed,
    Object? mailto = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _self.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fechaCreacion: null == fechaCreacion
          ? _self.fechaCreacion
          : fechaCreacion // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tieneBodaActiva: null == tieneBodaActiva
          ? _self.tieneBodaActiva
          : tieneBodaActiva // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: freezed == isSelected
          ? _self.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      bodaId: freezed == bodaId
          ? _self.bodaId
          : bodaId // ignore: cast_nullable_to_non_nullable
              as String?,
      mailto: null == mailto
          ? _self.mailto
          : mailto // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [RemarketingUserModel].
extension RemarketingUserModelPatterns on RemarketingUserModel {
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
    TResult Function(_RemarketingUserModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemarketingUserModel() when $default != null:
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
    TResult Function(_RemarketingUserModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemarketingUserModel():
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
    TResult? Function(_RemarketingUserModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemarketingUserModel() when $default != null:
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
            String id,
            String nombre,
            String email,
            DateTime fechaCreacion,
            bool tieneBodaActiva,
            bool? isSelected,
            String? bodaId,
            String mailto)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemarketingUserModel() when $default != null:
        return $default(
            _that.id,
            _that.nombre,
            _that.email,
            _that.fechaCreacion,
            _that.tieneBodaActiva,
            _that.isSelected,
            _that.bodaId,
            _that.mailto);
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
            String id,
            String nombre,
            String email,
            DateTime fechaCreacion,
            bool tieneBodaActiva,
            bool? isSelected,
            String? bodaId,
            String mailto)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemarketingUserModel():
        return $default(
            _that.id,
            _that.nombre,
            _that.email,
            _that.fechaCreacion,
            _that.tieneBodaActiva,
            _that.isSelected,
            _that.bodaId,
            _that.mailto);
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
            String id,
            String nombre,
            String email,
            DateTime fechaCreacion,
            bool tieneBodaActiva,
            bool? isSelected,
            String? bodaId,
            String mailto)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemarketingUserModel() when $default != null:
        return $default(
            _that.id,
            _that.nombre,
            _that.email,
            _that.fechaCreacion,
            _that.tieneBodaActiva,
            _that.isSelected,
            _that.bodaId,
            _that.mailto);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RemarketingUserModel implements RemarketingUserModel {
  const _RemarketingUserModel(
      {required this.id,
      required this.nombre,
      required this.email,
      required this.fechaCreacion,
      required this.tieneBodaActiva,
      this.isSelected,
      this.bodaId,
      required this.mailto});
  factory _RemarketingUserModel.fromJson(Map<String, dynamic> json) =>
      _$RemarketingUserModelFromJson(json);

  @override
  final String id;
  @override
  final String nombre;
  @override
  final String email;
  @override
  final DateTime fechaCreacion;
  @override
  final bool tieneBodaActiva;
  @override
  final bool? isSelected;
  @override
  final String? bodaId;
  @override
  final String mailto;

  /// Create a copy of RemarketingUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RemarketingUserModelCopyWith<_RemarketingUserModel> get copyWith =>
      __$RemarketingUserModelCopyWithImpl<_RemarketingUserModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RemarketingUserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemarketingUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fechaCreacion, fechaCreacion) ||
                other.fechaCreacion == fechaCreacion) &&
            (identical(other.tieneBodaActiva, tieneBodaActiva) ||
                other.tieneBodaActiva == tieneBodaActiva) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.bodaId, bodaId) || other.bodaId == bodaId) &&
            (identical(other.mailto, mailto) || other.mailto == mailto));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nombre, email, fechaCreacion,
      tieneBodaActiva, isSelected, bodaId, mailto);

  @override
  String toString() {
    return 'RemarketingUserModel(id: $id, nombre: $nombre, email: $email, fechaCreacion: $fechaCreacion, tieneBodaActiva: $tieneBodaActiva, isSelected: $isSelected, bodaId: $bodaId, mailto: $mailto)';
  }
}

/// @nodoc
abstract mixin class _$RemarketingUserModelCopyWith<$Res>
    implements $RemarketingUserModelCopyWith<$Res> {
  factory _$RemarketingUserModelCopyWith(_RemarketingUserModel value,
          $Res Function(_RemarketingUserModel) _then) =
      __$RemarketingUserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String nombre,
      String email,
      DateTime fechaCreacion,
      bool tieneBodaActiva,
      bool? isSelected,
      String? bodaId,
      String mailto});
}

/// @nodoc
class __$RemarketingUserModelCopyWithImpl<$Res>
    implements _$RemarketingUserModelCopyWith<$Res> {
  __$RemarketingUserModelCopyWithImpl(this._self, this._then);

  final _RemarketingUserModel _self;
  final $Res Function(_RemarketingUserModel) _then;

  /// Create a copy of RemarketingUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nombre = null,
    Object? email = null,
    Object? fechaCreacion = null,
    Object? tieneBodaActiva = null,
    Object? isSelected = freezed,
    Object? bodaId = freezed,
    Object? mailto = null,
  }) {
    return _then(_RemarketingUserModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _self.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fechaCreacion: null == fechaCreacion
          ? _self.fechaCreacion
          : fechaCreacion // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tieneBodaActiva: null == tieneBodaActiva
          ? _self.tieneBodaActiva
          : tieneBodaActiva // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: freezed == isSelected
          ? _self.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      bodaId: freezed == bodaId
          ? _self.bodaId
          : bodaId // ignore: cast_nullable_to_non_nullable
              as String?,
      mailto: null == mailto
          ? _self.mailto
          : mailto // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

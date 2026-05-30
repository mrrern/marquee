// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

/// Adds pattern-matching-related methods to [BodaEstado].
extension BodaEstadoPatterns on BodaEstado {
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
    TResult Function(_BodaEstado value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BodaEstado() when $default != null:
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
    TResult Function(_BodaEstado value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodaEstado():
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
    TResult? Function(_BodaEstado value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodaEstado() when $default != null:
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
    TResult Function(int id, String descripcion, bool isDeleted,
            DateTime? createdAt, DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BodaEstado() when $default != null:
        return $default(_that.id, _that.descripcion, _that.isDeleted,
            _that.createdAt, _that.updatedAt);
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
    TResult Function(int id, String descripcion, bool isDeleted,
            DateTime? createdAt, DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodaEstado():
        return $default(_that.id, _that.descripcion, _that.isDeleted,
            _that.createdAt, _that.updatedAt);
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
    TResult? Function(int id, String descripcion, bool isDeleted,
            DateTime? createdAt, DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodaEstado() when $default != null:
        return $default(_that.id, _that.descripcion, _that.isDeleted,
            _that.createdAt, _that.updatedAt);
      case _:
        return null;
    }
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

/// Adds pattern-matching-related methods to [BodaTipo].
extension BodaTipoPatterns on BodaTipo {
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
    TResult Function(_BodaTipo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BodaTipo() when $default != null:
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
    TResult Function(_BodaTipo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodaTipo():
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
    TResult? Function(_BodaTipo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodaTipo() when $default != null:
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
    TResult Function(int id, String descripcion, bool isDeleted,
            DateTime? createdAt, DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BodaTipo() when $default != null:
        return $default(_that.id, _that.descripcion, _that.isDeleted,
            _that.createdAt, _that.updatedAt);
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
    TResult Function(int id, String descripcion, bool isDeleted,
            DateTime? createdAt, DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodaTipo():
        return $default(_that.id, _that.descripcion, _that.isDeleted,
            _that.createdAt, _that.updatedAt);
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
    TResult? Function(int id, String descripcion, bool isDeleted,
            DateTime? createdAt, DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BodaTipo() when $default != null:
        return $default(_that.id, _that.descripcion, _that.isDeleted,
            _that.createdAt, _that.updatedAt);
      case _:
        return null;
    }
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

/// @nodoc
mixin _$WeddingFormState {
  String get novioNombre;
  String get noviaNombre;
  String get phoneNovio;
  String get phoneNovia;
  String get novioEmail;
  String get noviaEmail;
  String get invitados;
  String get ubicacion;
  DateTime? get novioBirthday;
  DateTime? get noviaBirthday;
  int get selectedBodaTipo;
  bool get isActive;

  /// Create a copy of WeddingFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeddingFormStateCopyWith<WeddingFormState> get copyWith =>
      _$WeddingFormStateCopyWithImpl<WeddingFormState>(
          this as WeddingFormState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeddingFormState &&
            (identical(other.novioNombre, novioNombre) ||
                other.novioNombre == novioNombre) &&
            (identical(other.noviaNombre, noviaNombre) ||
                other.noviaNombre == noviaNombre) &&
            (identical(other.phoneNovio, phoneNovio) ||
                other.phoneNovio == phoneNovio) &&
            (identical(other.phoneNovia, phoneNovia) ||
                other.phoneNovia == phoneNovia) &&
            (identical(other.novioEmail, novioEmail) ||
                other.novioEmail == novioEmail) &&
            (identical(other.noviaEmail, noviaEmail) ||
                other.noviaEmail == noviaEmail) &&
            (identical(other.invitados, invitados) ||
                other.invitados == invitados) &&
            (identical(other.ubicacion, ubicacion) ||
                other.ubicacion == ubicacion) &&
            (identical(other.novioBirthday, novioBirthday) ||
                other.novioBirthday == novioBirthday) &&
            (identical(other.noviaBirthday, noviaBirthday) ||
                other.noviaBirthday == noviaBirthday) &&
            (identical(other.selectedBodaTipo, selectedBodaTipo) ||
                other.selectedBodaTipo == selectedBodaTipo) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      novioNombre,
      noviaNombre,
      phoneNovio,
      phoneNovia,
      novioEmail,
      noviaEmail,
      invitados,
      ubicacion,
      novioBirthday,
      noviaBirthday,
      selectedBodaTipo,
      isActive);

  @override
  String toString() {
    return 'WeddingFormState(novioNombre: $novioNombre, noviaNombre: $noviaNombre, phoneNovio: $phoneNovio, phoneNovia: $phoneNovia, novioEmail: $novioEmail, noviaEmail: $noviaEmail, invitados: $invitados, ubicacion: $ubicacion, novioBirthday: $novioBirthday, noviaBirthday: $noviaBirthday, selectedBodaTipo: $selectedBodaTipo, isActive: $isActive)';
  }
}

/// @nodoc
abstract mixin class $WeddingFormStateCopyWith<$Res> {
  factory $WeddingFormStateCopyWith(
          WeddingFormState value, $Res Function(WeddingFormState) _then) =
      _$WeddingFormStateCopyWithImpl;
  @useResult
  $Res call(
      {String novioNombre,
      String noviaNombre,
      String phoneNovio,
      String phoneNovia,
      String novioEmail,
      String noviaEmail,
      String invitados,
      String ubicacion,
      DateTime? novioBirthday,
      DateTime? noviaBirthday,
      int selectedBodaTipo,
      bool isActive});
}

/// @nodoc
class _$WeddingFormStateCopyWithImpl<$Res>
    implements $WeddingFormStateCopyWith<$Res> {
  _$WeddingFormStateCopyWithImpl(this._self, this._then);

  final WeddingFormState _self;
  final $Res Function(WeddingFormState) _then;

  /// Create a copy of WeddingFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? novioNombre = null,
    Object? noviaNombre = null,
    Object? phoneNovio = null,
    Object? phoneNovia = null,
    Object? novioEmail = null,
    Object? noviaEmail = null,
    Object? invitados = null,
    Object? ubicacion = null,
    Object? novioBirthday = freezed,
    Object? noviaBirthday = freezed,
    Object? selectedBodaTipo = null,
    Object? isActive = null,
  }) {
    return _then(_self.copyWith(
      novioNombre: null == novioNombre
          ? _self.novioNombre
          : novioNombre // ignore: cast_nullable_to_non_nullable
              as String,
      noviaNombre: null == noviaNombre
          ? _self.noviaNombre
          : noviaNombre // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNovio: null == phoneNovio
          ? _self.phoneNovio
          : phoneNovio // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNovia: null == phoneNovia
          ? _self.phoneNovia
          : phoneNovia // ignore: cast_nullable_to_non_nullable
              as String,
      novioEmail: null == novioEmail
          ? _self.novioEmail
          : novioEmail // ignore: cast_nullable_to_non_nullable
              as String,
      noviaEmail: null == noviaEmail
          ? _self.noviaEmail
          : noviaEmail // ignore: cast_nullable_to_non_nullable
              as String,
      invitados: null == invitados
          ? _self.invitados
          : invitados // ignore: cast_nullable_to_non_nullable
              as String,
      ubicacion: null == ubicacion
          ? _self.ubicacion
          : ubicacion // ignore: cast_nullable_to_non_nullable
              as String,
      novioBirthday: freezed == novioBirthday
          ? _self.novioBirthday
          : novioBirthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      noviaBirthday: freezed == noviaBirthday
          ? _self.noviaBirthday
          : noviaBirthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedBodaTipo: null == selectedBodaTipo
          ? _self.selectedBodaTipo
          : selectedBodaTipo // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [WeddingFormState].
extension WeddingFormStatePatterns on WeddingFormState {
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
    TResult Function(_WeddingFormState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeddingFormState() when $default != null:
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
    TResult Function(_WeddingFormState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeddingFormState():
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
    TResult? Function(_WeddingFormState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeddingFormState() when $default != null:
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
            String novioNombre,
            String noviaNombre,
            String phoneNovio,
            String phoneNovia,
            String novioEmail,
            String noviaEmail,
            String invitados,
            String ubicacion,
            DateTime? novioBirthday,
            DateTime? noviaBirthday,
            int selectedBodaTipo,
            bool isActive)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WeddingFormState() when $default != null:
        return $default(
            _that.novioNombre,
            _that.noviaNombre,
            _that.phoneNovio,
            _that.phoneNovia,
            _that.novioEmail,
            _that.noviaEmail,
            _that.invitados,
            _that.ubicacion,
            _that.novioBirthday,
            _that.noviaBirthday,
            _that.selectedBodaTipo,
            _that.isActive);
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
            String novioNombre,
            String noviaNombre,
            String phoneNovio,
            String phoneNovia,
            String novioEmail,
            String noviaEmail,
            String invitados,
            String ubicacion,
            DateTime? novioBirthday,
            DateTime? noviaBirthday,
            int selectedBodaTipo,
            bool isActive)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeddingFormState():
        return $default(
            _that.novioNombre,
            _that.noviaNombre,
            _that.phoneNovio,
            _that.phoneNovia,
            _that.novioEmail,
            _that.noviaEmail,
            _that.invitados,
            _that.ubicacion,
            _that.novioBirthday,
            _that.noviaBirthday,
            _that.selectedBodaTipo,
            _that.isActive);
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
            String novioNombre,
            String noviaNombre,
            String phoneNovio,
            String phoneNovia,
            String novioEmail,
            String noviaEmail,
            String invitados,
            String ubicacion,
            DateTime? novioBirthday,
            DateTime? noviaBirthday,
            int selectedBodaTipo,
            bool isActive)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WeddingFormState() when $default != null:
        return $default(
            _that.novioNombre,
            _that.noviaNombre,
            _that.phoneNovio,
            _that.phoneNovia,
            _that.novioEmail,
            _that.noviaEmail,
            _that.invitados,
            _that.ubicacion,
            _that.novioBirthday,
            _that.noviaBirthday,
            _that.selectedBodaTipo,
            _that.isActive);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WeddingFormState implements WeddingFormState {
  const _WeddingFormState(
      {this.novioNombre = '',
      this.noviaNombre = '',
      this.phoneNovio = '',
      this.phoneNovia = '',
      this.novioEmail = '',
      this.noviaEmail = '',
      this.invitados = '',
      this.ubicacion = '',
      this.novioBirthday,
      this.noviaBirthday,
      this.selectedBodaTipo = 1,
      this.isActive = false});

  @override
  @JsonKey()
  final String novioNombre;
  @override
  @JsonKey()
  final String noviaNombre;
  @override
  @JsonKey()
  final String phoneNovio;
  @override
  @JsonKey()
  final String phoneNovia;
  @override
  @JsonKey()
  final String novioEmail;
  @override
  @JsonKey()
  final String noviaEmail;
  @override
  @JsonKey()
  final String invitados;
  @override
  @JsonKey()
  final String ubicacion;
  @override
  final DateTime? novioBirthday;
  @override
  final DateTime? noviaBirthday;
  @override
  @JsonKey()
  final int selectedBodaTipo;
  @override
  @JsonKey()
  final bool isActive;

  /// Create a copy of WeddingFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeddingFormStateCopyWith<_WeddingFormState> get copyWith =>
      __$WeddingFormStateCopyWithImpl<_WeddingFormState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeddingFormState &&
            (identical(other.novioNombre, novioNombre) ||
                other.novioNombre == novioNombre) &&
            (identical(other.noviaNombre, noviaNombre) ||
                other.noviaNombre == noviaNombre) &&
            (identical(other.phoneNovio, phoneNovio) ||
                other.phoneNovio == phoneNovio) &&
            (identical(other.phoneNovia, phoneNovia) ||
                other.phoneNovia == phoneNovia) &&
            (identical(other.novioEmail, novioEmail) ||
                other.novioEmail == novioEmail) &&
            (identical(other.noviaEmail, noviaEmail) ||
                other.noviaEmail == noviaEmail) &&
            (identical(other.invitados, invitados) ||
                other.invitados == invitados) &&
            (identical(other.ubicacion, ubicacion) ||
                other.ubicacion == ubicacion) &&
            (identical(other.novioBirthday, novioBirthday) ||
                other.novioBirthday == novioBirthday) &&
            (identical(other.noviaBirthday, noviaBirthday) ||
                other.noviaBirthday == noviaBirthday) &&
            (identical(other.selectedBodaTipo, selectedBodaTipo) ||
                other.selectedBodaTipo == selectedBodaTipo) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      novioNombre,
      noviaNombre,
      phoneNovio,
      phoneNovia,
      novioEmail,
      noviaEmail,
      invitados,
      ubicacion,
      novioBirthday,
      noviaBirthday,
      selectedBodaTipo,
      isActive);

  @override
  String toString() {
    return 'WeddingFormState(novioNombre: $novioNombre, noviaNombre: $noviaNombre, phoneNovio: $phoneNovio, phoneNovia: $phoneNovia, novioEmail: $novioEmail, noviaEmail: $noviaEmail, invitados: $invitados, ubicacion: $ubicacion, novioBirthday: $novioBirthday, noviaBirthday: $noviaBirthday, selectedBodaTipo: $selectedBodaTipo, isActive: $isActive)';
  }
}

/// @nodoc
abstract mixin class _$WeddingFormStateCopyWith<$Res>
    implements $WeddingFormStateCopyWith<$Res> {
  factory _$WeddingFormStateCopyWith(
          _WeddingFormState value, $Res Function(_WeddingFormState) _then) =
      __$WeddingFormStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String novioNombre,
      String noviaNombre,
      String phoneNovio,
      String phoneNovia,
      String novioEmail,
      String noviaEmail,
      String invitados,
      String ubicacion,
      DateTime? novioBirthday,
      DateTime? noviaBirthday,
      int selectedBodaTipo,
      bool isActive});
}

/// @nodoc
class __$WeddingFormStateCopyWithImpl<$Res>
    implements _$WeddingFormStateCopyWith<$Res> {
  __$WeddingFormStateCopyWithImpl(this._self, this._then);

  final _WeddingFormState _self;
  final $Res Function(_WeddingFormState) _then;

  /// Create a copy of WeddingFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? novioNombre = null,
    Object? noviaNombre = null,
    Object? phoneNovio = null,
    Object? phoneNovia = null,
    Object? novioEmail = null,
    Object? noviaEmail = null,
    Object? invitados = null,
    Object? ubicacion = null,
    Object? novioBirthday = freezed,
    Object? noviaBirthday = freezed,
    Object? selectedBodaTipo = null,
    Object? isActive = null,
  }) {
    return _then(_WeddingFormState(
      novioNombre: null == novioNombre
          ? _self.novioNombre
          : novioNombre // ignore: cast_nullable_to_non_nullable
              as String,
      noviaNombre: null == noviaNombre
          ? _self.noviaNombre
          : noviaNombre // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNovio: null == phoneNovio
          ? _self.phoneNovio
          : phoneNovio // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNovia: null == phoneNovia
          ? _self.phoneNovia
          : phoneNovia // ignore: cast_nullable_to_non_nullable
              as String,
      novioEmail: null == novioEmail
          ? _self.novioEmail
          : novioEmail // ignore: cast_nullable_to_non_nullable
              as String,
      noviaEmail: null == noviaEmail
          ? _self.noviaEmail
          : noviaEmail // ignore: cast_nullable_to_non_nullable
              as String,
      invitados: null == invitados
          ? _self.invitados
          : invitados // ignore: cast_nullable_to_non_nullable
              as String,
      ubicacion: null == ubicacion
          ? _self.ubicacion
          : ubicacion // ignore: cast_nullable_to_non_nullable
              as String,
      novioBirthday: freezed == novioBirthday
          ? _self.novioBirthday
          : novioBirthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      noviaBirthday: freezed == noviaBirthday
          ? _self.noviaBirthday
          : noviaBirthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedBodaTipo: null == selectedBodaTipo
          ? _self.selectedBodaTipo
          : selectedBodaTipo // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on

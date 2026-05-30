// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {
  String get id;
  String get nombre;
  String get email;
  String get password;
  @JsonKey(name: 'rol_id')
  int get rolId;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.rolId, rolId) || other.rolId == rolId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nombre, email, password, rolId);

  @override
  String toString() {
    return 'UserModel(id: $id, nombre: $nombre, email: $email, password: $password, rolId: $rolId)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String nombre,
      String email,
      String password,
      @JsonKey(name: 'rol_id') int rolId});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nombre = null,
    Object? email = null,
    Object? password = null,
    Object? rolId = null,
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
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      rolId: null == rolId
          ? _self.rolId
          : rolId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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
    TResult Function(_UserModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
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
    TResult Function(_UserModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel():
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
    TResult? Function(_UserModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
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
    TResult Function(String id, String nombre, String email, String password,
            @JsonKey(name: 'rol_id') int rolId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
        return $default(
            _that.id, _that.nombre, _that.email, _that.password, _that.rolId);
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
    TResult Function(String id, String nombre, String email, String password,
            @JsonKey(name: 'rol_id') int rolId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel():
        return $default(
            _that.id, _that.nombre, _that.email, _that.password, _that.rolId);
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
    TResult? Function(String id, String nombre, String email, String password,
            @JsonKey(name: 'rol_id') int rolId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
        return $default(
            _that.id, _that.nombre, _that.email, _that.password, _that.rolId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserModel implements UserModel {
  const _UserModel(
      {required this.id,
      required this.nombre,
      required this.email,
      required this.password,
      @JsonKey(name: 'rol_id') required this.rolId});
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  final String id;
  @override
  final String nombre;
  @override
  final String email;
  @override
  final String password;
  @override
  @JsonKey(name: 'rol_id')
  final int rolId;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.rolId, rolId) || other.rolId == rolId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nombre, email, password, rolId);

  @override
  String toString() {
    return 'UserModel(id: $id, nombre: $nombre, email: $email, password: $password, rolId: $rolId)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) _then) =
      __$UserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String nombre,
      String email,
      String password,
      @JsonKey(name: 'rol_id') int rolId});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nombre = null,
    Object? email = null,
    Object? password = null,
    Object? rolId = null,
  }) {
    return _then(_UserModel(
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
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      rolId: null == rolId
          ? _self.rolId
          : rolId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$UserInfo {
  String get id;
  String get nombre;
  String get email;
  String get rol;
  DateTime? get createdAt;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<UserInfo> get copyWith =>
      _$UserInfoCopyWithImpl<UserInfo>(this as UserInfo, _$identity);

  /// Serializes this UserInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.rol, rol) || other.rol == rol) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nombre, email, rol, createdAt);

  @override
  String toString() {
    return 'UserInfo(id: $id, nombre: $nombre, email: $email, rol: $rol, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) _then) =
      _$UserInfoCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String nombre,
      String email,
      String rol,
      DateTime? createdAt});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res> implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._self, this._then);

  final UserInfo _self;
  final $Res Function(UserInfo) _then;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nombre = null,
    Object? email = null,
    Object? rol = null,
    Object? createdAt = freezed,
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
      rol: null == rol
          ? _self.rol
          : rol // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserInfo].
extension UserInfoPatterns on UserInfo {
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
    TResult Function(_UserInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserInfo() when $default != null:
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
    TResult Function(_UserInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfo():
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
    TResult? Function(_UserInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfo() when $default != null:
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
    TResult Function(String id, String nombre, String email, String rol,
            DateTime? createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserInfo() when $default != null:
        return $default(
            _that.id, _that.nombre, _that.email, _that.rol, _that.createdAt);
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
    TResult Function(String id, String nombre, String email, String rol,
            DateTime? createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfo():
        return $default(
            _that.id, _that.nombre, _that.email, _that.rol, _that.createdAt);
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
    TResult? Function(String id, String nombre, String email, String rol,
            DateTime? createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfo() when $default != null:
        return $default(
            _that.id, _that.nombre, _that.email, _that.rol, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserInfo implements UserInfo {
  const _UserInfo(
      {required this.id,
      required this.nombre,
      required this.email,
      required this.rol,
      this.createdAt});
  factory _UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  @override
  final String id;
  @override
  final String nombre;
  @override
  final String email;
  @override
  final String rol;
  @override
  final DateTime? createdAt;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserInfoCopyWith<_UserInfo> get copyWith =>
      __$UserInfoCopyWithImpl<_UserInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.rol, rol) || other.rol == rol) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nombre, email, rol, createdAt);

  @override
  String toString() {
    return 'UserInfo(id: $id, nombre: $nombre, email: $email, rol: $rol, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$UserInfoCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$UserInfoCopyWith(_UserInfo value, $Res Function(_UserInfo) _then) =
      __$UserInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String nombre,
      String email,
      String rol,
      DateTime? createdAt});
}

/// @nodoc
class __$UserInfoCopyWithImpl<$Res> implements _$UserInfoCopyWith<$Res> {
  __$UserInfoCopyWithImpl(this._self, this._then);

  final _UserInfo _self;
  final $Res Function(_UserInfo) _then;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nombre = null,
    Object? email = null,
    Object? rol = null,
    Object? createdAt = freezed,
  }) {
    return _then(_UserInfo(
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
      rol: null == rol
          ? _self.rol
          : rol // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$Boda {
  int get id;
  @JsonKey(name: 'user_id')
  String get usuarioId;
  DateTime get fecha;
  String get ubicacion;
  double get invitados;
  @JsonKey(name: 'is_active')
  bool get isActive;
  @JsonKey(name: 'estado_boda')
  @EstadoBodaConverter()
  int get estadoId;
  @JsonKey(name: 'tipo_boda')
  @TipoBodaConverter()
  int get bodaTipo;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @JsonKey(name: 'is_deleted')
  bool get isDeleted;
  @JsonKey(name: 'novio_nombre')
  String get novioNombre;
  @JsonKey(name: 'novia_nombre')
  String get noviaNombre;
  @JsonKey(name: 'phone_novio')
  String get phoneNovio;
  @JsonKey(name: 'phone_novia')
  String get phoneNovia;
  @JsonKey(name: 'novio_birthday')
  DateTime get novioBirthday;
  @JsonKey(name: 'novia_birthday')
  DateTime get noviaBirthday;
  @JsonKey(name: 'novio_email')
  String get novioEmail;
  @JsonKey(name: 'novia_email')
  String get noviaEmail;

  /// Create a copy of Boda
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BodaCopyWith<Boda> get copyWith =>
      _$BodaCopyWithImpl<Boda>(this as Boda, _$identity);

  /// Serializes this Boda to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Boda &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.usuarioId, usuarioId) ||
                other.usuarioId == usuarioId) &&
            (identical(other.fecha, fecha) || other.fecha == fecha) &&
            (identical(other.ubicacion, ubicacion) ||
                other.ubicacion == ubicacion) &&
            (identical(other.invitados, invitados) ||
                other.invitados == invitados) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.estadoId, estadoId) ||
                other.estadoId == estadoId) &&
            (identical(other.bodaTipo, bodaTipo) ||
                other.bodaTipo == bodaTipo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.novioNombre, novioNombre) ||
                other.novioNombre == novioNombre) &&
            (identical(other.noviaNombre, noviaNombre) ||
                other.noviaNombre == noviaNombre) &&
            (identical(other.phoneNovio, phoneNovio) ||
                other.phoneNovio == phoneNovio) &&
            (identical(other.phoneNovia, phoneNovia) ||
                other.phoneNovia == phoneNovia) &&
            (identical(other.novioBirthday, novioBirthday) ||
                other.novioBirthday == novioBirthday) &&
            (identical(other.noviaBirthday, noviaBirthday) ||
                other.noviaBirthday == noviaBirthday) &&
            (identical(other.novioEmail, novioEmail) ||
                other.novioEmail == novioEmail) &&
            (identical(other.noviaEmail, noviaEmail) ||
                other.noviaEmail == noviaEmail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        usuarioId,
        fecha,
        ubicacion,
        invitados,
        isActive,
        estadoId,
        bodaTipo,
        createdAt,
        updatedAt,
        isDeleted,
        novioNombre,
        noviaNombre,
        phoneNovio,
        phoneNovia,
        novioBirthday,
        noviaBirthday,
        novioEmail,
        noviaEmail
      ]);

  @override
  String toString() {
    return 'Boda(id: $id, usuarioId: $usuarioId, fecha: $fecha, ubicacion: $ubicacion, invitados: $invitados, isActive: $isActive, estadoId: $estadoId, bodaTipo: $bodaTipo, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, novioNombre: $novioNombre, noviaNombre: $noviaNombre, phoneNovio: $phoneNovio, phoneNovia: $phoneNovia, novioBirthday: $novioBirthday, noviaBirthday: $noviaBirthday, novioEmail: $novioEmail, noviaEmail: $noviaEmail)';
  }
}

/// @nodoc
abstract mixin class $BodaCopyWith<$Res> {
  factory $BodaCopyWith(Boda value, $Res Function(Boda) _then) =
      _$BodaCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') String usuarioId,
      DateTime fecha,
      String ubicacion,
      double invitados,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'estado_boda') @EstadoBodaConverter() int estadoId,
      @JsonKey(name: 'tipo_boda') @TipoBodaConverter() int bodaTipo,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'is_deleted') bool isDeleted,
      @JsonKey(name: 'novio_nombre') String novioNombre,
      @JsonKey(name: 'novia_nombre') String noviaNombre,
      @JsonKey(name: 'phone_novio') String phoneNovio,
      @JsonKey(name: 'phone_novia') String phoneNovia,
      @JsonKey(name: 'novio_birthday') DateTime novioBirthday,
      @JsonKey(name: 'novia_birthday') DateTime noviaBirthday,
      @JsonKey(name: 'novio_email') String novioEmail,
      @JsonKey(name: 'novia_email') String noviaEmail});
}

/// @nodoc
class _$BodaCopyWithImpl<$Res> implements $BodaCopyWith<$Res> {
  _$BodaCopyWithImpl(this._self, this._then);

  final Boda _self;
  final $Res Function(Boda) _then;

  /// Create a copy of Boda
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? usuarioId = null,
    Object? fecha = null,
    Object? ubicacion = null,
    Object? invitados = null,
    Object? isActive = null,
    Object? estadoId = null,
    Object? bodaTipo = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDeleted = null,
    Object? novioNombre = null,
    Object? noviaNombre = null,
    Object? phoneNovio = null,
    Object? phoneNovia = null,
    Object? novioBirthday = null,
    Object? noviaBirthday = null,
    Object? novioEmail = null,
    Object? noviaEmail = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      usuarioId: null == usuarioId
          ? _self.usuarioId
          : usuarioId // ignore: cast_nullable_to_non_nullable
              as String,
      fecha: null == fecha
          ? _self.fecha
          : fecha // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ubicacion: null == ubicacion
          ? _self.ubicacion
          : ubicacion // ignore: cast_nullable_to_non_nullable
              as String,
      invitados: null == invitados
          ? _self.invitados
          : invitados // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      estadoId: null == estadoId
          ? _self.estadoId
          : estadoId // ignore: cast_nullable_to_non_nullable
              as int,
      bodaTipo: null == bodaTipo
          ? _self.bodaTipo
          : bodaTipo // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
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
      novioBirthday: null == novioBirthday
          ? _self.novioBirthday
          : novioBirthday // ignore: cast_nullable_to_non_nullable
              as DateTime,
      noviaBirthday: null == noviaBirthday
          ? _self.noviaBirthday
          : noviaBirthday // ignore: cast_nullable_to_non_nullable
              as DateTime,
      novioEmail: null == novioEmail
          ? _self.novioEmail
          : novioEmail // ignore: cast_nullable_to_non_nullable
              as String,
      noviaEmail: null == noviaEmail
          ? _self.noviaEmail
          : noviaEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Boda].
extension BodaPatterns on Boda {
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
    TResult Function(_Boda value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Boda() when $default != null:
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
    TResult Function(_Boda value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Boda():
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
    TResult? Function(_Boda value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Boda() when $default != null:
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
            @JsonKey(name: 'user_id') String usuarioId,
            DateTime fecha,
            String ubicacion,
            double invitados,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'estado_boda') @EstadoBodaConverter() int estadoId,
            @JsonKey(name: 'tipo_boda') @TipoBodaConverter() int bodaTipo,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            @JsonKey(name: 'is_deleted') bool isDeleted,
            @JsonKey(name: 'novio_nombre') String novioNombre,
            @JsonKey(name: 'novia_nombre') String noviaNombre,
            @JsonKey(name: 'phone_novio') String phoneNovio,
            @JsonKey(name: 'phone_novia') String phoneNovia,
            @JsonKey(name: 'novio_birthday') DateTime novioBirthday,
            @JsonKey(name: 'novia_birthday') DateTime noviaBirthday,
            @JsonKey(name: 'novio_email') String novioEmail,
            @JsonKey(name: 'novia_email') String noviaEmail)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Boda() when $default != null:
        return $default(
            _that.id,
            _that.usuarioId,
            _that.fecha,
            _that.ubicacion,
            _that.invitados,
            _that.isActive,
            _that.estadoId,
            _that.bodaTipo,
            _that.createdAt,
            _that.updatedAt,
            _that.isDeleted,
            _that.novioNombre,
            _that.noviaNombre,
            _that.phoneNovio,
            _that.phoneNovia,
            _that.novioBirthday,
            _that.noviaBirthday,
            _that.novioEmail,
            _that.noviaEmail);
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
            @JsonKey(name: 'user_id') String usuarioId,
            DateTime fecha,
            String ubicacion,
            double invitados,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'estado_boda') @EstadoBodaConverter() int estadoId,
            @JsonKey(name: 'tipo_boda') @TipoBodaConverter() int bodaTipo,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            @JsonKey(name: 'is_deleted') bool isDeleted,
            @JsonKey(name: 'novio_nombre') String novioNombre,
            @JsonKey(name: 'novia_nombre') String noviaNombre,
            @JsonKey(name: 'phone_novio') String phoneNovio,
            @JsonKey(name: 'phone_novia') String phoneNovia,
            @JsonKey(name: 'novio_birthday') DateTime novioBirthday,
            @JsonKey(name: 'novia_birthday') DateTime noviaBirthday,
            @JsonKey(name: 'novio_email') String novioEmail,
            @JsonKey(name: 'novia_email') String noviaEmail)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Boda():
        return $default(
            _that.id,
            _that.usuarioId,
            _that.fecha,
            _that.ubicacion,
            _that.invitados,
            _that.isActive,
            _that.estadoId,
            _that.bodaTipo,
            _that.createdAt,
            _that.updatedAt,
            _that.isDeleted,
            _that.novioNombre,
            _that.noviaNombre,
            _that.phoneNovio,
            _that.phoneNovia,
            _that.novioBirthday,
            _that.noviaBirthday,
            _that.novioEmail,
            _that.noviaEmail);
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
            @JsonKey(name: 'user_id') String usuarioId,
            DateTime fecha,
            String ubicacion,
            double invitados,
            @JsonKey(name: 'is_active') bool isActive,
            @JsonKey(name: 'estado_boda') @EstadoBodaConverter() int estadoId,
            @JsonKey(name: 'tipo_boda') @TipoBodaConverter() int bodaTipo,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            @JsonKey(name: 'is_deleted') bool isDeleted,
            @JsonKey(name: 'novio_nombre') String novioNombre,
            @JsonKey(name: 'novia_nombre') String noviaNombre,
            @JsonKey(name: 'phone_novio') String phoneNovio,
            @JsonKey(name: 'phone_novia') String phoneNovia,
            @JsonKey(name: 'novio_birthday') DateTime novioBirthday,
            @JsonKey(name: 'novia_birthday') DateTime noviaBirthday,
            @JsonKey(name: 'novio_email') String novioEmail,
            @JsonKey(name: 'novia_email') String noviaEmail)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Boda() when $default != null:
        return $default(
            _that.id,
            _that.usuarioId,
            _that.fecha,
            _that.ubicacion,
            _that.invitados,
            _that.isActive,
            _that.estadoId,
            _that.bodaTipo,
            _that.createdAt,
            _that.updatedAt,
            _that.isDeleted,
            _that.novioNombre,
            _that.noviaNombre,
            _that.phoneNovio,
            _that.phoneNovia,
            _that.novioBirthday,
            _that.noviaBirthday,
            _that.novioEmail,
            _that.noviaEmail);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Boda extends Boda {
  const _Boda(
      {required this.id,
      @JsonKey(name: 'user_id') required this.usuarioId,
      required this.fecha,
      required this.ubicacion,
      required this.invitados,
      @JsonKey(name: 'is_active') this.isActive = false,
      @JsonKey(name: 'estado_boda')
      @EstadoBodaConverter()
      required this.estadoId,
      @JsonKey(name: 'tipo_boda') @TipoBodaConverter() required this.bodaTipo,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'is_deleted') this.isDeleted = false,
      @JsonKey(name: 'novio_nombre') required this.novioNombre,
      @JsonKey(name: 'novia_nombre') required this.noviaNombre,
      @JsonKey(name: 'phone_novio') required this.phoneNovio,
      @JsonKey(name: 'phone_novia') required this.phoneNovia,
      @JsonKey(name: 'novio_birthday') required this.novioBirthday,
      @JsonKey(name: 'novia_birthday') required this.noviaBirthday,
      @JsonKey(name: 'novio_email') required this.novioEmail,
      @JsonKey(name: 'novia_email') required this.noviaEmail})
      : super._();
  factory _Boda.fromJson(Map<String, dynamic> json) => _$BodaFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final String usuarioId;
  @override
  final DateTime fecha;
  @override
  final String ubicacion;
  @override
  final double invitados;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'estado_boda')
  @EstadoBodaConverter()
  final int estadoId;
  @override
  @JsonKey(name: 'tipo_boda')
  @TipoBodaConverter()
  final int bodaTipo;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;
  @override
  @JsonKey(name: 'novio_nombre')
  final String novioNombre;
  @override
  @JsonKey(name: 'novia_nombre')
  final String noviaNombre;
  @override
  @JsonKey(name: 'phone_novio')
  final String phoneNovio;
  @override
  @JsonKey(name: 'phone_novia')
  final String phoneNovia;
  @override
  @JsonKey(name: 'novio_birthday')
  final DateTime novioBirthday;
  @override
  @JsonKey(name: 'novia_birthday')
  final DateTime noviaBirthday;
  @override
  @JsonKey(name: 'novio_email')
  final String novioEmail;
  @override
  @JsonKey(name: 'novia_email')
  final String noviaEmail;

  /// Create a copy of Boda
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BodaCopyWith<_Boda> get copyWith =>
      __$BodaCopyWithImpl<_Boda>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BodaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Boda &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.usuarioId, usuarioId) ||
                other.usuarioId == usuarioId) &&
            (identical(other.fecha, fecha) || other.fecha == fecha) &&
            (identical(other.ubicacion, ubicacion) ||
                other.ubicacion == ubicacion) &&
            (identical(other.invitados, invitados) ||
                other.invitados == invitados) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.estadoId, estadoId) ||
                other.estadoId == estadoId) &&
            (identical(other.bodaTipo, bodaTipo) ||
                other.bodaTipo == bodaTipo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.novioNombre, novioNombre) ||
                other.novioNombre == novioNombre) &&
            (identical(other.noviaNombre, noviaNombre) ||
                other.noviaNombre == noviaNombre) &&
            (identical(other.phoneNovio, phoneNovio) ||
                other.phoneNovio == phoneNovio) &&
            (identical(other.phoneNovia, phoneNovia) ||
                other.phoneNovia == phoneNovia) &&
            (identical(other.novioBirthday, novioBirthday) ||
                other.novioBirthday == novioBirthday) &&
            (identical(other.noviaBirthday, noviaBirthday) ||
                other.noviaBirthday == noviaBirthday) &&
            (identical(other.novioEmail, novioEmail) ||
                other.novioEmail == novioEmail) &&
            (identical(other.noviaEmail, noviaEmail) ||
                other.noviaEmail == noviaEmail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        usuarioId,
        fecha,
        ubicacion,
        invitados,
        isActive,
        estadoId,
        bodaTipo,
        createdAt,
        updatedAt,
        isDeleted,
        novioNombre,
        noviaNombre,
        phoneNovio,
        phoneNovia,
        novioBirthday,
        noviaBirthday,
        novioEmail,
        noviaEmail
      ]);

  @override
  String toString() {
    return 'Boda(id: $id, usuarioId: $usuarioId, fecha: $fecha, ubicacion: $ubicacion, invitados: $invitados, isActive: $isActive, estadoId: $estadoId, bodaTipo: $bodaTipo, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, novioNombre: $novioNombre, noviaNombre: $noviaNombre, phoneNovio: $phoneNovio, phoneNovia: $phoneNovia, novioBirthday: $novioBirthday, noviaBirthday: $noviaBirthday, novioEmail: $novioEmail, noviaEmail: $noviaEmail)';
  }
}

/// @nodoc
abstract mixin class _$BodaCopyWith<$Res> implements $BodaCopyWith<$Res> {
  factory _$BodaCopyWith(_Boda value, $Res Function(_Boda) _then) =
      __$BodaCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') String usuarioId,
      DateTime fecha,
      String ubicacion,
      double invitados,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'estado_boda') @EstadoBodaConverter() int estadoId,
      @JsonKey(name: 'tipo_boda') @TipoBodaConverter() int bodaTipo,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'is_deleted') bool isDeleted,
      @JsonKey(name: 'novio_nombre') String novioNombre,
      @JsonKey(name: 'novia_nombre') String noviaNombre,
      @JsonKey(name: 'phone_novio') String phoneNovio,
      @JsonKey(name: 'phone_novia') String phoneNovia,
      @JsonKey(name: 'novio_birthday') DateTime novioBirthday,
      @JsonKey(name: 'novia_birthday') DateTime noviaBirthday,
      @JsonKey(name: 'novio_email') String novioEmail,
      @JsonKey(name: 'novia_email') String noviaEmail});
}

/// @nodoc
class __$BodaCopyWithImpl<$Res> implements _$BodaCopyWith<$Res> {
  __$BodaCopyWithImpl(this._self, this._then);

  final _Boda _self;
  final $Res Function(_Boda) _then;

  /// Create a copy of Boda
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? usuarioId = null,
    Object? fecha = null,
    Object? ubicacion = null,
    Object? invitados = null,
    Object? isActive = null,
    Object? estadoId = null,
    Object? bodaTipo = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDeleted = null,
    Object? novioNombre = null,
    Object? noviaNombre = null,
    Object? phoneNovio = null,
    Object? phoneNovia = null,
    Object? novioBirthday = null,
    Object? noviaBirthday = null,
    Object? novioEmail = null,
    Object? noviaEmail = null,
  }) {
    return _then(_Boda(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      usuarioId: null == usuarioId
          ? _self.usuarioId
          : usuarioId // ignore: cast_nullable_to_non_nullable
              as String,
      fecha: null == fecha
          ? _self.fecha
          : fecha // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ubicacion: null == ubicacion
          ? _self.ubicacion
          : ubicacion // ignore: cast_nullable_to_non_nullable
              as String,
      invitados: null == invitados
          ? _self.invitados
          : invitados // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      estadoId: null == estadoId
          ? _self.estadoId
          : estadoId // ignore: cast_nullable_to_non_nullable
              as int,
      bodaTipo: null == bodaTipo
          ? _self.bodaTipo
          : bodaTipo // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
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
      novioBirthday: null == novioBirthday
          ? _self.novioBirthday
          : novioBirthday // ignore: cast_nullable_to_non_nullable
              as DateTime,
      noviaBirthday: null == noviaBirthday
          ? _self.noviaBirthday
          : noviaBirthday // ignore: cast_nullable_to_non_nullable
              as DateTime,
      novioEmail: null == novioEmail
          ? _self.novioEmail
          : novioEmail // ignore: cast_nullable_to_non_nullable
              as String,
      noviaEmail: null == noviaEmail
          ? _self.noviaEmail
          : noviaEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$PaginateUserState {
  List<UserInfo> get allUsers;
  List<UserInfo> get currentPageUsers;
  int get currentPage;
  int get totalPages;
  int get itemsPerPage;
  bool get isLoading;
  String? get errorMessage;

  /// Create a copy of PaginateUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginateUserStateCopyWith<PaginateUserState> get copyWith =>
      _$PaginateUserStateCopyWithImpl<PaginateUserState>(
          this as PaginateUserState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginateUserState &&
            const DeepCollectionEquality().equals(other.allUsers, allUsers) &&
            const DeepCollectionEquality()
                .equals(other.currentPageUsers, currentPageUsers) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(allUsers),
      const DeepCollectionEquality().hash(currentPageUsers),
      currentPage,
      totalPages,
      itemsPerPage,
      isLoading,
      errorMessage);

  @override
  String toString() {
    return 'PaginateUserState(allUsers: $allUsers, currentPageUsers: $currentPageUsers, currentPage: $currentPage, totalPages: $totalPages, itemsPerPage: $itemsPerPage, isLoading: $isLoading, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $PaginateUserStateCopyWith<$Res> {
  factory $PaginateUserStateCopyWith(
          PaginateUserState value, $Res Function(PaginateUserState) _then) =
      _$PaginateUserStateCopyWithImpl;
  @useResult
  $Res call(
      {List<UserInfo> allUsers,
      List<UserInfo> currentPageUsers,
      int currentPage,
      int totalPages,
      int itemsPerPage,
      bool isLoading,
      String? errorMessage});
}

/// @nodoc
class _$PaginateUserStateCopyWithImpl<$Res>
    implements $PaginateUserStateCopyWith<$Res> {
  _$PaginateUserStateCopyWithImpl(this._self, this._then);

  final PaginateUserState _self;
  final $Res Function(PaginateUserState) _then;

  /// Create a copy of PaginateUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allUsers = null,
    Object? currentPageUsers = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? itemsPerPage = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      allUsers: null == allUsers
          ? _self.allUsers
          : allUsers // ignore: cast_nullable_to_non_nullable
              as List<UserInfo>,
      currentPageUsers: null == currentPageUsers
          ? _self.currentPageUsers
          : currentPageUsers // ignore: cast_nullable_to_non_nullable
              as List<UserInfo>,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _self.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PaginateUserState].
extension PaginateUserStatePatterns on PaginateUserState {
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
    TResult Function(_PaginateUserState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginateUserState() when $default != null:
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
    TResult Function(_PaginateUserState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginateUserState():
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
    TResult? Function(_PaginateUserState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginateUserState() when $default != null:
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
            List<UserInfo> allUsers,
            List<UserInfo> currentPageUsers,
            int currentPage,
            int totalPages,
            int itemsPerPage,
            bool isLoading,
            String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginateUserState() when $default != null:
        return $default(
            _that.allUsers,
            _that.currentPageUsers,
            _that.currentPage,
            _that.totalPages,
            _that.itemsPerPage,
            _that.isLoading,
            _that.errorMessage);
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
            List<UserInfo> allUsers,
            List<UserInfo> currentPageUsers,
            int currentPage,
            int totalPages,
            int itemsPerPage,
            bool isLoading,
            String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginateUserState():
        return $default(
            _that.allUsers,
            _that.currentPageUsers,
            _that.currentPage,
            _that.totalPages,
            _that.itemsPerPage,
            _that.isLoading,
            _that.errorMessage);
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
            List<UserInfo> allUsers,
            List<UserInfo> currentPageUsers,
            int currentPage,
            int totalPages,
            int itemsPerPage,
            bool isLoading,
            String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginateUserState() when $default != null:
        return $default(
            _that.allUsers,
            _that.currentPageUsers,
            _that.currentPage,
            _that.totalPages,
            _that.itemsPerPage,
            _that.isLoading,
            _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PaginateUserState implements PaginateUserState {
  const _PaginateUserState(
      {final List<UserInfo> allUsers = const [],
      final List<UserInfo> currentPageUsers = const [],
      this.currentPage = 1,
      this.totalPages = 1,
      this.itemsPerPage = 10,
      this.isLoading = false,
      this.errorMessage})
      : _allUsers = allUsers,
        _currentPageUsers = currentPageUsers;

  final List<UserInfo> _allUsers;
  @override
  @JsonKey()
  List<UserInfo> get allUsers {
    if (_allUsers is EqualUnmodifiableListView) return _allUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allUsers);
  }

  final List<UserInfo> _currentPageUsers;
  @override
  @JsonKey()
  List<UserInfo> get currentPageUsers {
    if (_currentPageUsers is EqualUnmodifiableListView)
      return _currentPageUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentPageUsers);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int totalPages;
  @override
  @JsonKey()
  final int itemsPerPage;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  /// Create a copy of PaginateUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaginateUserStateCopyWith<_PaginateUserState> get copyWith =>
      __$PaginateUserStateCopyWithImpl<_PaginateUserState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginateUserState &&
            const DeepCollectionEquality().equals(other._allUsers, _allUsers) &&
            const DeepCollectionEquality()
                .equals(other._currentPageUsers, _currentPageUsers) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allUsers),
      const DeepCollectionEquality().hash(_currentPageUsers),
      currentPage,
      totalPages,
      itemsPerPage,
      isLoading,
      errorMessage);

  @override
  String toString() {
    return 'PaginateUserState(allUsers: $allUsers, currentPageUsers: $currentPageUsers, currentPage: $currentPage, totalPages: $totalPages, itemsPerPage: $itemsPerPage, isLoading: $isLoading, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$PaginateUserStateCopyWith<$Res>
    implements $PaginateUserStateCopyWith<$Res> {
  factory _$PaginateUserStateCopyWith(
          _PaginateUserState value, $Res Function(_PaginateUserState) _then) =
      __$PaginateUserStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<UserInfo> allUsers,
      List<UserInfo> currentPageUsers,
      int currentPage,
      int totalPages,
      int itemsPerPage,
      bool isLoading,
      String? errorMessage});
}

/// @nodoc
class __$PaginateUserStateCopyWithImpl<$Res>
    implements _$PaginateUserStateCopyWith<$Res> {
  __$PaginateUserStateCopyWithImpl(this._self, this._then);

  final _PaginateUserState _self;
  final $Res Function(_PaginateUserState) _then;

  /// Create a copy of PaginateUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? allUsers = null,
    Object? currentPageUsers = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? itemsPerPage = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_PaginateUserState(
      allUsers: null == allUsers
          ? _self._allUsers
          : allUsers // ignore: cast_nullable_to_non_nullable
              as List<UserInfo>,
      currentPageUsers: null == currentPageUsers
          ? _self._currentPageUsers
          : currentPageUsers // ignore: cast_nullable_to_non_nullable
              as List<UserInfo>,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _self.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

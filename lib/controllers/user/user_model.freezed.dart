// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
  List<Boda> get bodas;

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
            (identical(other.rolId, rolId) || other.rolId == rolId) &&
            const DeepCollectionEquality().equals(other.bodas, bodas));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nombre, email, password,
      rolId, const DeepCollectionEquality().hash(bodas));

  @override
  String toString() {
    return 'UserModel(id: $id, nombre: $nombre, email: $email, password: $password, rolId: $rolId, bodas: $bodas)';
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
      @JsonKey(name: 'rol_id') int rolId,
      List<Boda> bodas});
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
    Object? bodas = null,
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
      bodas: null == bodas
          ? _self.bodas
          : bodas // ignore: cast_nullable_to_non_nullable
              as List<Boda>,
    ));
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
      @JsonKey(name: 'rol_id') required this.rolId,
      final List<Boda> bodas = const []})
      : _bodas = bodas;
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
  final List<Boda> _bodas;
  @override
  @JsonKey()
  List<Boda> get bodas {
    if (_bodas is EqualUnmodifiableListView) return _bodas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bodas);
  }

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
            (identical(other.rolId, rolId) || other.rolId == rolId) &&
            const DeepCollectionEquality().equals(other._bodas, _bodas));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nombre, email, password,
      rolId, const DeepCollectionEquality().hash(_bodas));

  @override
  String toString() {
    return 'UserModel(id: $id, nombre: $nombre, email: $email, password: $password, rolId: $rolId, bodas: $bodas)';
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
      @JsonKey(name: 'rol_id') int rolId,
      List<Boda> bodas});
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
    Object? bodas = null,
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
      bodas: null == bodas
          ? _self._bodas
          : bodas // ignore: cast_nullable_to_non_nullable
              as List<Boda>,
    ));
  }
}

/// @nodoc
mixin _$UserInfo {
  String get id;
  String get nombre;
  String get email;
  String get rol;
  List<Boda> get bodas;

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
            const DeepCollectionEquality().equals(other.bodas, bodas));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nombre, email, rol,
      const DeepCollectionEquality().hash(bodas));

  @override
  String toString() {
    return 'UserInfo(id: $id, nombre: $nombre, email: $email, rol: $rol, bodas: $bodas)';
  }
}

/// @nodoc
abstract mixin class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) _then) =
      _$UserInfoCopyWithImpl;
  @useResult
  $Res call(
      {String id, String nombre, String email, String rol, List<Boda> bodas});
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
    Object? bodas = null,
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
      bodas: null == bodas
          ? _self.bodas
          : bodas // ignore: cast_nullable_to_non_nullable
              as List<Boda>,
    ));
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
      final List<Boda> bodas = const []})
      : _bodas = bodas;
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
  final List<Boda> _bodas;
  @override
  @JsonKey()
  List<Boda> get bodas {
    if (_bodas is EqualUnmodifiableListView) return _bodas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bodas);
  }

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
            const DeepCollectionEquality().equals(other._bodas, _bodas));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nombre, email, rol,
      const DeepCollectionEquality().hash(_bodas));

  @override
  String toString() {
    return 'UserInfo(id: $id, nombre: $nombre, email: $email, rol: $rol, bodas: $bodas)';
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
      {String id, String nombre, String email, String rol, List<Boda> bodas});
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
    Object? bodas = null,
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
      bodas: null == bodas
          ? _self._bodas
          : bodas // ignore: cast_nullable_to_non_nullable
              as List<Boda>,
    ));
  }
}

/// @nodoc
mixin _$Boda {
  int get id;
  String get usuarioId;
  DateTime get fecha;
  String get ubicacion;
  double get invitados;
  String get estadoId;
  int get bodaTipo;
  DateTime get createdAt;
  DateTime get updatedAt;
  bool get isDeleted;
  String get novioNombre;
  String get noviaNombre;
  String get phoneNovio;
  String get phoneNovia;
  DateTime get novioBirthday;
  DateTime get noviaBirthday;
  String get novioEmail;
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
  int get hashCode => Object.hash(
      runtimeType,
      id,
      usuarioId,
      fecha,
      ubicacion,
      invitados,
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
      noviaEmail);

  @override
  String toString() {
    return 'Boda(id: $id, usuarioId: $usuarioId, fecha: $fecha, ubicacion: $ubicacion, invitados: $invitados, estadoId: $estadoId, bodaTipo: $bodaTipo, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, novioNombre: $novioNombre, noviaNombre: $noviaNombre, phoneNovio: $phoneNovio, phoneNovia: $phoneNovia, novioBirthday: $novioBirthday, noviaBirthday: $noviaBirthday, novioEmail: $novioEmail, noviaEmail: $noviaEmail)';
  }
}

/// @nodoc
abstract mixin class $BodaCopyWith<$Res> {
  factory $BodaCopyWith(Boda value, $Res Function(Boda) _then) =
      _$BodaCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String usuarioId,
      DateTime fecha,
      String ubicacion,
      double invitados,
      String estadoId,
      int bodaTipo,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDeleted,
      String novioNombre,
      String noviaNombre,
      String phoneNovio,
      String phoneNovia,
      DateTime novioBirthday,
      DateTime noviaBirthday,
      String novioEmail,
      String noviaEmail});
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
      estadoId: null == estadoId
          ? _self.estadoId
          : estadoId // ignore: cast_nullable_to_non_nullable
              as String,
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
@JsonSerializable()
class _Boda extends Boda {
  const _Boda(
      {required this.id,
      required this.usuarioId,
      required this.fecha,
      required this.ubicacion,
      required this.invitados,
      required this.estadoId,
      required this.bodaTipo,
      required this.createdAt,
      required this.updatedAt,
      this.isDeleted = false,
      required this.novioNombre,
      required this.noviaNombre,
      required this.phoneNovio,
      required this.phoneNovia,
      required this.novioBirthday,
      required this.noviaBirthday,
      required this.novioEmail,
      required this.noviaEmail})
      : super._();
  factory _Boda.fromJson(Map<String, dynamic> json) => _$BodaFromJson(json);

  @override
  final int id;
  @override
  final String usuarioId;
  @override
  final DateTime fecha;
  @override
  final String ubicacion;
  @override
  final double invitados;
  @override
  final String estadoId;
  @override
  final int bodaTipo;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  final String novioNombre;
  @override
  final String noviaNombre;
  @override
  final String phoneNovio;
  @override
  final String phoneNovia;
  @override
  final DateTime novioBirthday;
  @override
  final DateTime noviaBirthday;
  @override
  final String novioEmail;
  @override
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
  int get hashCode => Object.hash(
      runtimeType,
      id,
      usuarioId,
      fecha,
      ubicacion,
      invitados,
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
      noviaEmail);

  @override
  String toString() {
    return 'Boda(id: $id, usuarioId: $usuarioId, fecha: $fecha, ubicacion: $ubicacion, invitados: $invitados, estadoId: $estadoId, bodaTipo: $bodaTipo, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, novioNombre: $novioNombre, noviaNombre: $noviaNombre, phoneNovio: $phoneNovio, phoneNovia: $phoneNovia, novioBirthday: $novioBirthday, noviaBirthday: $noviaBirthday, novioEmail: $novioEmail, noviaEmail: $noviaEmail)';
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
      String usuarioId,
      DateTime fecha,
      String ubicacion,
      double invitados,
      String estadoId,
      int bodaTipo,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDeleted,
      String novioNombre,
      String noviaNombre,
      String phoneNovio,
      String phoneNovia,
      DateTime novioBirthday,
      DateTime noviaBirthday,
      String novioEmail,
      String noviaEmail});
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
      estadoId: null == estadoId
          ? _self.estadoId
          : estadoId // ignore: cast_nullable_to_non_nullable
              as String,
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

// dart format on

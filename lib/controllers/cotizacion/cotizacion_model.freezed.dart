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

/// @nodoc
mixin _$CotizacionState {
  List<CotizacionModel> get cotizaciones;
  bool get isLoading;
  bool get hasNextPage;
  int get currentPage;
  String? get errorMessage;

  /// Create a copy of CotizacionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CotizacionStateCopyWith<CotizacionState> get copyWith =>
      _$CotizacionStateCopyWithImpl<CotizacionState>(
          this as CotizacionState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CotizacionState &&
            const DeepCollectionEquality()
                .equals(other.cotizaciones, cotizaciones) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cotizaciones),
      isLoading,
      hasNextPage,
      currentPage,
      errorMessage);

  @override
  String toString() {
    return 'CotizacionState(cotizaciones: $cotizaciones, isLoading: $isLoading, hasNextPage: $hasNextPage, currentPage: $currentPage, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $CotizacionStateCopyWith<$Res> {
  factory $CotizacionStateCopyWith(
          CotizacionState value, $Res Function(CotizacionState) _then) =
      _$CotizacionStateCopyWithImpl;
  @useResult
  $Res call(
      {List<CotizacionModel> cotizaciones,
      bool isLoading,
      bool hasNextPage,
      int currentPage,
      String? errorMessage});
}

/// @nodoc
class _$CotizacionStateCopyWithImpl<$Res>
    implements $CotizacionStateCopyWith<$Res> {
  _$CotizacionStateCopyWithImpl(this._self, this._then);

  final CotizacionState _self;
  final $Res Function(CotizacionState) _then;

  /// Create a copy of CotizacionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cotizaciones = null,
    Object? isLoading = null,
    Object? hasNextPage = null,
    Object? currentPage = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      cotizaciones: null == cotizaciones
          ? _self.cotizaciones
          : cotizaciones // ignore: cast_nullable_to_non_nullable
              as List<CotizacionModel>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _self.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _CotizacionState implements CotizacionState {
  const _CotizacionState(
      {final List<CotizacionModel> cotizaciones = const [],
      this.isLoading = false,
      this.hasNextPage = false,
      this.currentPage = 1,
      this.errorMessage})
      : _cotizaciones = cotizaciones;

  final List<CotizacionModel> _cotizaciones;
  @override
  @JsonKey()
  List<CotizacionModel> get cotizaciones {
    if (_cotizaciones is EqualUnmodifiableListView) return _cotizaciones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cotizaciones);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasNextPage;
  @override
  @JsonKey()
  final int currentPage;
  @override
  final String? errorMessage;

  /// Create a copy of CotizacionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CotizacionStateCopyWith<_CotizacionState> get copyWith =>
      __$CotizacionStateCopyWithImpl<_CotizacionState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CotizacionState &&
            const DeepCollectionEquality()
                .equals(other._cotizaciones, _cotizaciones) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cotizaciones),
      isLoading,
      hasNextPage,
      currentPage,
      errorMessage);

  @override
  String toString() {
    return 'CotizacionState(cotizaciones: $cotizaciones, isLoading: $isLoading, hasNextPage: $hasNextPage, currentPage: $currentPage, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$CotizacionStateCopyWith<$Res>
    implements $CotizacionStateCopyWith<$Res> {
  factory _$CotizacionStateCopyWith(
          _CotizacionState value, $Res Function(_CotizacionState) _then) =
      __$CotizacionStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<CotizacionModel> cotizaciones,
      bool isLoading,
      bool hasNextPage,
      int currentPage,
      String? errorMessage});
}

/// @nodoc
class __$CotizacionStateCopyWithImpl<$Res>
    implements _$CotizacionStateCopyWith<$Res> {
  __$CotizacionStateCopyWithImpl(this._self, this._then);

  final _CotizacionState _self;
  final $Res Function(_CotizacionState) _then;

  /// Create a copy of CotizacionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cotizaciones = null,
    Object? isLoading = null,
    Object? hasNextPage = null,
    Object? currentPage = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_CotizacionState(
      cotizaciones: null == cotizaciones
          ? _self._cotizaciones
          : cotizaciones // ignore: cast_nullable_to_non_nullable
              as List<CotizacionModel>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _self.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

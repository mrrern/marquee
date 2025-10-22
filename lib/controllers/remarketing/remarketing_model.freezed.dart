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
mixin _$RemarketingPagination {
  int get page;
  int get pageSize;
  int get totalItems;

  /// Create a copy of RemarketingPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemarketingPaginationCopyWith<RemarketingPagination> get copyWith =>
      _$RemarketingPaginationCopyWithImpl<RemarketingPagination>(
          this as RemarketingPagination, _$identity);

  /// Serializes this RemarketingPagination to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemarketingPagination &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, pageSize, totalItems);

  @override
  String toString() {
    return 'RemarketingPagination(page: $page, pageSize: $pageSize, totalItems: $totalItems)';
  }
}

/// @nodoc
abstract mixin class $RemarketingPaginationCopyWith<$Res> {
  factory $RemarketingPaginationCopyWith(RemarketingPagination value,
          $Res Function(RemarketingPagination) _then) =
      _$RemarketingPaginationCopyWithImpl;
  @useResult
  $Res call({int page, int pageSize, int totalItems});
}

/// @nodoc
class _$RemarketingPaginationCopyWithImpl<$Res>
    implements $RemarketingPaginationCopyWith<$Res> {
  _$RemarketingPaginationCopyWithImpl(this._self, this._then);

  final RemarketingPagination _self;
  final $Res Function(RemarketingPagination) _then;

  /// Create a copy of RemarketingPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? totalItems = null,
  }) {
    return _then(_self.copyWith(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _self.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [RemarketingPagination].
extension RemarketingPaginationPatterns on RemarketingPagination {
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
    TResult Function(_RemarketingPagination value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemarketingPagination() when $default != null:
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
    TResult Function(_RemarketingPagination value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemarketingPagination():
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
    TResult? Function(_RemarketingPagination value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemarketingPagination() when $default != null:
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
    TResult Function(int page, int pageSize, int totalItems)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemarketingPagination() when $default != null:
        return $default(_that.page, _that.pageSize, _that.totalItems);
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
    TResult Function(int page, int pageSize, int totalItems) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemarketingPagination():
        return $default(_that.page, _that.pageSize, _that.totalItems);
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
    TResult? Function(int page, int pageSize, int totalItems)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemarketingPagination() when $default != null:
        return $default(_that.page, _that.pageSize, _that.totalItems);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RemarketingPagination implements RemarketingPagination {
  const _RemarketingPagination(
      {this.page = 1, this.pageSize = 20, this.totalItems = 0});
  factory _RemarketingPagination.fromJson(Map<String, dynamic> json) =>
      _$RemarketingPaginationFromJson(json);

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pageSize;
  @override
  @JsonKey()
  final int totalItems;

  /// Create a copy of RemarketingPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RemarketingPaginationCopyWith<_RemarketingPagination> get copyWith =>
      __$RemarketingPaginationCopyWithImpl<_RemarketingPagination>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RemarketingPaginationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemarketingPagination &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, pageSize, totalItems);

  @override
  String toString() {
    return 'RemarketingPagination(page: $page, pageSize: $pageSize, totalItems: $totalItems)';
  }
}

/// @nodoc
abstract mixin class _$RemarketingPaginationCopyWith<$Res>
    implements $RemarketingPaginationCopyWith<$Res> {
  factory _$RemarketingPaginationCopyWith(_RemarketingPagination value,
          $Res Function(_RemarketingPagination) _then) =
      __$RemarketingPaginationCopyWithImpl;
  @override
  @useResult
  $Res call({int page, int pageSize, int totalItems});
}

/// @nodoc
class __$RemarketingPaginationCopyWithImpl<$Res>
    implements _$RemarketingPaginationCopyWith<$Res> {
  __$RemarketingPaginationCopyWithImpl(this._self, this._then);

  final _RemarketingPagination _self;
  final $Res Function(_RemarketingPagination) _then;

  /// Create a copy of RemarketingPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? totalItems = null,
  }) {
    return _then(_RemarketingPagination(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _self.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$RemarketingPaginatedResponse {
  List<RemarketingUserModel> get items;
  int get page;
  int get pageSize;
  @JsonKey(name: 'totalItem')
  int get totalItems;

  /// Create a copy of RemarketingPaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemarketingPaginatedResponseCopyWith<RemarketingPaginatedResponse>
      get copyWith => _$RemarketingPaginatedResponseCopyWithImpl<
              RemarketingPaginatedResponse>(
          this as RemarketingPaginatedResponse, _$identity);

  /// Serializes this RemarketingPaginatedResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemarketingPaginatedResponse &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(items), page, pageSize, totalItems);

  @override
  String toString() {
    return 'RemarketingPaginatedResponse(items: $items, page: $page, pageSize: $pageSize, totalItems: $totalItems)';
  }
}

/// @nodoc
abstract mixin class $RemarketingPaginatedResponseCopyWith<$Res> {
  factory $RemarketingPaginatedResponseCopyWith(
          RemarketingPaginatedResponse value,
          $Res Function(RemarketingPaginatedResponse) _then) =
      _$RemarketingPaginatedResponseCopyWithImpl;
  @useResult
  $Res call(
      {List<RemarketingUserModel> items,
      int page,
      int pageSize,
      @JsonKey(name: 'totalItem') int totalItems});
}

/// @nodoc
class _$RemarketingPaginatedResponseCopyWithImpl<$Res>
    implements $RemarketingPaginatedResponseCopyWith<$Res> {
  _$RemarketingPaginatedResponseCopyWithImpl(this._self, this._then);

  final RemarketingPaginatedResponse _self;
  final $Res Function(RemarketingPaginatedResponse) _then;

  /// Create a copy of RemarketingPaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? pageSize = null,
    Object? totalItems = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RemarketingUserModel>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _self.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [RemarketingPaginatedResponse].
extension RemarketingPaginatedResponsePatterns on RemarketingPaginatedResponse {
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
    TResult Function(_RemarketingPaginatedResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemarketingPaginatedResponse() when $default != null:
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
    TResult Function(_RemarketingPaginatedResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemarketingPaginatedResponse():
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
    TResult? Function(_RemarketingPaginatedResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemarketingPaginatedResponse() when $default != null:
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
    TResult Function(List<RemarketingUserModel> items, int page, int pageSize,
            @JsonKey(name: 'totalItem') int totalItems)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemarketingPaginatedResponse() when $default != null:
        return $default(
            _that.items, _that.page, _that.pageSize, _that.totalItems);
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
    TResult Function(List<RemarketingUserModel> items, int page, int pageSize,
            @JsonKey(name: 'totalItem') int totalItems)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemarketingPaginatedResponse():
        return $default(
            _that.items, _that.page, _that.pageSize, _that.totalItems);
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
    TResult? Function(List<RemarketingUserModel> items, int page, int pageSize,
            @JsonKey(name: 'totalItem') int totalItems)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemarketingPaginatedResponse() when $default != null:
        return $default(
            _that.items, _that.page, _that.pageSize, _that.totalItems);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RemarketingPaginatedResponse implements RemarketingPaginatedResponse {
  const _RemarketingPaginatedResponse(
      {required final List<RemarketingUserModel> items,
      required this.page,
      required this.pageSize,
      @JsonKey(name: 'totalItem') required this.totalItems})
      : _items = items;
  factory _RemarketingPaginatedResponse.fromJson(Map<String, dynamic> json) =>
      _$RemarketingPaginatedResponseFromJson(json);

  final List<RemarketingUserModel> _items;
  @override
  List<RemarketingUserModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int page;
  @override
  final int pageSize;
  @override
  @JsonKey(name: 'totalItem')
  final int totalItems;

  /// Create a copy of RemarketingPaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RemarketingPaginatedResponseCopyWith<_RemarketingPaginatedResponse>
      get copyWith => __$RemarketingPaginatedResponseCopyWithImpl<
          _RemarketingPaginatedResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RemarketingPaginatedResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemarketingPaginatedResponse &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), page, pageSize, totalItems);

  @override
  String toString() {
    return 'RemarketingPaginatedResponse(items: $items, page: $page, pageSize: $pageSize, totalItems: $totalItems)';
  }
}

/// @nodoc
abstract mixin class _$RemarketingPaginatedResponseCopyWith<$Res>
    implements $RemarketingPaginatedResponseCopyWith<$Res> {
  factory _$RemarketingPaginatedResponseCopyWith(
          _RemarketingPaginatedResponse value,
          $Res Function(_RemarketingPaginatedResponse) _then) =
      __$RemarketingPaginatedResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<RemarketingUserModel> items,
      int page,
      int pageSize,
      @JsonKey(name: 'totalItem') int totalItems});
}

/// @nodoc
class __$RemarketingPaginatedResponseCopyWithImpl<$Res>
    implements _$RemarketingPaginatedResponseCopyWith<$Res> {
  __$RemarketingPaginatedResponseCopyWithImpl(this._self, this._then);

  final _RemarketingPaginatedResponse _self;
  final $Res Function(_RemarketingPaginatedResponse) _then;

  /// Create a copy of RemarketingPaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? pageSize = null,
    Object? totalItems = null,
  }) {
    return _then(_RemarketingPaginatedResponse(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RemarketingUserModel>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _self.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

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

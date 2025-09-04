// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'files_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FilesModel {
  int get id;
  String get userName;
  String get documentTitle;
  String get filePath;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  bool get isDeleted;

  /// Create a copy of FilesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FilesModelCopyWith<FilesModel> get copyWith =>
      _$FilesModelCopyWithImpl<FilesModel>(this as FilesModel, _$identity);

  /// Serializes this FilesModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilesModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.documentTitle, documentTitle) ||
                other.documentTitle == documentTitle) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userName, documentTitle,
      filePath, createdAt, updatedAt, isDeleted);

  @override
  String toString() {
    return 'FilesModel(id: $id, userName: $userName, documentTitle: $documentTitle, filePath: $filePath, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
  }
}

/// @nodoc
abstract mixin class $FilesModelCopyWith<$Res> {
  factory $FilesModelCopyWith(
          FilesModel value, $Res Function(FilesModel) _then) =
      _$FilesModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String userName,
      String documentTitle,
      String filePath,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool isDeleted});
}

/// @nodoc
class _$FilesModelCopyWithImpl<$Res> implements $FilesModelCopyWith<$Res> {
  _$FilesModelCopyWithImpl(this._self, this._then);

  final FilesModel _self;
  final $Res Function(FilesModel) _then;

  /// Create a copy of FilesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? documentTitle = null,
    Object? filePath = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      documentTitle: null == documentTitle
          ? _self.documentTitle
          : documentTitle // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _self.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [FilesModel].
extension FilesModelPatterns on FilesModel {
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
    TResult Function(_FilesModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FilesModel() when $default != null:
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
    TResult Function(_FilesModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FilesModel():
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
    TResult? Function(_FilesModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FilesModel() when $default != null:
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
            String userName,
            String documentTitle,
            String filePath,
            DateTime? createdAt,
            DateTime? updatedAt,
            bool isDeleted)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FilesModel() when $default != null:
        return $default(_that.id, _that.userName, _that.documentTitle,
            _that.filePath, _that.createdAt, _that.updatedAt, _that.isDeleted);
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
            String userName,
            String documentTitle,
            String filePath,
            DateTime? createdAt,
            DateTime? updatedAt,
            bool isDeleted)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FilesModel():
        return $default(_that.id, _that.userName, _that.documentTitle,
            _that.filePath, _that.createdAt, _that.updatedAt, _that.isDeleted);
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
            String userName,
            String documentTitle,
            String filePath,
            DateTime? createdAt,
            DateTime? updatedAt,
            bool isDeleted)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FilesModel() when $default != null:
        return $default(_that.id, _that.userName, _that.documentTitle,
            _that.filePath, _that.createdAt, _that.updatedAt, _that.isDeleted);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FilesModel implements FilesModel {
  const _FilesModel(
      {required this.id,
      required this.userName,
      required this.documentTitle,
      required this.filePath,
      this.createdAt,
      this.updatedAt,
      this.isDeleted = false});
  factory _FilesModel.fromJson(Map<String, dynamic> json) =>
      _$FilesModelFromJson(json);

  @override
  final int id;
  @override
  final String userName;
  @override
  final String documentTitle;
  @override
  final String filePath;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final bool isDeleted;

  /// Create a copy of FilesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FilesModelCopyWith<_FilesModel> get copyWith =>
      __$FilesModelCopyWithImpl<_FilesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FilesModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilesModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.documentTitle, documentTitle) ||
                other.documentTitle == documentTitle) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userName, documentTitle,
      filePath, createdAt, updatedAt, isDeleted);

  @override
  String toString() {
    return 'FilesModel(id: $id, userName: $userName, documentTitle: $documentTitle, filePath: $filePath, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
  }
}

/// @nodoc
abstract mixin class _$FilesModelCopyWith<$Res>
    implements $FilesModelCopyWith<$Res> {
  factory _$FilesModelCopyWith(
          _FilesModel value, $Res Function(_FilesModel) _then) =
      __$FilesModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String userName,
      String documentTitle,
      String filePath,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool isDeleted});
}

/// @nodoc
class __$FilesModelCopyWithImpl<$Res> implements _$FilesModelCopyWith<$Res> {
  __$FilesModelCopyWithImpl(this._self, this._then);

  final _FilesModel _self;
  final $Res Function(_FilesModel) _then;

  /// Create a copy of FilesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? documentTitle = null,
    Object? filePath = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = null,
  }) {
    return _then(_FilesModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      documentTitle: null == documentTitle
          ? _self.documentTitle
          : documentTitle // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _self.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on

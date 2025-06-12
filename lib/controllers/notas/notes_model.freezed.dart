// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotesModel {
  int get id;
  int get bodaId;
  String get title;
  String get description;
  Map<String, dynamic>? get images;
  String? get file;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  bool get isDeleted;

  /// Create a copy of NotesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotesModelCopyWith<NotesModel> get copyWith =>
      _$NotesModelCopyWithImpl<NotesModel>(this as NotesModel, _$identity);

  /// Serializes this NotesModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotesModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bodaId, bodaId) || other.bodaId == bodaId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bodaId,
      title,
      description,
      const DeepCollectionEquality().hash(images),
      file,
      createdAt,
      updatedAt,
      isDeleted);

  @override
  String toString() {
    return 'NotesModel(id: $id, bodaId: $bodaId, title: $title, description: $description, images: $images, file: $file, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
  }
}

/// @nodoc
abstract mixin class $NotesModelCopyWith<$Res> {
  factory $NotesModelCopyWith(
          NotesModel value, $Res Function(NotesModel) _then) =
      _$NotesModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int bodaId,
      String title,
      String description,
      Map<String, dynamic>? images,
      String? file,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool isDeleted});
}

/// @nodoc
class _$NotesModelCopyWithImpl<$Res> implements $NotesModelCopyWith<$Res> {
  _$NotesModelCopyWithImpl(this._self, this._then);

  final NotesModel _self;
  final $Res Function(NotesModel) _then;

  /// Create a copy of NotesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bodaId = null,
    Object? title = null,
    Object? description = null,
    Object? images = freezed,
    Object? file = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = null,
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
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      file: freezed == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
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

/// @nodoc
@JsonSerializable()
class _NotesModel implements NotesModel {
  const _NotesModel(
      {required this.id,
      required this.bodaId,
      required this.title,
      required this.description,
      final Map<String, dynamic>? images,
      this.file,
      this.createdAt,
      this.updatedAt,
      this.isDeleted = false})
      : _images = images;
  factory _NotesModel.fromJson(Map<String, dynamic> json) =>
      _$NotesModelFromJson(json);

  @override
  final int id;
  @override
  final int bodaId;
  @override
  final String title;
  @override
  final String description;
  final Map<String, dynamic>? _images;
  @override
  Map<String, dynamic>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableMapView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? file;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final bool isDeleted;

  /// Create a copy of NotesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotesModelCopyWith<_NotesModel> get copyWith =>
      __$NotesModelCopyWithImpl<_NotesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotesModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotesModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bodaId, bodaId) || other.bodaId == bodaId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bodaId,
      title,
      description,
      const DeepCollectionEquality().hash(_images),
      file,
      createdAt,
      updatedAt,
      isDeleted);

  @override
  String toString() {
    return 'NotesModel(id: $id, bodaId: $bodaId, title: $title, description: $description, images: $images, file: $file, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
  }
}

/// @nodoc
abstract mixin class _$NotesModelCopyWith<$Res>
    implements $NotesModelCopyWith<$Res> {
  factory _$NotesModelCopyWith(
          _NotesModel value, $Res Function(_NotesModel) _then) =
      __$NotesModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int bodaId,
      String title,
      String description,
      Map<String, dynamic>? images,
      String? file,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool isDeleted});
}

/// @nodoc
class __$NotesModelCopyWithImpl<$Res> implements _$NotesModelCopyWith<$Res> {
  __$NotesModelCopyWithImpl(this._self, this._then);

  final _NotesModel _self;
  final $Res Function(_NotesModel) _then;

  /// Create a copy of NotesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? bodaId = null,
    Object? title = null,
    Object? description = null,
    Object? images = freezed,
    Object? file = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = null,
  }) {
    return _then(_NotesModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bodaId: null == bodaId
          ? _self.bodaId
          : bodaId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      file: freezed == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
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

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationsModel {
  String get id;
  @JsonKey(name: 'user_id')
  String get userId;
  String get type;
  String? get title;
  String? get body;
  Map<String, dynamic>? get data;
  @JsonKey(name: 'read_at')
  DateTime? get readAt;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of NotificationsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationsModelCopyWith<NotificationsModel> get copyWith =>
      _$NotificationsModelCopyWithImpl<NotificationsModel>(
          this as NotificationsModel, _$identity);

  /// Serializes this NotificationsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, type, title, body,
      const DeepCollectionEquality().hash(data), readAt, createdAt);

  @override
  String toString() {
    return 'NotificationsModel(id: $id, userId: $userId, type: $type, title: $title, body: $body, data: $data, readAt: $readAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $NotificationsModelCopyWith<$Res> {
  factory $NotificationsModelCopyWith(
          NotificationsModel value, $Res Function(NotificationsModel) _then) =
      _$NotificationsModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      String type,
      String? title,
      String? body,
      Map<String, dynamic>? data,
      @JsonKey(name: 'read_at') DateTime? readAt,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$NotificationsModelCopyWithImpl<$Res>
    implements $NotificationsModelCopyWith<$Res> {
  _$NotificationsModelCopyWithImpl(this._self, this._then);

  final NotificationsModel _self;
  final $Res Function(NotificationsModel) _then;

  /// Create a copy of NotificationsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = freezed,
    Object? body = freezed,
    Object? data = freezed,
    Object? readAt = freezed,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      readAt: freezed == readAt
          ? _self.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [NotificationsModel].
extension NotificationsModelPatterns on NotificationsModel {
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
    TResult Function(_NotificationsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationsModel() when $default != null:
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
    TResult Function(_NotificationsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsModel():
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
    TResult? Function(_NotificationsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsModel() when $default != null:
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
            @JsonKey(name: 'user_id') String userId,
            String type,
            String? title,
            String? body,
            Map<String, dynamic>? data,
            @JsonKey(name: 'read_at') DateTime? readAt,
            @JsonKey(name: 'created_at') DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationsModel() when $default != null:
        return $default(_that.id, _that.userId, _that.type, _that.title,
            _that.body, _that.data, _that.readAt, _that.createdAt);
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
            @JsonKey(name: 'user_id') String userId,
            String type,
            String? title,
            String? body,
            Map<String, dynamic>? data,
            @JsonKey(name: 'read_at') DateTime? readAt,
            @JsonKey(name: 'created_at') DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsModel():
        return $default(_that.id, _that.userId, _that.type, _that.title,
            _that.body, _that.data, _that.readAt, _that.createdAt);
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
            @JsonKey(name: 'user_id') String userId,
            String type,
            String? title,
            String? body,
            Map<String, dynamic>? data,
            @JsonKey(name: 'read_at') DateTime? readAt,
            @JsonKey(name: 'created_at') DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsModel() when $default != null:
        return $default(_that.id, _that.userId, _that.type, _that.title,
            _that.body, _that.data, _that.readAt, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationsModel implements NotificationsModel {
  const _NotificationsModel(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.type,
      this.title,
      this.body,
      final Map<String, dynamic>? data,
      @JsonKey(name: 'read_at') this.readAt,
      @JsonKey(name: 'created_at') required this.createdAt})
      : _data = data;
  factory _NotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String type;
  @override
  final String? title;
  @override
  final String? body;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'read_at')
  final DateTime? readAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  /// Create a copy of NotificationsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationsModelCopyWith<_NotificationsModel> get copyWith =>
      __$NotificationsModelCopyWithImpl<_NotificationsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, type, title, body,
      const DeepCollectionEquality().hash(_data), readAt, createdAt);

  @override
  String toString() {
    return 'NotificationsModel(id: $id, userId: $userId, type: $type, title: $title, body: $body, data: $data, readAt: $readAt, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$NotificationsModelCopyWith<$Res>
    implements $NotificationsModelCopyWith<$Res> {
  factory _$NotificationsModelCopyWith(
          _NotificationsModel value, $Res Function(_NotificationsModel) _then) =
      __$NotificationsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      String type,
      String? title,
      String? body,
      Map<String, dynamic>? data,
      @JsonKey(name: 'read_at') DateTime? readAt,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$NotificationsModelCopyWithImpl<$Res>
    implements _$NotificationsModelCopyWith<$Res> {
  __$NotificationsModelCopyWithImpl(this._self, this._then);

  final _NotificationsModel _self;
  final $Res Function(_NotificationsModel) _then;

  /// Create a copy of NotificationsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = freezed,
    Object? body = freezed,
    Object? data = freezed,
    Object? readAt = freezed,
    Object? createdAt = null,
  }) {
    return _then(_NotificationsModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      readAt: freezed == readAt
          ? _self.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$NotificationsState {
  List<NotificationsModel> get notifications;
  bool get isLoading;
  String? get errorMessage;
  int get currentPage;
  int get itemsPerPage;
  int get totalPages;
  int get unreadCount;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationsStateCopyWith<NotificationsState> get copyWith =>
      _$NotificationsStateCopyWithImpl<NotificationsState>(
          this as NotificationsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationsState &&
            const DeepCollectionEquality()
                .equals(other.notifications, notifications) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(notifications),
      isLoading,
      errorMessage,
      currentPage,
      itemsPerPage,
      totalPages,
      unreadCount);

  @override
  String toString() {
    return 'NotificationsState(notifications: $notifications, isLoading: $isLoading, errorMessage: $errorMessage, currentPage: $currentPage, itemsPerPage: $itemsPerPage, totalPages: $totalPages, unreadCount: $unreadCount)';
  }
}

/// @nodoc
abstract mixin class $NotificationsStateCopyWith<$Res> {
  factory $NotificationsStateCopyWith(
          NotificationsState value, $Res Function(NotificationsState) _then) =
      _$NotificationsStateCopyWithImpl;
  @useResult
  $Res call(
      {List<NotificationsModel> notifications,
      bool isLoading,
      String? errorMessage,
      int currentPage,
      int itemsPerPage,
      int totalPages,
      int unreadCount});
}

/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._self, this._then);

  final NotificationsState _self;
  final $Res Function(NotificationsState) _then;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? currentPage = null,
    Object? itemsPerPage = null,
    Object? totalPages = null,
    Object? unreadCount = null,
  }) {
    return _then(_self.copyWith(
      notifications: null == notifications
          ? _self.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationsModel>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _self.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      unreadCount: null == unreadCount
          ? _self.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [NotificationsState].
extension NotificationsStatePatterns on NotificationsState {
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
    TResult Function(_NotificationsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationsState() when $default != null:
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
    TResult Function(_NotificationsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsState():
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
    TResult? Function(_NotificationsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsState() when $default != null:
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
            List<NotificationsModel> notifications,
            bool isLoading,
            String? errorMessage,
            int currentPage,
            int itemsPerPage,
            int totalPages,
            int unreadCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationsState() when $default != null:
        return $default(
            _that.notifications,
            _that.isLoading,
            _that.errorMessage,
            _that.currentPage,
            _that.itemsPerPage,
            _that.totalPages,
            _that.unreadCount);
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
            List<NotificationsModel> notifications,
            bool isLoading,
            String? errorMessage,
            int currentPage,
            int itemsPerPage,
            int totalPages,
            int unreadCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsState():
        return $default(
            _that.notifications,
            _that.isLoading,
            _that.errorMessage,
            _that.currentPage,
            _that.itemsPerPage,
            _that.totalPages,
            _that.unreadCount);
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
            List<NotificationsModel> notifications,
            bool isLoading,
            String? errorMessage,
            int currentPage,
            int itemsPerPage,
            int totalPages,
            int unreadCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsState() when $default != null:
        return $default(
            _that.notifications,
            _that.isLoading,
            _that.errorMessage,
            _that.currentPage,
            _that.itemsPerPage,
            _that.totalPages,
            _that.unreadCount);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NotificationsState implements NotificationsState {
  const _NotificationsState(
      {final List<NotificationsModel> notifications = const [],
      this.isLoading = false,
      this.errorMessage,
      this.currentPage = 1,
      this.itemsPerPage = 10,
      this.totalPages = 0,
      this.unreadCount = 0})
      : _notifications = notifications;

  final List<NotificationsModel> _notifications;
  @override
  @JsonKey()
  List<NotificationsModel> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int itemsPerPage;
  @override
  @JsonKey()
  final int totalPages;
  @override
  @JsonKey()
  final int unreadCount;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationsStateCopyWith<_NotificationsState> get copyWith =>
      __$NotificationsStateCopyWithImpl<_NotificationsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationsState &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_notifications),
      isLoading,
      errorMessage,
      currentPage,
      itemsPerPage,
      totalPages,
      unreadCount);

  @override
  String toString() {
    return 'NotificationsState(notifications: $notifications, isLoading: $isLoading, errorMessage: $errorMessage, currentPage: $currentPage, itemsPerPage: $itemsPerPage, totalPages: $totalPages, unreadCount: $unreadCount)';
  }
}

/// @nodoc
abstract mixin class _$NotificationsStateCopyWith<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  factory _$NotificationsStateCopyWith(
          _NotificationsState value, $Res Function(_NotificationsState) _then) =
      __$NotificationsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<NotificationsModel> notifications,
      bool isLoading,
      String? errorMessage,
      int currentPage,
      int itemsPerPage,
      int totalPages,
      int unreadCount});
}

/// @nodoc
class __$NotificationsStateCopyWithImpl<$Res>
    implements _$NotificationsStateCopyWith<$Res> {
  __$NotificationsStateCopyWithImpl(this._self, this._then);

  final _NotificationsState _self;
  final $Res Function(_NotificationsState) _then;

  /// Create a copy of NotificationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? notifications = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? currentPage = null,
    Object? itemsPerPage = null,
    Object? totalPages = null,
    Object? unreadCount = null,
  }) {
    return _then(_NotificationsState(
      notifications: null == notifications
          ? _self._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationsModel>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _self.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      unreadCount: null == unreadCount
          ? _self.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on

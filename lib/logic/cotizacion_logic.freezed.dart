// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cotizacion_logic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CotizacionRequestPaginationState {
  List<CotizacionRequest> get allRequests;
  List<CotizacionRequest> get currentPageRequests;
  int get currentPage;
  int get totalPages;
  int get itemsPerPage;
  bool get isLoading;
  String? get errorMessage;

  /// Create a copy of CotizacionRequestPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CotizacionRequestPaginationStateCopyWith<CotizacionRequestPaginationState>
      get copyWith => _$CotizacionRequestPaginationStateCopyWithImpl<
              CotizacionRequestPaginationState>(
          this as CotizacionRequestPaginationState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CotizacionRequestPaginationState &&
            const DeepCollectionEquality()
                .equals(other.allRequests, allRequests) &&
            const DeepCollectionEquality()
                .equals(other.currentPageRequests, currentPageRequests) &&
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
      const DeepCollectionEquality().hash(allRequests),
      const DeepCollectionEquality().hash(currentPageRequests),
      currentPage,
      totalPages,
      itemsPerPage,
      isLoading,
      errorMessage);

  @override
  String toString() {
    return 'CotizacionRequestPaginationState(allRequests: $allRequests, currentPageRequests: $currentPageRequests, currentPage: $currentPage, totalPages: $totalPages, itemsPerPage: $itemsPerPage, isLoading: $isLoading, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $CotizacionRequestPaginationStateCopyWith<$Res> {
  factory $CotizacionRequestPaginationStateCopyWith(
          CotizacionRequestPaginationState value,
          $Res Function(CotizacionRequestPaginationState) _then) =
      _$CotizacionRequestPaginationStateCopyWithImpl;
  @useResult
  $Res call(
      {List<CotizacionRequest> allRequests,
      List<CotizacionRequest> currentPageRequests,
      int currentPage,
      int totalPages,
      int itemsPerPage,
      bool isLoading,
      String? errorMessage});
}

/// @nodoc
class _$CotizacionRequestPaginationStateCopyWithImpl<$Res>
    implements $CotizacionRequestPaginationStateCopyWith<$Res> {
  _$CotizacionRequestPaginationStateCopyWithImpl(this._self, this._then);

  final CotizacionRequestPaginationState _self;
  final $Res Function(CotizacionRequestPaginationState) _then;

  /// Create a copy of CotizacionRequestPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allRequests = null,
    Object? currentPageRequests = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? itemsPerPage = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      allRequests: null == allRequests
          ? _self.allRequests
          : allRequests // ignore: cast_nullable_to_non_nullable
              as List<CotizacionRequest>,
      currentPageRequests: null == currentPageRequests
          ? _self.currentPageRequests
          : currentPageRequests // ignore: cast_nullable_to_non_nullable
              as List<CotizacionRequest>,
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

/// @nodoc

class _CotizacionRequestPaginationState
    implements CotizacionRequestPaginationState {
  const _CotizacionRequestPaginationState(
      {final List<CotizacionRequest> allRequests = const [],
      final List<CotizacionRequest> currentPageRequests = const [],
      this.currentPage = 1,
      this.totalPages = 1,
      this.itemsPerPage = 10,
      this.isLoading = false,
      this.errorMessage})
      : _allRequests = allRequests,
        _currentPageRequests = currentPageRequests;

  final List<CotizacionRequest> _allRequests;
  @override
  @JsonKey()
  List<CotizacionRequest> get allRequests {
    if (_allRequests is EqualUnmodifiableListView) return _allRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allRequests);
  }

  final List<CotizacionRequest> _currentPageRequests;
  @override
  @JsonKey()
  List<CotizacionRequest> get currentPageRequests {
    if (_currentPageRequests is EqualUnmodifiableListView)
      return _currentPageRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentPageRequests);
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

  /// Create a copy of CotizacionRequestPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CotizacionRequestPaginationStateCopyWith<_CotizacionRequestPaginationState>
      get copyWith => __$CotizacionRequestPaginationStateCopyWithImpl<
          _CotizacionRequestPaginationState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CotizacionRequestPaginationState &&
            const DeepCollectionEquality()
                .equals(other._allRequests, _allRequests) &&
            const DeepCollectionEquality()
                .equals(other._currentPageRequests, _currentPageRequests) &&
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
      const DeepCollectionEquality().hash(_allRequests),
      const DeepCollectionEquality().hash(_currentPageRequests),
      currentPage,
      totalPages,
      itemsPerPage,
      isLoading,
      errorMessage);

  @override
  String toString() {
    return 'CotizacionRequestPaginationState(allRequests: $allRequests, currentPageRequests: $currentPageRequests, currentPage: $currentPage, totalPages: $totalPages, itemsPerPage: $itemsPerPage, isLoading: $isLoading, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$CotizacionRequestPaginationStateCopyWith<$Res>
    implements $CotizacionRequestPaginationStateCopyWith<$Res> {
  factory _$CotizacionRequestPaginationStateCopyWith(
          _CotizacionRequestPaginationState value,
          $Res Function(_CotizacionRequestPaginationState) _then) =
      __$CotizacionRequestPaginationStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<CotizacionRequest> allRequests,
      List<CotizacionRequest> currentPageRequests,
      int currentPage,
      int totalPages,
      int itemsPerPage,
      bool isLoading,
      String? errorMessage});
}

/// @nodoc
class __$CotizacionRequestPaginationStateCopyWithImpl<$Res>
    implements _$CotizacionRequestPaginationStateCopyWith<$Res> {
  __$CotizacionRequestPaginationStateCopyWithImpl(this._self, this._then);

  final _CotizacionRequestPaginationState _self;
  final $Res Function(_CotizacionRequestPaginationState) _then;

  /// Create a copy of CotizacionRequestPaginationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? allRequests = null,
    Object? currentPageRequests = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? itemsPerPage = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_CotizacionRequestPaginationState(
      allRequests: null == allRequests
          ? _self._allRequests
          : allRequests // ignore: cast_nullable_to_non_nullable
              as List<CotizacionRequest>,
      currentPageRequests: null == currentPageRequests
          ? _self._currentPageRequests
          : currentPageRequests // ignore: cast_nullable_to_non_nullable
              as List<CotizacionRequest>,
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

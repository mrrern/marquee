// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketing_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(marketing)
final marketingProvider = MarketingProvider._();

final class MarketingProvider extends $FunctionalProvider<
        AsyncValue<List<RemarketingUserModel>>,
        List<RemarketingUserModel>,
        FutureOr<List<RemarketingUserModel>>>
    with
        $FutureModifier<List<RemarketingUserModel>>,
        $FutureProvider<List<RemarketingUserModel>> {
  MarketingProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'marketingProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$marketingHash();

  @$internal
  @override
  $FutureProviderElement<List<RemarketingUserModel>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<RemarketingUserModel>> create(Ref ref) {
    return marketing(ref);
  }
}

String _$marketingHash() => r'2e363e0208f12749abbe818121c6a6b0e964c2ab';

@ProviderFor(SelectedRemarketingUser)
final selectedRemarketingUserProvider = SelectedRemarketingUserProvider._();

final class SelectedRemarketingUserProvider
    extends $NotifierProvider<SelectedRemarketingUser, RemarketingUserModel?> {
  SelectedRemarketingUserProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'selectedRemarketingUserProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$selectedRemarketingUserHash();

  @$internal
  @override
  SelectedRemarketingUser create() => SelectedRemarketingUser();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RemarketingUserModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RemarketingUserModel?>(value),
    );
  }
}

String _$selectedRemarketingUserHash() =>
    r'31674e4061632ac91ea99f8cffcb6d04b13e40c6';

abstract class _$SelectedRemarketingUser
    extends $Notifier<RemarketingUserModel?> {
  RemarketingUserModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<RemarketingUserModel?, RemarketingUserModel?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<RemarketingUserModel?, RemarketingUserModel?>,
        RemarketingUserModel?,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(remarketingUser)
final remarketingUserProvider = RemarketingUserFamily._();

final class RemarketingUserProvider extends $FunctionalProvider<
        AsyncValue<RemarketingUserModel?>,
        RemarketingUserModel?,
        FutureOr<RemarketingUserModel?>>
    with
        $FutureModifier<RemarketingUserModel?>,
        $FutureProvider<RemarketingUserModel?> {
  RemarketingUserProvider._(
      {required RemarketingUserFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'remarketingUserProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$remarketingUserHash();

  @override
  String toString() {
    return r'remarketingUserProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<RemarketingUserModel?> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<RemarketingUserModel?> create(Ref ref) {
    final argument = this.argument as String;
    return remarketingUser(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RemarketingUserProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$remarketingUserHash() => r'ee253d4b7d558406805d35738975dd9e45f363b9';

final class RemarketingUserFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<RemarketingUserModel?>, String> {
  RemarketingUserFamily._()
      : super(
          retry: null,
          name: r'remarketingUserProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  RemarketingUserProvider call(
    String userId,
  ) =>
      RemarketingUserProvider._(argument: userId, from: this);

  @override
  String toString() => r'remarketingUserProvider';
}

@ProviderFor(marketingPaginated)
final marketingPaginatedProvider = MarketingPaginatedFamily._();

final class MarketingPaginatedProvider extends $FunctionalProvider<
        AsyncValue<RemarketingPaginatedResponse>,
        RemarketingPaginatedResponse,
        FutureOr<RemarketingPaginatedResponse>>
    with
        $FutureModifier<RemarketingPaginatedResponse>,
        $FutureProvider<RemarketingPaginatedResponse> {
  MarketingPaginatedProvider._(
      {required MarketingPaginatedFamily super.from,
      required RemarketingPagination super.argument})
      : super(
          retry: null,
          name: r'marketingPaginatedProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$marketingPaginatedHash();

  @override
  String toString() {
    return r'marketingPaginatedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<RemarketingPaginatedResponse> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<RemarketingPaginatedResponse> create(Ref ref) {
    final argument = this.argument as RemarketingPagination;
    return marketingPaginated(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MarketingPaginatedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$marketingPaginatedHash() =>
    r'ea648726cffc10861e6d79507f738d5440911b19';

final class MarketingPaginatedFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<RemarketingPaginatedResponse>,
            RemarketingPagination> {
  MarketingPaginatedFamily._()
      : super(
          retry: null,
          name: r'marketingPaginatedProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  MarketingPaginatedProvider call(
    RemarketingPagination pagination,
  ) =>
      MarketingPaginatedProvider._(argument: pagination, from: this);

  @override
  String toString() => r'marketingPaginatedProvider';
}

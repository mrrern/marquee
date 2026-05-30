// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boda_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Weddings)
final weddingsProvider = WeddingsFamily._();

final class WeddingsProvider
    extends $AsyncNotifierProvider<Weddings, List<Boda>> {
  WeddingsProvider._(
      {required WeddingsFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'weddingsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$weddingsHash();

  @override
  String toString() {
    return r'weddingsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Weddings create() => Weddings();

  @override
  bool operator ==(Object other) {
    return other is WeddingsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$weddingsHash() => r'b0caac7a7a0cfb0214e7faebfb4153b5f1ca0132';

final class WeddingsFamily extends $Family
    with
        $ClassFamilyOverride<Weddings, AsyncValue<List<Boda>>, List<Boda>,
            FutureOr<List<Boda>>, String> {
  WeddingsFamily._()
      : super(
          retry: null,
          name: r'weddingsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  WeddingsProvider call(
    String usuarioId,
  ) =>
      WeddingsProvider._(argument: usuarioId, from: this);

  @override
  String toString() => r'weddingsProvider';
}

abstract class _$Weddings extends $AsyncNotifier<List<Boda>> {
  late final _$args = ref.$arg as String;
  String get usuarioId => _$args;

  FutureOr<List<Boda>> build(
    String usuarioId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Boda>>, List<Boda>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<Boda>>, List<Boda>>,
        AsyncValue<List<Boda>>,
        Object?,
        Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}

@ProviderFor(ContractedPagination)
final contractedPaginationProvider = ContractedPaginationProvider._();

final class ContractedPaginationProvider
    extends $NotifierProvider<ContractedPagination, ContractedPaginationState> {
  ContractedPaginationProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'contractedPaginationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$contractedPaginationHash();

  @$internal
  @override
  ContractedPagination create() => ContractedPagination();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContractedPaginationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContractedPaginationState>(value),
    );
  }
}

String _$contractedPaginationHash() =>
    r'84433ead87940acddddc27348b72e19767aa687c';

abstract class _$ContractedPagination
    extends $Notifier<ContractedPaginationState> {
  ContractedPaginationState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<ContractedPaginationState, ContractedPaginationState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ContractedPaginationState, ContractedPaginationState>,
        ContractedPaginationState,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

/// Provider para el estado del formulario de boda

@ProviderFor(WeddingForm)
final weddingFormProvider = WeddingFormProvider._();

/// Provider para el estado del formulario de boda
final class WeddingFormProvider
    extends $NotifierProvider<WeddingForm, WeddingFormState> {
  /// Provider para el estado del formulario de boda
  WeddingFormProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'weddingFormProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$weddingFormHash();

  @$internal
  @override
  WeddingForm create() => WeddingForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeddingFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeddingFormState>(value),
    );
  }
}

String _$weddingFormHash() => r'487102cc52178d608eedcc50f9f497c4f31cac7c';

/// Provider para el estado del formulario de boda

abstract class _$WeddingForm extends $Notifier<WeddingFormState> {
  WeddingFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<WeddingFormState, WeddingFormState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<WeddingFormState, WeddingFormState>,
        WeddingFormState,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

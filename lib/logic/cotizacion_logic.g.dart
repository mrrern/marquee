// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotizacion_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CotizacionRequestPagination)
final cotizacionRequestPaginationProvider =
    CotizacionRequestPaginationProvider._();

final class CotizacionRequestPaginationProvider extends $NotifierProvider<
    CotizacionRequestPagination, CotizacionRequestPaginationState> {
  CotizacionRequestPaginationProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'cotizacionRequestPaginationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$cotizacionRequestPaginationHash();

  @$internal
  @override
  CotizacionRequestPagination create() => CotizacionRequestPagination();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CotizacionRequestPaginationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<CotizacionRequestPaginationState>(value),
    );
  }
}

String _$cotizacionRequestPaginationHash() =>
    r'ce37cab29734f1eb5af756da83c2731f2722bfb2';

abstract class _$CotizacionRequestPagination
    extends $Notifier<CotizacionRequestPaginationState> {
  CotizacionRequestPaginationState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CotizacionRequestPaginationState,
        CotizacionRequestPaginationState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<CotizacionRequestPaginationState,
            CotizacionRequestPaginationState>,
        CotizacionRequestPaginationState,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

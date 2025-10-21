// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentFilterHash() => r'6086e62412df3f26624e6bdd84a5e3b51472382c';

/// Provider para el filtro actual de notificaciones
///
/// Copied from [CurrentFilter].
@ProviderFor(CurrentFilter)
final currentFilterProvider =
    AutoDisposeNotifierProvider<CurrentFilter, NotificationFilter>.internal(
  CurrentFilter.new,
  name: r'currentFilterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentFilter = AutoDisposeNotifier<NotificationFilter>;
String _$currentOrderHash() => r'df6a58ae956e6901933e8ba47c3f52af755a2a43';

/// Provider para el orden actual de notificaciones
///
/// Copied from [CurrentOrder].
@ProviderFor(CurrentOrder)
final currentOrderProvider =
    AutoDisposeNotifierProvider<CurrentOrder, NotificationOrder>.internal(
  CurrentOrder.new,
  name: r'currentOrderProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentOrderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentOrder = AutoDisposeNotifier<NotificationOrder>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

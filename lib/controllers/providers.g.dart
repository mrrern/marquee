// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredAndSortedNotificationsHash() =>
    r'b21a2aa8d327bcd44c2dd4efd4a1d09d21f6e3a1';

/// Provider para obtener notificaciones filtradas y ordenadas
///
/// Copied from [filteredAndSortedNotifications].
@ProviderFor(filteredAndSortedNotifications)
final filteredAndSortedNotificationsProvider =
    AutoDisposeProvider<List<NotificationModel>>.internal(
  filteredAndSortedNotifications,
  name: r'filteredAndSortedNotificationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredAndSortedNotificationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredAndSortedNotificationsRef
    = AutoDisposeProviderRef<List<NotificationModel>>;
String _$hasUnreadNotificationsHash() =>
    r'981aaa49e3e9faaf22943b90c70fb6a8c711a7da';

/// Provider para verificar si hay notificaciones no leídas
///
/// Copied from [hasUnreadNotifications].
@ProviderFor(hasUnreadNotifications)
final hasUnreadNotificationsProvider = AutoDisposeProvider<bool>.internal(
  hasUnreadNotifications,
  name: r'hasUnreadNotificationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hasUnreadNotificationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HasUnreadNotificationsRef = AutoDisposeProviderRef<bool>;
String _$unreadNotificationsCountHash() =>
    r'e336bf01a14ae639dda74f323149e1e340407b36';

/// Provider para contar las notificaciones no leídas
///
/// Copied from [unreadNotificationsCount].
@ProviderFor(unreadNotificationsCount)
final unreadNotificationsCountProvider = AutoDisposeProvider<int>.internal(
  unreadNotificationsCount,
  name: r'unreadNotificationsCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$unreadNotificationsCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UnreadNotificationsCountRef = AutoDisposeProviderRef<int>;
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
String _$notificationListHash() => r'a91ea7de2403e136546fd4f6272cce2615be254d';

/// Provider para la lista de notificaciones
///
/// Copied from [NotificationList].
@ProviderFor(NotificationList)
final notificationListProvider = AutoDisposeNotifierProvider<NotificationList,
    List<NotificationModel>>.internal(
  NotificationList.new,
  name: r'notificationListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotificationList = AutoDisposeNotifier<List<NotificationModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

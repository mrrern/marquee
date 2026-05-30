// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AdminUsers)
final adminUsersProvider = AdminUsersProvider._();

final class AdminUsersProvider
    extends $AsyncNotifierProvider<AdminUsers, List<UserInfo>> {
  AdminUsersProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'adminUsersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$adminUsersHash();

  @$internal
  @override
  AdminUsers create() => AdminUsers();
}

String _$adminUsersHash() => r'173547c7d1557e0b4ccb9dfcfe1c582baa5e901c';

abstract class _$AdminUsers extends $AsyncNotifier<List<UserInfo>> {
  FutureOr<List<UserInfo>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<UserInfo>>, List<UserInfo>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<UserInfo>>, List<UserInfo>>,
        AsyncValue<List<UserInfo>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(PaginateUsers)
final paginateUsersProvider = PaginateUsersProvider._();

final class PaginateUsersProvider
    extends $NotifierProvider<PaginateUsers, PaginateUserState> {
  PaginateUsersProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'paginateUsersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$paginateUsersHash();

  @$internal
  @override
  PaginateUsers create() => PaginateUsers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaginateUserState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaginateUserState>(value),
    );
  }
}

String _$paginateUsersHash() => r'7a1d0667e50ed3b99345ca6609127f48149d7d0a';

abstract class _$PaginateUsers extends $Notifier<PaginateUserState> {
  PaginateUserState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PaginateUserState, PaginateUserState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PaginateUserState, PaginateUserState>,
        PaginateUserState,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

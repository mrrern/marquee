// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_services.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthNotifier)
final authProvider = AuthNotifierProvider._();

final class AuthNotifierProvider
    extends $AsyncNotifierProvider<AuthNotifier, UserModel?> {
  AuthNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authNotifierHash();

  @$internal
  @override
  AuthNotifier create() => AuthNotifier();
}

String _$authNotifierHash() => r'ec23d365aa96b6d4ae8676ecbabac629dcc76afe';

abstract class _$AuthNotifier extends $AsyncNotifier<UserModel?> {
  FutureOr<UserModel?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UserModel?>, UserModel?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<UserModel?>, UserModel?>,
        AsyncValue<UserModel?>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(AuthInfoNotifier)
final authInfoProvider = AuthInfoNotifierProvider._();

final class AuthInfoNotifierProvider
    extends $AsyncNotifierProvider<AuthInfoNotifier, UserInfo?> {
  AuthInfoNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authInfoProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authInfoNotifierHash();

  @$internal
  @override
  AuthInfoNotifier create() => AuthInfoNotifier();
}

String _$authInfoNotifierHash() => r'e834c7a213ddc6b26f03eed49356e8b1c44128f5';

abstract class _$AuthInfoNotifier extends $AsyncNotifier<UserInfo?> {
  FutureOr<UserInfo?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UserInfo?>, UserInfo?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<UserInfo?>, UserInfo?>,
        AsyncValue<UserInfo?>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

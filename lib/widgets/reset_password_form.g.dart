// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_form.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NewPassword)
final newPasswordProvider = NewPasswordProvider._();

final class NewPasswordProvider extends $NotifierProvider<NewPassword, String> {
  NewPasswordProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'newPasswordProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$newPasswordHash();

  @$internal
  @override
  NewPassword create() => NewPassword();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$newPasswordHash() => r'82e0174037bc0df518974e505b6a2df1073af759';

abstract class _$NewPassword extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ConfirmResetPassword)
final confirmResetPasswordProvider = ConfirmResetPasswordProvider._();

final class ConfirmResetPasswordProvider
    extends $NotifierProvider<ConfirmResetPassword, String> {
  ConfirmResetPasswordProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'confirmResetPasswordProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$confirmResetPasswordHash();

  @$internal
  @override
  ConfirmResetPassword create() => ConfirmResetPassword();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$confirmResetPasswordHash() =>
    r'd24de4e309b2f448f47b7d54ef8679dc1b0cd5ca';

abstract class _$ConfirmResetPassword extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(IsNewPasswordVisible)
final isNewPasswordVisibleProvider = IsNewPasswordVisibleProvider._();

final class IsNewPasswordVisibleProvider
    extends $NotifierProvider<IsNewPasswordVisible, bool> {
  IsNewPasswordVisibleProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'isNewPasswordVisibleProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isNewPasswordVisibleHash();

  @$internal
  @override
  IsNewPasswordVisible create() => IsNewPasswordVisible();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isNewPasswordVisibleHash() =>
    r'68deadfcc07220975a1264b0e35fa33eedc0de73';

abstract class _$IsNewPasswordVisible extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<bool, bool>, bool, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(IsConfirmPasswordVisible)
final isConfirmPasswordVisibleProvider = IsConfirmPasswordVisibleProvider._();

final class IsConfirmPasswordVisibleProvider
    extends $NotifierProvider<IsConfirmPasswordVisible, bool> {
  IsConfirmPasswordVisibleProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'isConfirmPasswordVisibleProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isConfirmPasswordVisibleHash();

  @$internal
  @override
  IsConfirmPasswordVisible create() => IsConfirmPasswordVisible();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isConfirmPasswordVisibleHash() =>
    r'b572234afdd2a2a1f08a8f06fe096a5e4d87c383';

abstract class _$IsConfirmPasswordVisible extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<bool, bool>, bool, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

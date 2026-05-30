// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_form.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ForgotPasswordEmail)
final forgotPasswordEmailProvider = ForgotPasswordEmailProvider._();

final class ForgotPasswordEmailProvider
    extends $NotifierProvider<ForgotPasswordEmail, String> {
  ForgotPasswordEmailProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'forgotPasswordEmailProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$forgotPasswordEmailHash();

  @$internal
  @override
  ForgotPasswordEmail create() => ForgotPasswordEmail();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$forgotPasswordEmailHash() =>
    r'7368afe526e1314d6a819d3c5905d6feb484a5c0';

abstract class _$ForgotPasswordEmail extends $Notifier<String> {
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

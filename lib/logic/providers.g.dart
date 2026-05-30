// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ButtonStateNotifier)
final buttonStateProvider = ButtonStateNotifierFamily._();

final class ButtonStateNotifierProvider
    extends $NotifierProvider<ButtonStateNotifier, ButtonState> {
  ButtonStateNotifierProvider._(
      {required ButtonStateNotifierFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'buttonStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$buttonStateNotifierHash();

  @override
  String toString() {
    return r'buttonStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ButtonStateNotifier create() => ButtonStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ButtonState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ButtonState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ButtonStateNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$buttonStateNotifierHash() =>
    r'2d01ad3c4036910567caa36b1b7f946d09a090f8';

final class ButtonStateNotifierFamily extends $Family
    with
        $ClassFamilyOverride<ButtonStateNotifier, ButtonState, ButtonState,
            ButtonState, String> {
  ButtonStateNotifierFamily._()
      : super(
          retry: null,
          name: r'buttonStateProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ButtonStateNotifierProvider call(
    String buttonText,
  ) =>
      ButtonStateNotifierProvider._(argument: buttonText, from: this);

  @override
  String toString() => r'buttonStateProvider';
}

abstract class _$ButtonStateNotifier extends $Notifier<ButtonState> {
  late final _$args = ref.$arg as String;
  String get buttonText => _$args;

  ButtonState build(
    String buttonText,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ButtonState, ButtonState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ButtonState, ButtonState>, ButtonState, Object?, Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}

@ProviderFor(HoverButtonState)
final hoverButtonStateProvider = HoverButtonStateFamily._();

final class HoverButtonStateProvider
    extends $NotifierProvider<HoverButtonState, ButtonState> {
  HoverButtonStateProvider._(
      {required HoverButtonStateFamily super.from,
      required dynamic super.argument})
      : super(
          retry: null,
          name: r'hoverButtonStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$hoverButtonStateHash();

  @override
  String toString() {
    return r'hoverButtonStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  HoverButtonState create() => HoverButtonState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ButtonState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ButtonState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is HoverButtonStateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$hoverButtonStateHash() => r'043e5d79c7e7c5c62e68b7dbd488ed2038541dbc';

final class HoverButtonStateFamily extends $Family
    with
        $ClassFamilyOverride<HoverButtonState, ButtonState, ButtonState,
            ButtonState, dynamic> {
  HoverButtonStateFamily._()
      : super(
          retry: null,
          name: r'hoverButtonStateProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  HoverButtonStateProvider call(
    dynamic key,
  ) =>
      HoverButtonStateProvider._(argument: key, from: this);

  @override
  String toString() => r'hoverButtonStateProvider';
}

abstract class _$HoverButtonState extends $Notifier<ButtonState> {
  late final _$args = ref.$arg as dynamic;
  dynamic get key => _$args;

  ButtonState build(
    dynamic key,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ButtonState, ButtonState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ButtonState, ButtonState>, ButtonState, Object?, Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}

@ProviderFor(ScrollOffset)
final scrollOffsetProvider = ScrollOffsetProvider._();

final class ScrollOffsetProvider
    extends $NotifierProvider<ScrollOffset, double> {
  ScrollOffsetProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'scrollOffsetProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$scrollOffsetHash();

  @$internal
  @override
  ScrollOffset create() => ScrollOffset();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$scrollOffsetHash() => r'4b8dbd1031746c599e418ad23c484f0463828b7a';

abstract class _$ScrollOffset extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<double, double>, double, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(Scrolled)
final scrolledProvider = ScrolledProvider._();

final class ScrolledProvider extends $NotifierProvider<Scrolled, bool> {
  ScrolledProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'scrolledProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$scrolledHash();

  @$internal
  @override
  Scrolled create() => Scrolled();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$scrolledHash() => r'967cc362199a810adc5231be468e9bed3e991d45';

abstract class _$Scrolled extends $Notifier<bool> {
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

@ProviderFor(CurrentRoute)
final currentRouteProvider = CurrentRouteProvider._();

final class CurrentRouteProvider
    extends $NotifierProvider<CurrentRoute, String> {
  CurrentRouteProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'currentRouteProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$currentRouteHash();

  @$internal
  @override
  CurrentRoute create() => CurrentRoute();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$currentRouteHash() => r'30380064bef9995329f8322fa578eb58d6ac0652';

abstract class _$CurrentRoute extends $Notifier<String> {
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

@ProviderFor(SidebarExpansion)
final sidebarExpansionProvider = SidebarExpansionProvider._();

final class SidebarExpansionProvider
    extends $NotifierProvider<SidebarExpansion, bool> {
  SidebarExpansionProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sidebarExpansionProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sidebarExpansionHash();

  @$internal
  @override
  SidebarExpansion create() => SidebarExpansion();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$sidebarExpansionHash() => r'7fba0871e47075c785599b63fcb0febf1967465f';

abstract class _$SidebarExpansion extends $Notifier<bool> {
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

@ProviderFor(ImageIndex)
final imageIndexProvider = ImageIndexProvider._();

final class ImageIndexProvider extends $NotifierProvider<ImageIndex, int> {
  ImageIndexProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'imageIndexProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$imageIndexHash();

  @$internal
  @override
  ImageIndex create() => ImageIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$imageIndexHash() => r'36aca67e969e5303c4be1403134f42b9e55f85c7';

abstract class _$ImageIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element = ref.element
        as $ClassProviderElement<AnyNotifier<int, int>, int, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(BannerIndex)
final bannerIndexProvider = BannerIndexProvider._();

final class BannerIndexProvider extends $NotifierProvider<BannerIndex, int> {
  BannerIndexProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'bannerIndexProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$bannerIndexHash();

  @$internal
  @override
  BannerIndex create() => BannerIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$bannerIndexHash() => r'4c32d3571da91165895f445165c97d1c917d9a68';

abstract class _$BannerIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element = ref.element
        as $ClassProviderElement<AnyNotifier<int, int>, int, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(Carousel)
final carouselProvider = CarouselProvider._();

final class CarouselProvider extends $NotifierProvider<Carousel, int> {
  CarouselProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'carouselProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$carouselHash();

  @$internal
  @override
  Carousel create() => Carousel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$carouselHash() => r'6cfa0a1cdb4dcdead5cb77073aa2ac0f41eb963b';

abstract class _$Carousel extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element = ref.element
        as $ClassProviderElement<AnyNotifier<int, int>, int, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(WeddingMusicForm)
final weddingMusicFormProvider = WeddingMusicFormProvider._();

final class WeddingMusicFormProvider
    extends $NotifierProvider<WeddingMusicForm, WeddingMusicFormData> {
  WeddingMusicFormProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'weddingMusicFormProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$weddingMusicFormHash();

  @$internal
  @override
  WeddingMusicForm create() => WeddingMusicForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeddingMusicFormData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeddingMusicFormData>(value),
    );
  }
}

String _$weddingMusicFormHash() => r'174d4b4ff6f0108be58890f6f96b58b11d06b871';

abstract class _$WeddingMusicForm extends $Notifier<WeddingMusicFormData> {
  WeddingMusicFormData build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<WeddingMusicFormData, WeddingMusicFormData>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<WeddingMusicFormData, WeddingMusicFormData>,
        WeddingMusicFormData,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(FormName)
final formNameProvider = FormNameProvider._();

final class FormNameProvider extends $NotifierProvider<FormName, String> {
  FormNameProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'formNameProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$formNameHash();

  @$internal
  @override
  FormName create() => FormName();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$formNameHash() => r'11170b871801790760512ba39560336b3d19bd85';

abstract class _$FormName extends $Notifier<String> {
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

@ProviderFor(FormEmail)
final formEmailProvider = FormEmailProvider._();

final class FormEmailProvider extends $NotifierProvider<FormEmail, String> {
  FormEmailProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'formEmailProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$formEmailHash();

  @$internal
  @override
  FormEmail create() => FormEmail();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$formEmailHash() => r'28f4b7bcb0d7c164b016d4fb863624a1157abc24';

abstract class _$FormEmail extends $Notifier<String> {
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

@ProviderFor(FormPassword)
final formPasswordProvider = FormPasswordProvider._();

final class FormPasswordProvider
    extends $NotifierProvider<FormPassword, String> {
  FormPasswordProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'formPasswordProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$formPasswordHash();

  @$internal
  @override
  FormPassword create() => FormPassword();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$formPasswordHash() => r'b9a9742613a88ce06a023e83cf4ce6c81359c53c';

abstract class _$FormPassword extends $Notifier<String> {
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

@ProviderFor(FormConfirmPassword)
final formConfirmPasswordProvider = FormConfirmPasswordProvider._();

final class FormConfirmPasswordProvider
    extends $NotifierProvider<FormConfirmPassword, String> {
  FormConfirmPasswordProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'formConfirmPasswordProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$formConfirmPasswordHash();

  @$internal
  @override
  FormConfirmPassword create() => FormConfirmPassword();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$formConfirmPasswordHash() =>
    r'b2db6ca4566035dda1a8ed447605df554862b6bb';

abstract class _$FormConfirmPassword extends $Notifier<String> {
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

@ProviderFor(IsPasswordVisible)
final isPasswordVisibleProvider = IsPasswordVisibleProvider._();

final class IsPasswordVisibleProvider
    extends $NotifierProvider<IsPasswordVisible, bool> {
  IsPasswordVisibleProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'isPasswordVisibleProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isPasswordVisibleHash();

  @$internal
  @override
  IsPasswordVisible create() => IsPasswordVisible();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isPasswordVisibleHash() => r'07ba2d146bd22188fd6b5cf24ad8ba279d6157d4';

abstract class _$IsPasswordVisible extends $Notifier<bool> {
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

@ProviderFor(IsPasswordConfirmVisible)
final isPasswordConfirmVisibleProvider = IsPasswordConfirmVisibleProvider._();

final class IsPasswordConfirmVisibleProvider
    extends $NotifierProvider<IsPasswordConfirmVisible, bool> {
  IsPasswordConfirmVisibleProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'isPasswordConfirmVisibleProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isPasswordConfirmVisibleHash();

  @$internal
  @override
  IsPasswordConfirmVisible create() => IsPasswordConfirmVisible();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isPasswordConfirmVisibleHash() =>
    r'e508de508a3d645cf53ad8448f1abfc340d9d992';

abstract class _$IsPasswordConfirmVisible extends $Notifier<bool> {
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

@ProviderFor(Registration)
final registrationProvider = RegistrationProvider._();

final class RegistrationProvider
    extends $NotifierProvider<Registration, AsyncValue<void>> {
  RegistrationProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'registrationProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$registrationHash();

  @$internal
  @override
  Registration create() => Registration();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$registrationHash() => r'79e1249fa4916ba2d11de6f1b1851c5e6b309927';

abstract class _$Registration extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
        AsyncValue<void>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(Notes)
final notesProvider = NotesProvider._();

final class NotesProvider extends $NotifierProvider<Notes, NotesState> {
  NotesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'notesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$notesHash();

  @$internal
  @override
  Notes create() => Notes();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotesState>(value),
    );
  }
}

String _$notesHash() => r'6b9e900a7e946f55c61f5df5cdb97ebcce84beae';

abstract class _$Notes extends $Notifier<NotesState> {
  NotesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<NotesState, NotesState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<NotesState, NotesState>, NotesState, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CurrentFilter)
final currentFilterProvider = CurrentFilterProvider._();

final class CurrentFilterProvider
    extends $NotifierProvider<CurrentFilter, NotificationFilter> {
  CurrentFilterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'currentFilterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$currentFilterHash();

  @$internal
  @override
  CurrentFilter create() => CurrentFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationFilter>(value),
    );
  }
}

String _$currentFilterHash() => r'4868f871023d28aac98557dc875f12f77758ed06';

abstract class _$CurrentFilter extends $Notifier<NotificationFilter> {
  NotificationFilter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<NotificationFilter, NotificationFilter>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<NotificationFilter, NotificationFilter>,
        NotificationFilter,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CurrentOrder)
final currentOrderProvider = CurrentOrderProvider._();

final class CurrentOrderProvider
    extends $NotifierProvider<CurrentOrder, NotificationOrder> {
  CurrentOrderProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'currentOrderProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$currentOrderHash();

  @$internal
  @override
  CurrentOrder create() => CurrentOrder();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationOrder value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationOrder>(value),
    );
  }
}

String _$currentOrderHash() => r'9ee9619cc2ecd757b09bf92e63b64fe7bf8e0c5c';

abstract class _$CurrentOrder extends $Notifier<NotificationOrder> {
  NotificationOrder build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<NotificationOrder, NotificationOrder>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<NotificationOrder, NotificationOrder>,
        NotificationOrder,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(TextHover)
final textHoverProvider = TextHoverProvider._();

final class TextHoverProvider extends $NotifierProvider<TextHover, bool> {
  TextHoverProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'textHoverProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$textHoverHash();

  @$internal
  @override
  TextHover create() => TextHover();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$textHoverHash() => r'e25408a9026602e51d7482c917414bc441944733';

abstract class _$TextHover extends $Notifier<bool> {
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

@ProviderFor(Text2Hover)
final text2HoverProvider = Text2HoverProvider._();

final class Text2HoverProvider extends $NotifierProvider<Text2Hover, bool> {
  Text2HoverProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'text2HoverProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$text2HoverHash();

  @$internal
  @override
  Text2Hover create() => Text2Hover();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$text2HoverHash() => r'8a758d9b884828bb9da2b1c73fd83b8764258ddc';

abstract class _$Text2Hover extends $Notifier<bool> {
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

@ProviderFor(VideoController)
final videoControllerProvider = VideoControllerProvider._();

final class VideoControllerProvider
    extends $NotifierProvider<VideoController, VideoPlayerController?> {
  VideoControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'videoControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$videoControllerHash();

  @$internal
  @override
  VideoController create() => VideoController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VideoPlayerController? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VideoPlayerController?>(value),
    );
  }
}

String _$videoControllerHash() => r'0bf98de254a5d5c7351a7a47cb54595cacfb82aa';

abstract class _$VideoController extends $Notifier<VideoPlayerController?> {
  VideoPlayerController? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<VideoPlayerController?, VideoPlayerController?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<VideoPlayerController?, VideoPlayerController?>,
        VideoPlayerController?,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

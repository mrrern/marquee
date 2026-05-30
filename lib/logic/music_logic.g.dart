// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Music)
final musicProvider = MusicFamily._();

final class MusicProvider extends $AsyncNotifierProvider<Music, BodaMusic?> {
  MusicProvider._(
      {required MusicFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'musicProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$musicHash();

  @override
  String toString() {
    return r'musicProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Music create() => Music();

  @override
  bool operator ==(Object other) {
    return other is MusicProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$musicHash() => r'4f14e726e947861f400482f389f085fb1dd317ac';

final class MusicFamily extends $Family
    with
        $ClassFamilyOverride<Music, AsyncValue<BodaMusic?>, BodaMusic?,
            FutureOr<BodaMusic?>, int> {
  MusicFamily._()
      : super(
          retry: null,
          name: r'musicProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  MusicProvider call(
    int bodaId,
  ) =>
      MusicProvider._(argument: bodaId, from: this);

  @override
  String toString() => r'musicProvider';
}

abstract class _$Music extends $AsyncNotifier<BodaMusic?> {
  late final _$args = ref.$arg as int;
  int get bodaId => _$args;

  FutureOr<BodaMusic?> build(
    int bodaId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<BodaMusic?>, BodaMusic?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<BodaMusic?>, BodaMusic?>,
        AsyncValue<BodaMusic?>,
        Object?,
        Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}

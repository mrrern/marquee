// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AdminNotes)
final adminNotesProvider = AdminNotesProvider._();

final class AdminNotesProvider
    extends $AsyncNotifierProvider<AdminNotes, List<AdminNoteView>> {
  AdminNotesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'adminNotesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$adminNotesHash();

  @$internal
  @override
  AdminNotes create() => AdminNotes();
}

String _$adminNotesHash() => r'17a39c24363efa5759c9fed53f124ed75f4c0f23';

abstract class _$AdminNotes extends $AsyncNotifier<List<AdminNoteView>> {
  FutureOr<List<AdminNoteView>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<AdminNoteView>>, List<AdminNoteView>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<AdminNoteView>>, List<AdminNoteView>>,
        AsyncValue<List<AdminNoteView>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

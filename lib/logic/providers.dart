import 'dart:async';
import 'package:bodas/routes/exports.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'providers.g.dart';

// ---------------------------------------------------------------------------
// UI Notifiers (migrados de StateNotifier a @riverpod)
// ---------------------------------------------------------------------------

@riverpod
class ButtonStateNotifier extends _$ButtonStateNotifier {
  @override
  ButtonState build(String buttonText) =>
      ButtonState(isHovered: false, isSelected: false);

  void hover(bool isHovered) {
    if (!state.isSelected) state = state.copyWith(isHovered: isHovered);
  }

  void select() => state = state.copyWith(isSelected: true, isHovered: false);
}

// Para botones con clave dinámica genérica
@riverpod
class HoverButtonState extends _$HoverButtonState {
  @override
  ButtonState build(dynamic key) =>
      ButtonState(isHovered: false, isSelected: false);

  void hover(bool isHovered) {
    if (!state.isSelected) state = state.copyWith(isHovered: isHovered);
  }

  void select() => state = state.copyWith(isSelected: true, isHovered: false);
}

// Alias de compatibilidad para widgets que usan hoverButtonProvider
final hoverButtonProvider = hoverButtonStateProvider;

// Controller del scroll
final scrollControllerProvider = Provider.autoDispose<ScrollController>((ref) {
  final controller = ScrollController();
  ref.onDispose(controller.dispose);
  return controller;
});

// Scroll offset (posición del scroll)
@riverpod
class ScrollOffset extends _$ScrollOffset {
  @override
  double build() {
    final controller = ref.watch(scrollControllerProvider);
    controller.addListener(() {
      state = controller.offset * 0.2;
    });
    return 0;
  }
}

// Scroll scrolled (true/false)
@riverpod
class Scrolled extends _$Scrolled {
  @override
  bool build() {
    final controller = ref.watch(scrollControllerProvider);
    controller.addListener(() {
      state = controller.offset > 0;
    });
    return false;
  }
}

// Ruta actual
@riverpod
class CurrentRoute extends _$CurrentRoute {
  @override
  String build() => '/';

  void updateRoute(String newRoute) => state = newRoute;
}

// Sidebar expansion (autoDispose)
@Riverpod(keepAlive: false)
class SidebarExpansion extends _$SidebarExpansion {
  @override
  bool build() => true;

  void toggle() => state = !state;
  void expand() => state = true;
  void collapse() => state = false;
}

// Índice del banner (autoDispose)
@Riverpod(keepAlive: false)
class ImageIndex extends _$ImageIndex {
  @override
  int build() => 0;

  void setIndex(int index) => state = index;
}

// Imágenes del banner
final bannerImagesProvider =
    Provider<List<String>>((ref) => [img1, img2, img3]);

// Banner automático con timer
@Riverpod(keepAlive: false)
class BannerIndex extends _$BannerIndex {
  Timer? _timer;

  @override
  int build() {
    final images = ref.watch(bannerImagesProvider);
    _startTimer(images.length);
    ref.onDispose(() => _timer?.cancel());
    return 0;
  }

  void _startTimer(int total) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 8), (_) {
      state = (state + 1) % total;
    });
  }
}

// Carrusel
@riverpod
class Carousel extends _$Carousel {
  @override
  int build() => 0;

  void next() => state = (state + 1) % 2;
}

// ---------------------------------------------------------------------------
// Wedding Music Form (migrado de StateNotifier a @riverpod)
// ---------------------------------------------------------------------------

@riverpod
class WeddingMusicForm extends _$WeddingMusicForm {
  @override
  WeddingMusicFormData build() => WeddingMusicFormData();

  void updateEntranceMusic(String v) =>
      state = state.copyWith(entranceMusic: v);
  void updateBrideEntranceMusic(String v) =>
      state = state.copyWith(brideEntranceMusic: v);
  void updateGroomEntranceMusic(String v) =>
      state = state.copyWith(groomEntranceMusic: v);
  void updateRingExchangeMusic(String v) =>
      state = state.copyWith(ringExchangeMusic: v);
  void updateKissAndSignatureMusic(String v) =>
      state = state.copyWith(kissAndSignatureMusic: v);
  void updateCeremonyEndMusic(String v) =>
      state = state.copyWith(ceremonyEndMusic: v);
  void updateCocktailMusic(String v) =>
      state = state.copyWith(cocktailMusic: v);
  void updateCocktailMusicStyle(String v) =>
      state = state.copyWith(cocktailMusicStyle: v);
  void updateEntranceToHallMusic(String v) =>
      state = state.copyWith(entranceToHallMusic: v);
  void updateDinnerMusic(String v) => state = state.copyWith(dinnerMusic: v);
  void updateCakeCuttingMusic(String v) =>
      state = state.copyWith(cakeCuttingMusic: v);
  void updateGiftsMusic(String v) => state = state.copyWith(giftsMusic: v);
  void updateSurpriseMusic(String v) =>
      state = state.copyWith(surpriseMusic: v);
  void updateCouplesDanceMusic(String v) =>
      state = state.copyWith(couplesDanceMusic: v);
  void updateFirstOpenBarSong(String v) =>
      state = state.copyWith(firstOpenBarSong: v);
  void updateSelectedMusicType(int v) =>
      state = state.copyWith(selectecMusicType: v);
  void updateCoctelPlaylist(String v) =>
      state = state.copyWith(musicCoctelPlaylist: v);

  void addGroomSong(String song) {
    final trimmed = song.trim();
    if (trimmed.isNotEmpty) {
      state = state.copyWith(groomSongs: [...state.groomSongs, trimmed]);
    }
  }

  void removeGroomSong(int index) {
    final list = [...state.groomSongs];
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
      state = state.copyWith(groomSongs: list);
    }
  }

  void updateGroomSong(int index, String song) {
    final trimmed = song.trim();
    final list = [...state.groomSongs];
    if (index >= 0 && index < list.length && trimmed.isNotEmpty) {
      list[index] = trimmed;
      state = state.copyWith(groomSongs: list);
    }
  }

  void addBrideSong(String song) {
    final trimmed = song.trim();
    if (trimmed.isNotEmpty) {
      state = state.copyWith(brideSongs: [...state.brideSongs, trimmed]);
    }
  }

  void removeBrideSong(int index) {
    final list = [...state.brideSongs];
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
      state = state.copyWith(brideSongs: list);
    }
  }

  void updateBrideSong(int index, String song) {
    final trimmed = song.trim();
    final list = [...state.brideSongs];
    if (index >= 0 && index < list.length && trimmed.isNotEmpty) {
      list[index] = trimmed;
      state = state.copyWith(brideSongs: list);
    }
  }

  void toggleForeignGuests(bool v) =>
      state = state.copyWith(hasForeignGuests: v);
  void togglePlayForeignMusic(bool v) =>
      state = state.copyWith(playForeignMusic: v);
  void updateForeignMusicDetails(String v) =>
      state = state.copyWith(foreignMusicDetails: v);
  void toggleAcceptGuestRequests(bool v) =>
      state = state.copyWith(acceptGuestRequests: v);
  void toggleForbiddenSongs(bool v) =>
      state = state.copyWith(hasForbiddenSongs: v);
  void updateForbiddenSongs(String v) =>
      state = state.copyWith(forbiddenSongs: v);
  void updateLastSong(String v) => state = state.copyWith(lastSong: v);
  void updateAdditionalNotes(String v) =>
      state = state.copyWith(additionalNotes: v);

  void updateReadingName(int index, String newName) {
    final list = [...?state.lectures];
    list[index] = list[index].copyWith(name: newName);
    state = state.copyWith(lectures: list);
  }

  void updateReadingOption(int index, String newOption) {
    final list = [...?state.lectures];
    list[index] = list[index].copyWith(selectedOption: newOption);
    state = state.copyWith(lectures: list);
  }

  void addExtraReading() {
    final list = [...?state.musicLecExt];
    list.add(CeremonyReading(
        name: "", selectedOption: "Nosotros nos encargamos"));
    state = state.copyWith(musicLecExt: list);
  }

  void removeExtraReading(int index) {
    if (state.musicLecExt == null || state.musicLecExt!.isEmpty) return;
    final list = [...?state.musicLecExt];
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
      state = state.copyWith(musicLecExt: list);
    }
  }

  void updateExtraReadingName(int index, String newName) {
    if (state.musicLecExt == null) return;
    final list = [...?state.musicLecExt];
    if (index >= 0 && index < list.length) {
      list[index] = list[index].copyWith(name: newName);
      state = state.copyWith(musicLecExt: list);
    }
  }
}

// Alias de compatibilidad — el provider generado se llama weddingMusicFormProvider
// (de la clase WeddingMusicForm con @riverpod) y está disponible directamente.

// ---------------------------------------------------------------------------
// Form field providers — migrados a @riverpod
// ---------------------------------------------------------------------------

@riverpod
class FormName extends _$FormName {
  @override
  String build() => '';
  void set(String v) => state = v;
}

@riverpod
class FormEmail extends _$FormEmail {
  @override
  String build() => '';
  void set(String v) => state = v;
}

@riverpod
class FormPassword extends _$FormPassword {
  @override
  String build() => '';
  void set(String v) => state = v;
}

@riverpod
class FormConfirmPassword extends _$FormConfirmPassword {
  @override
  String build() => '';
  void set(String v) => state = v;
}

@riverpod
class IsPasswordVisible extends _$IsPasswordVisible {
  @override
  bool build() => false;
  void toggle() => state = !state;
}

@riverpod
class IsPasswordConfirmVisible extends _$IsPasswordConfirmVisible {
  @override
  bool build() => false;
  void toggle() => state = !state;
}

// Los providers de formulario se acceden directamente como formNameProvider,
// formEmailProvider, etc. generados por @riverpod desde las clases de arriba.

// Aliases de compatibilidad para widgets existentes
// Los @riverpod generators producen: formNameProvider, formEmailProvider, etc.
final nameProvider = formNameProvider;
final emailProvider = formEmailProvider;
final passwordProvider = formPasswordProvider;
final confirmPasswordProvider = formConfirmPasswordProvider;
// isPasswordVisibleProvider e isPasswordConfirmVisibleProvider son generados
// directamente por las clases IsPasswordVisible e IsPasswordConfirmVisible.


// Validation providers (puros, derivados — Provider sigue permitido para computed)
final nameErrorProvider = Provider<String?>((ref) {
  final name = ref.watch(formNameProvider);
  if (name.isEmpty) return 'El nombre es requerido';
  if (name.length < 3) return 'El nombre debe tener al menos 3 caracteres';
  return null;
});

final emailErrorProvider = Provider<String?>((ref) {
  final email = ref.watch(formEmailProvider);
  if (email.isEmpty) return null;
  if (!email.contains('@')) return 'Email inválido';
  return null;
});

final passwordErrorProvider = Provider<String?>((ref) {
  final password = ref.watch(formPasswordProvider);
  if (password.isEmpty) return null;
  if (password.length < 6) return 'La contraseña debe tener al menos 6 caracteres';
  return null;
});

final passwordConfirmErrorProvider = Provider<String?>((ref) {
  final password = ref.watch(formConfirmPasswordProvider);
  if (password.isEmpty) return 'La contraseña es requerida';
  if (password.length < 6) return 'La contraseña debe tener al menos 6 caracteres';
  if (password != ref.watch(formPasswordProvider)) return 'Las contraseñas no coinciden';
  return null;
});

final isFormValidProvider = Provider<bool>((ref) {
  return ref.watch(nameErrorProvider) == null &&
      ref.watch(emailErrorProvider) == null &&
      ref.watch(passwordErrorProvider) == null &&
      ref.watch(passwordConfirmErrorProvider) == null;
});

final isFormValidLoginProvider = Provider<bool>((ref) {
  return ref.watch(emailErrorProvider) == null &&
      ref.watch(passwordErrorProvider) == null;
});

final isFormValidRegisterProvider = Provider<bool>((ref) {
  return ref.watch(nameErrorProvider) == null &&
      ref.watch(emailErrorProvider) == null &&
      ref.watch(passwordErrorProvider) == null &&
      ref.watch(passwordConfirmErrorProvider) == null;
});

// ---------------------------------------------------------------------------
// Registration
// ---------------------------------------------------------------------------

@riverpod
class Registration extends _$Registration {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> register(String email, String password) async {
    state = const AsyncLoading();
    try {
      await Future.delayed(const Duration(seconds: 2));
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

// El provider generado se llama registrationProvider (de clase Registration con @riverpod).

// ---------------------------------------------------------------------------
// Notes (listado del usuario)
// ---------------------------------------------------------------------------

// State class for notes
class NotesState {
  final List<NotesModel> notes;
  final int currentPage;
  final int notesPerPage;

  NotesState({
    this.notes = const [],
    this.currentPage = 1,
    this.notesPerPage = 4,
  });

  int get totalPages {
    if (notes.isEmpty) return 1;
    return (notes.length / notesPerPage).ceil();
  }

  List<NotesModel> get currentPageNotes {
    if (notes.isEmpty) return [];
    final startIndex = (currentPage - 1) * notesPerPage;
    final endIndex = startIndex + notesPerPage > notes.length
        ? notes.length
        : startIndex + notesPerPage;
    if (startIndex >= notes.length) return [];
    return notes.sublist(startIndex, endIndex);
  }

  NotesState copyWith({
    List<NotesModel>? notes,
    int? currentPage,
    int? notesPerPage,
  }) {
    return NotesState(
      notes: notes ?? this.notes,
      currentPage: currentPage ?? this.currentPage,
      notesPerPage: notesPerPage ?? this.notesPerPage,
    );
  }
}

@riverpod
class Notes extends _$Notes {
  final NotesLogic _logic = NotesLogic();

  @override
  NotesState build() => NotesState();

  Future<void> addNote({
    required int bodaId,
    required String title,
    required String description,
    String? file,
    Map<String, dynamic>? images = const {},
  }) async {
    final note = await _logic.createNote(
      bodaId: bodaId,
      title: title,
      description: description,
      file: file,
      images: images,
    );
    state = state.copyWith(notes: [note, ...state.notes]);
  }

  Future<void> loadNotes({required int bodaId}) async {
    final notes = await _logic.getNotesByBodaId(bodaId);
    state = state.copyWith(notes: notes);
  }

  void changePage(int page) {
    if (page < 1 || page > state.totalPages) return;
    state = state.copyWith(currentPage: page);
  }

  void updateNotesPerPage(int count) =>
      state = state.copyWith(notesPerPage: count);

  Future<void> deleteNote(int id) async {
    await _logic.deleteNote(id);
    state =
        state.copyWith(notes: state.notes.where((n) => n.id != id).toList());
  }
}

// El provider generado se llama notesProvider (de clase Notes con @riverpod).

// Provider for responsive notes per page
final responsiveNotesPerPageProvider =
    Provider.family<int, bool>((ref, isMobile) {
  return isMobile ? 2 : 4;
});

// ---------------------------------------------------------------------------
// Notification filters (ya estaban con @riverpod)
// ---------------------------------------------------------------------------

/// Enumeración para los tipos de filtro de notificaciones
enum NotificationFilter { all, unread, important }

/// Enumeración para el orden de las notificaciones
enum NotificationOrder { newest, oldest }

@riverpod
class CurrentFilter extends _$CurrentFilter {
  @override
  NotificationFilter build() => NotificationFilter.all;

  void setFilter(NotificationFilter filter) => state = filter;
}

@riverpod
class CurrentOrder extends _$CurrentOrder {
  @override
  NotificationOrder build() => NotificationOrder.newest;

  void setOrder(NotificationOrder order) => state = order;
}

// ---------------------------------------------------------------------------
// Hover providers simples
// ---------------------------------------------------------------------------

@riverpod
class TextHover extends _$TextHover {
  @override
  bool build() => false;
  void toggle(bool v) => state = v;
}

@riverpod
class Text2Hover extends _$Text2Hover {
  @override
  bool build() => false;
  void toggle(bool v) => state = v;
}

// Los providers se acceden como textHoverProvider / text2HoverProvider
// directamente (generados por @riverpod de TextHover / Text2Hover).

// ---------------------------------------------------------------------------
// Auth service
// ---------------------------------------------------------------------------

final authServiceProvider = Provider((ref) => AuthService());
// Los aliases authProvider y authInfoProvider se definen en exports.dart.

// ---------------------------------------------------------------------------
// Video controller
// ---------------------------------------------------------------------------

@Riverpod(keepAlive: false)
class VideoController extends _$VideoController {
  @override
  VideoPlayerController? build() => null;

  Future<void> initializeVideo(String videoUrl) async {
    state?.dispose();
    final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    await controller.initialize();
    controller.setLooping(true);
    state = controller;
  }
}

// Typedef para compatibilidad con widgets que usan WeddingMusicFormNotifier como tipo
typedef WeddingMusicFormNotifier = WeddingMusicForm;

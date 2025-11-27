import 'package:bodas/routes/linkspaper.dart';
import 'package:video_player/video_player.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

// Proveedor de estado para cada botón
final buttonStateProvider =
    StateNotifierProvider.family<ButtonStateNotifier, ButtonState, String>(
        (ref, buttonText) {
  return ButtonStateNotifier();
});

final hoverButtonProvider =
    StateNotifierProvider.family<ButtonStateNotifier, ButtonState, dynamic>(
  (ref, text) => ButtonStateNotifier(),
);

//controller del scroll
final scrollControllerProvider = Provider.autoDispose<ScrollController>((ref) {
  return ScrollController();
});

//Maneja el state del scroll false y true
final StateProvider<bool> scrolledProvider = StateProvider<bool>((ref) {
  final scrollController = ref.watch(scrollControllerProvider);
  bool scrolled = false;

  scrollController.addListener(() {
    if (scrollController.offset > 0) {
      scrolled = true;
    } else {
      scrolled = false;
    }
    ref.read(scrolledProvider.notifier).state = scrolled;
  });

  return scrolled;
});

//Maneja la ruta en la que se encuentra
final currentRouteProvider =
    StateNotifierProvider<CurrentRouteNotifier, String>((ref) {
  return CurrentRouteNotifier();
});

// Proveedor para el estado de expansión del sidebar
final sidebarExpansionProvider =
    StateNotifierProvider.autoDispose<SidebarExpansionNotifier, bool>(
        (ref) => SidebarExpansionNotifier());

//Provider que maneja el scroll rpincipal
final scrollOffsetProvider =
    StateNotifierProvider<ScrollOffsetNotifier, double>(
  (ref) => ScrollOffsetNotifier(ref),
);

//banner dinamico
final imageIndexProvider = StateProvider.autoDispose<int>((ref) {
  // Initialize with 0 and ensure it's disposed properly
  ref.onDispose(() {
    // Cleanup if needed
  });
  return 0;
});

// Proveedor para las imágenes del banner
final bannerImagesProvider =
    Provider<List<String>>((ref) => [img1, img2, img3]);

// Proveedor para el índice del banner
final bannerIndexProvider =
    StateNotifierProvider.autoDispose<BannerIndexNotifier, int>((ref) {
  final images = ref.watch(bannerImagesProvider);
  return BannerIndexNotifier(images);
});

//Maneja el carrusel del final
final carouselProvider = StateNotifierProvider<CarouselNotifier, int>((ref) {
  return CarouselNotifier();
});

/// Provider for managing the wedding music form state
final weddingMusicFormProvider =
    StateNotifierProvider<WeddingMusicFormNotifier, WeddingMusicFormData>(
  (ref) => WeddingMusicFormNotifier(),
);

/// Notifier class for wedding music form state
class WeddingMusicFormNotifier extends StateNotifier<WeddingMusicFormData> {
  WeddingMusicFormNotifier() : super(WeddingMusicFormData());

  /// Update entrance music
  void updateEntranceMusic(String value) {
    state = state.copyWith(entranceMusic: value);
  }

  /// Update bride entrance music
  void updateBrideEntranceMusic(String value) {
    state = state.copyWith(brideEntranceMusic: value);
  }

  /// Update groom entrance music
  void updateGroomEntranceMusic(String value) {
    state = state.copyWith(groomEntranceMusic: value);
  }

  /// Update ring exchange music
  void updateRingExchangeMusic(String value) {
    state = state.copyWith(ringExchangeMusic: value);
  }

  /// Update kiss and signature music
  void updateKissAndSignatureMusic(String value) {
    state = state.copyWith(kissAndSignatureMusic: value);
  }

  /// Update ceremony end music
  void updateCeremonyEndMusic(String value) {
    state = state.copyWith(ceremonyEndMusic: value);
  }

  /// Update cocktail music
  void updateCocktailMusic(String value) {
    state = state.copyWith(cocktailMusic: value);
  }

  /// Update cocktail music style
  void updateCocktailMusicStyle(String value) {
    state = state.copyWith(cocktailMusicStyle: value);
  }

  /// Update entrance to hall music
  void updateEntranceToHallMusic(String value) {
    state = state.copyWith(entranceToHallMusic: value);
  }

  /// Update dinner music
  void updateDinnerMusic(String value) {
    state = state.copyWith(dinnerMusic: value);
  }

  /// Update cake cutting music
  void updateCakeCuttingMusic(String value) {
    state = state.copyWith(cakeCuttingMusic: value);
  }

  /// Update gifts music
  void updateGiftsMusic(String value) {
    state = state.copyWith(giftsMusic: value);
  }

  /// Update surprise music
  void updateSurpriseMusic(String value) {
    state = state.copyWith(surpriseMusic: value);
  }

  /// Update couples dance music
  void updateCouplesDanceMusic(String value) {
    state = state.copyWith(couplesDanceMusic: value);
  }

  /// Update first open bar song
  void updateFirstOpenBarSong(String value) {
    state = state.copyWith(firstOpenBarSong: value);
  }

  //Select type
  void updateSelectedMusicType(int value) {
    state = state.copyWith(selectecMusicType: value);
  }

  /// Add a song to groom's list
  void addGroomSong(String song) {
    // Trim the song to remove leading/trailing whitespace
    final trimmedSong = song.trim();
    if (trimmedSong.isNotEmpty) {
      final updatedList = [...state.groomSongs, trimmedSong];
      state = state.copyWith(groomSongs: updatedList);
    }
  }

  /// Remove a song from groom's list
  void removeGroomSong(int index) {
    final updatedList = [...state.groomSongs];
    if (index >= 0 && index < updatedList.length) {
      updatedList.removeAt(index);
      state = state.copyWith(groomSongs: updatedList);
    }
  }

  /// Update a song in groom's list
  void updateGroomSong(int index, String song) {
    // Trim the song to remove leading/trailing whitespace
    final trimmedSong = song.trim();
    final updatedList = [...state.groomSongs];
    if (index >= 0 && index < updatedList.length && trimmedSong.isNotEmpty) {
      updatedList[index] = trimmedSong;
      state = state.copyWith(groomSongs: updatedList);
    }
  }

  /// Add a song to bride's list
  void addBrideSong(String song) {
    // Trim the song to remove leading/trailing whitespace
    final trimmedSong = song.trim();
    if (trimmedSong.isNotEmpty) {
      final updatedList = [...state.brideSongs, trimmedSong];
      state = state.copyWith(brideSongs: updatedList);
    }
  }

  /// Remove a song from bride's list
  void removeBrideSong(int index) {
    final updatedList = [...state.brideSongs];
    if (index >= 0 && index < updatedList.length) {
      updatedList.removeAt(index);
      state = state.copyWith(brideSongs: updatedList);
    }
  }

  /// Update a song in bride's list
  void updateBrideSong(int index, String song) {
    // Trim the song to remove leading/trailing whitespace
    final trimmedSong = song.trim();
    final updatedList = [...state.brideSongs];
    if (index >= 0 && index < updatedList.length && trimmedSong.isNotEmpty) {
      updatedList[index] = trimmedSong;
      state = state.copyWith(brideSongs: updatedList);
    }
  }

  /// Toggle foreign guests
  void toggleForeignGuests(bool value) {
    state = state.copyWith(hasForeignGuests: value);
  }

  /// Toggle play foreign music
  void togglePlayForeignMusic(bool value) {
    state = state.copyWith(playForeignMusic: value);
  }

  /// Update foreign music details
  void updateForeignMusicDetails(String value) {
    state = state.copyWith(foreignMusicDetails: value);
  }

  /// Toggle accept guest requests
  void toggleAcceptGuestRequests(bool value) {
    state = state.copyWith(acceptGuestRequests: value);
  }

  /// Toggle forbidden songs
  void toggleForbiddenSongs(bool value) {
    state = state.copyWith(hasForbiddenSongs: value);
  }

  /// Update forbidden songs
  void updateForbiddenSongs(String value) {
    state = state.copyWith(forbiddenSongs: value);
  }

  /// Update last song
  void updateLastSong(String value) {
    state = state.copyWith(lastSong: value);
  }

  /// Update additional notes
  void updateAdditionalNotes(String value) {
    state = state.copyWith(additionalNotes: value);
  }

  void updateReadingName(int index, String newName) {
    final updatedReadings = [...?state.lectures];
    updatedReadings[index] = updatedReadings[index].copyWith(name: newName);
    state = state.copyWith(lectures: updatedReadings);
  }

  void updateReadingOption(int index, String newOption) {
    final updatedReadings = [...?state.lectures];
    updatedReadings[index] =
        updatedReadings[index].copyWith(selectedOption: newOption);
    state = state.copyWith(lectures: updatedReadings);
  }

  /// Update cocktail playlist
  void updateCoctelPlaylist(String value) {
    state = state.copyWith(musicCoctelPlaylist: value);
  }

  /// Add a new extra reading row
  void addExtraReading() {
    final updatedExtReadings = [...?state.musicLecExt];
    updatedExtReadings.add(CeremonyReading(
      name: "",
      selectedOption: "Nosotros nos encargamos",
    ));
    state = state.copyWith(musicLecExt: updatedExtReadings);
  }

  /// Remove an extra reading row
  void removeExtraReading(int index) {
    if (state.musicLecExt == null || state.musicLecExt!.isEmpty) return;
    final updatedExtReadings = [...?state.musicLecExt];
    if (index >= 0 && index < updatedExtReadings.length) {
      updatedExtReadings.removeAt(index);
      state = state.copyWith(musicLecExt: updatedExtReadings);
    }
  }

  /// Update an extra reading name
  void updateExtraReadingName(int index, String newName) {
    if (state.musicLecExt == null) return;
    final updatedExtReadings = [...?state.musicLecExt];
    if (index >= 0 && index < updatedExtReadings.length) {
      updatedExtReadings[index] =
          updatedExtReadings[index].copyWith(name: newName);
      state = state.copyWith(musicLecExt: updatedExtReadings);
    }
  }

  /// Save form data
  Future<bool> saveForm() async {
    return true;
  }
}

// State providers for form fields
final nameProvider = StateProvider<String>((ref) => '');
final emailProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');
final confirmPasswordProvider = StateProvider<String>((ref) => '');
final isPasswordVisibleProvider = StateProvider<bool>((ref) => false);
final isPasswordConfirmVisibleProvider = StateProvider<bool>((ref) => false);

// Validation providers
final nameErrorProvider = StateProvider<String?>((ref) {
  final name = ref.watch(nameProvider);

  if (name.isEmpty) {
    return 'El nombre es requerido';
  }

  if (name.length < 3) {
    return 'El nombre debe tener al menos 3 caracteres';
  }

  return null; // No error
});

final emailErrorProvider = Provider<String?>((ref) {
  final email = ref.watch(emailProvider);
  if (email.isEmpty) return null;
  if (!email.contains('@')) return 'Email inválido';
  return null;
});

final passwordErrorProvider = Provider<String?>((ref) {
  final password = ref.watch(passwordProvider);
  if (password.isEmpty) return null;
  if (password.length < 6) {
    return 'La contraseña debe tener al menos 6 caracteres';
  }
  return null;
});

final passwordConfirmErrorProvider = StateProvider<String?>((ref) {
  final password = ref.watch(confirmPasswordProvider);

  if (password.isEmpty) {
    return 'La contraseña es requerida';
  }

  if (password.length < 6) {
    return 'La contraseña debe tener al menos 6 caracteres';
  }

  if (password != ref.watch(passwordProvider)) {
    return 'Las contraseñas no coinciden';
  }

  return null; // No error
});

// Form validity provider
final isFormValidProvider = Provider<bool>((ref) {
  final nameError = ref.watch(nameErrorProvider);
  final emailError = ref.watch(emailErrorProvider);
  final passwordError = ref.watch(passwordErrorProvider);
  final confirmPasswordError = ref.watch(passwordConfirmErrorProvider);

  // Form is valid when there are no errors
  return nameError == null &&
      emailError == null &&
      passwordError == null &&
      confirmPasswordError == null;
});

final isFormValidLoginProvider = Provider<bool>((ref) {
  final emailError = ref.watch(emailErrorProvider);
  final passwordError = ref.watch(passwordErrorProvider);

  return emailError == null && passwordError == null;
});

// Form validity Register provider
final isFormValidRegisterProvider = Provider<bool>((ref) {
  final nameError = ref.watch(nameErrorProvider);
  final emailError = ref.watch(emailErrorProvider);
  final passwordError = ref.watch(passwordErrorProvider);
  final confirmPasswordError = ref.watch(passwordConfirmErrorProvider);

  // Form is valid when there are no errors
  return nameError == null &&
      emailError == null &&
      passwordError == null &&
      confirmPasswordError == null;
});

// Proveedor de estado para el formulario de registro
final registrationProvider =
    StateNotifierProvider<RegistrationNotifier, AsyncValue<void>>(
  (ref) => RegistrationNotifier(),
);

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

// Notifier class
class NotesNotifier extends StateNotifier<NotesState> {
  final NotesLogic _logic = NotesLogic();

  NotesNotifier() : super(NotesState());

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
    // Agrega la nueva nota al principio de la lista
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

  void updateNotesPerPage(int count) {
    state = state.copyWith(notesPerPage: count);
  }

  Future<void> deleteNote(int id) async {
    await _logic.deleteNote(id);
    state =
        state.copyWith(notes: state.notes.where((n) => n.id != id).toList());
  }
}

// Provider
final notesProvider = StateNotifierProvider<NotesNotifier, NotesState>((ref) {
  return NotesNotifier();
});

// Provider for responsive notes per page
final responsiveNotesPerPageProvider =
    Provider.family<int, bool>((ref, isMobile) {
  return isMobile ? 2 : 4;
});

/// Enumeración para los tipos de filtro de notificaciones
enum NotificationFilter {
  all,
  unread,
  important,
}

/// Enumeración para el orden de las notificaciones
enum NotificationOrder {
  newest,
  oldest,
}

/// Provider para el filtro actual de notificaciones
@riverpod
class CurrentFilter extends _$CurrentFilter {
  @override
  NotificationFilter build() {
    return NotificationFilter.all;
  }

  void setFilter(NotificationFilter filter) {
    state = filter;
  }
}

/// Provider para el orden actual de notificaciones
@riverpod
class CurrentOrder extends _$CurrentOrder {
  @override
  NotificationOrder build() {
    return NotificationOrder.newest;
  }

  void setOrder(NotificationOrder order) {
    state = order;
  }
}

final textHoverProvider = StateProvider<bool>((ref) => false);
final text2HoverProvider = StateProvider<bool>((ref) => false);

final authServiceProvider = Provider((ref) => AuthService());

final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<UserModel?>>((ref) {
  return AuthNotifier(ref);
});

final authInfoProvider =
    StateNotifierProvider<AuthInfoNotifier, AsyncValue<UserInfo?>>(
  (ref) => AuthInfoNotifier(ref),
);

// Provider para el controlador de video
final videoControllerProvider = StateNotifierProvider.autoDispose<
    VideoControllerNotifier, VideoPlayerController?>((ref) {
  return VideoControllerNotifier();
});

class VideoControllerNotifier extends StateNotifier<VideoPlayerController?> {
  VideoControllerNotifier() : super(null);

  Future<void> initializeVideo(String videoUrl) async {
    final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    await controller.initialize();
    controller.play;
    controller.setLooping(true);
    state = controller;
  }

  @override
  void dispose() {
    state?.dispose();
    super.dispose();
  }
}

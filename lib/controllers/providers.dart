import 'package:bodas/routes/linkspaper.dart';
import 'package:uuid/uuid.dart';

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
final sidebarExpansionProvider = StateNotifierProvider.autoDispose<
    SidebarExpansionNotifier, bool>((ref) => SidebarExpansionNotifier());

    
//Provider que maneja el scroll rpincipal
final scrollOffsetProvider = StateNotifierProvider<ScrollOffsetNotifier, double>(
  (ref) => ScrollOffsetNotifier(ref),
);

//banner dinamico
final imageIndexProvider = StateProvider.autoDispose<int>((ref) => 0);

//provider video principal
final youtubeControllerProvider = StateNotifierProvider.autoDispose<YoutubeControllerNotifier, YoutubeWebPlayerController?>(
  (ref) => YoutubeControllerNotifier(),
);

// Proveedor para las imágenes del banner
final bannerImagesProvider = Provider<List<String>>((ref) => [img1, img2, img3]);

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
  void updateSelectedMusicType(String value) {
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
    final updatedReadings = [...?state.readers];
    updatedReadings[index] = updatedReadings[index].copyWith(name: newName);
    state = state.copyWith(readers: updatedReadings);
  }

  void updateReadingOption(int index, String newOption) {
    final updatedReadings = [...?state.readers];
    updatedReadings[index] =
        updatedReadings[index].copyWith(selectedOption: newOption);
    state = state.copyWith(readers: updatedReadings);
  }

  /// Save form data
  Future<bool> saveForm() async {
    // Here you would typically send the data to a backend service
    // For now, we'll just return true to simulate a successful save
    return true;
  }
}

// State providers for form fields
final emailProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');
final confirmPasswordProvider = StateProvider<String>((ref) => '');
final isPasswordVisibleProvider = StateProvider<bool>((ref) => false);
final isPasswordConfirmVisibleProvider = StateProvider<bool>((ref) => false);

// Validation providers
final emailErrorProvider = StateProvider<String?>((ref) {
  final email = ref.watch(emailProvider);

  if (email.isEmpty) {
    return 'El email es requerido';
  }

  // Simple email validation regex
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(email)) {
    return 'Ingrese un email válido';
  }

  return null; // No error
});

final passwordErrorProvider = StateProvider<String?>((ref) {
  final password = ref.watch(passwordProvider);

  if (password.isEmpty) {
    return 'La contraseña es requerida';
  }

  if (password.length < 6) {
    return 'La contraseña debe tener al menos 6 caracteres';
  }

  return null; // No error
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
  final emailError = ref.watch(emailErrorProvider);
  final passwordError = ref.watch(passwordErrorProvider);

  // Form is valid when there are no errors
  return emailError == null && passwordError == null;
});

// Form validity Register provider
final isFormValidRegisterProvider = Provider<bool>((ref) {
  final emailError = ref.watch(emailErrorProvider);
  final passwordError = ref.watch(passwordErrorProvider);

  // Form is valid when there are no errors
  return emailError == null && passwordError == null;
});

// Proveedor de estado para el formulario de registro
final registrationProvider =
    StateNotifierProvider<RegistrationNotifier, AsyncValue<void>>(
  (ref) => RegistrationNotifier(),
);



// State class for notes
class NotesState {
  final List<NoteModel> notes;
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

  List<NoteModel> get currentPageNotes {
    if (notes.isEmpty) return [];

    final startIndex = (currentPage - 1) * notesPerPage;
    final endIndex = startIndex + notesPerPage > notes.length
        ? notes.length
        : startIndex + notesPerPage;

    if (startIndex >= notes.length) return [];
    return notes.sublist(startIndex, endIndex);
  }

  NotesState copyWith({
    List<NoteModel>? notes,
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
  NotesNotifier() : super(NotesState()) {
    // Initialize with a sample note
    addNote(
      content: 'Deja aquí tus dudas.',
      userName: 'Erika Rivas',
      userAvatar: 'assets/images/user_avatar.png',
    );
  }

  void addNote({
    required String content,
    required String userName,
    required String userAvatar,
    List<String> images = const [],
  }) {
    final newNote = NoteModel(
      id: const Uuid().v4(),
      userName: userName,
      userAvatar: userAvatar,
      date: DateTime.now(),
      content: content,
      images: images,
    );

    final updatedNotes = [...state.notes, newNote];
    state = state.copyWith(notes: updatedNotes);
  }

  void changePage(int page) {
    if (page < 1 || page > state.totalPages) return;
    state = state.copyWith(currentPage: page);
  }

  void updateNotesPerPage(int count) {
    state = state.copyWith(notesPerPage: count);
  }

  void deleteNote(String id) {
    final updatedNotes = state.notes.where((note) => note.id != id).toList();
    state = state.copyWith(notes: updatedNotes);
  }
}

// Provider
final notesProvider = StateNotifierProvider<NotesNotifier, NotesState>((ref) {
  return NotesNotifier();
});

// Provider for responsive notes per page
final responsiveNotesPerPageProvider = Provider.family<int, bool>((ref, isMobile) {
  return isMobile ? 2 : 4;
});
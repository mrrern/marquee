import 'package:bodas/routes/linkspaper.dart';
import 'package:uuid/uuid.dart';

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

/// Provider para la lista de notificaciones
@riverpod
class NotificationList extends _$NotificationList {
  @override
  List<NotificationModel> build() {
    // Datos de ejemplo para las notificaciones
    return [
      NotificationModel(
        id: '1',
        title: 'Notificación, archivo de contrato adjunto',
        content: '¡Enhorabuena! Has completado el proceso de contratación. Hemos adjuntado el contrato para que lo revises y firmes digitalmente. Una vez firmado, recibirás una copia en tu correo electrónico.',
        date: DateTime.now().subtract(const Duration(minutes: 2)),
        isRead: false,
        filterType: 'Todos',
      ),
      NotificationModel(
        id: '2',
        title: 'Notificación, segundo paso completado',
        content: 'Felicidades has completado el segundo paso, ahora puedes continuar con la selección de música para tu evento. Recuerda que puedes modificar tus selecciones en cualquier momento antes de la fecha límite.',
        date: DateTime.now().subtract(const Duration(days: 1)),
        isRead: true,
        filterType: 'Todos',
      ),
      NotificationModel(
        id: '3',
        title: 'Notificación, archivo de contrato adjunto',
        content: 'Gracias por completar el primer paso, a continuación hemos adjuntado el contrato preliminar para tu revisión. Por favor, revisa los detalles y comunícate con nosotros si tienes alguna pregunta o requieres modificaciones.',
        date: DateTime.now().subtract(const Duration(days: 1)),
        isRead: true,
        filterType: 'Todos',
      ),
      NotificationModel(
        id: '4',
        title: 'Notificación, primer paso completado',
        content: 'Felicidades has completado el primer paso, En las próximas 2 horas recibirás un correo electrónico con la confirmación y los siguientes pasos a seguir. Recuerda revisar tu bandeja de entrada y carpeta de spam.',
        date: DateTime.now().subtract(const Duration(days: 2)),
        isRead: true,
        filterType: 'Todos',
      ),
      NotificationModel(
        id: '5',
        title: 'Notificación, archivo de cotización adjunto',
        content: 'Gracias por su paciencia hemos adjuntado la cotización según la información proporcionada. Esta cotización es válida por 15 días. Si deseas proceder, por favor completa el formulario de confirmación adjunto.',
        date: DateTime.now().subtract(const Duration(days: 2)),
        isRead: true,
        filterType: 'Todos',
      ),
    ];
  }

  /// Marca una notificación como leída
  void markAsRead(String id) {
    state = state.map((notification) {
      if (notification.id == id) {
        return notification.copyWith(isRead: true);
      }
      return notification;
    }).toList();
  }

  /// Marca todas las notificaciones como leídas
  void markAllAsRead() {
    state = state.map((notification) => notification.copyWith(isRead: true)).toList();
  }

  /// Filtra las notificaciones según el filtro actual
  List<NotificationModel> getFilteredNotifications(NotificationFilter filter) {
    switch (filter) {
      case NotificationFilter.all:
        return state;
      case NotificationFilter.unread:
        return state.where((notification) => !notification.isRead).toList();
      case NotificationFilter.important:
        return state.where((notification) => notification.filterType == 'Importante').toList();
    }
  }

  /// Ordena las notificaciones según el orden actual
  List<NotificationModel> getSortedNotifications(
      NotificationOrder order, List<NotificationModel> notifications) {
    final sortedList = List<NotificationModel>.from(notifications);

    switch (order) {
      case NotificationOrder.newest:
        sortedList.sort((a, b) => b.date.compareTo(a.date));
        break;
      case NotificationOrder.oldest:
        sortedList.sort((a, b) => a.date.compareTo(b.date));
        break;
    }

    return sortedList;
  }
}

/// Provider para obtener notificaciones filtradas y ordenadas
@riverpod
List<NotificationModel> filteredAndSortedNotifications(Ref ref) {
  final notifications = ref.watch(notificationListProvider);
  final filter = ref.watch(currentFilterProvider);
  final order = ref.watch(currentOrderProvider);

  final filtered = ref.read(notificationListProvider.notifier).getFilteredNotifications(filter);
  return ref.read(notificationListProvider.notifier).getSortedNotifications(order, filtered);
}

/// Provider para verificar si hay notificaciones no leídas
@riverpod
bool hasUnreadNotifications(Ref ref) {
  final notifications = ref.watch(notificationListProvider);
  return notifications.any((notification) => !notification.isRead);
}

/// Provider para contar las notificaciones no leídas
@riverpod
int unreadNotificationsCount(Ref ref) {
  final notifications = ref.watch(notificationListProvider);
  return notifications.where((notification) => !notification.isRead).length;
}

//Provider de paginacion de Contrataciones
final quotationProvider = StateNotifierProvider.autoDispose<QuotationProvider, QuotationState>(
  (ref) => QuotationProvider(quotations: mockQuotationRequests),
);

// Agrega esto en tu archivo de providers (ej: remarketing_provider.dart)
final remarketingProvider = StateNotifierProvider<RemarketingProvider, RemarketingState>((ref) {
  return RemarketingProvider(
    users: [
      RemarketingUser(
        name: 'Emily Bryce @Emily',
        status: 'Active',
        date: '15/01/25',
        email: 'Emily@unfittedul.com',
      ),
      RemarketingUser(
        name: 'Phoenix Baker @photrix',
        status: 'Active',
        date: '10/02/25',
        email: 'phoenigunfittedul.com',
      ),
      RemarketingUser(
        name: 'Erica Rivas @Erica',
        status: 'Imprison',
        date: '29/03/25',
        email: 'Erika@unfittedul.com',
      ),
      // Agrega los demás usuarios de la tabla aquí
    ],
  );
});



final textHoverProvider = StateProvider<bool>((ref) => false);
final text2HoverProvider = StateProvider<bool>((ref) => false);
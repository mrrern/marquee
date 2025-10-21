import 'dart:async';
import 'package:bodas/routes/linkspaper.dart';

// Modelo de estado para el botón
class ButtonState {
  final bool isHovered;
  final bool isSelected;

  ButtonState({required this.isHovered, required this.isSelected});

  ButtonState copyWith({bool? isHovered, bool? isSelected}) {
    return ButtonState(
      isHovered: isHovered ?? this.isHovered,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

//Modelo para las opiniones
class Opinion {
  final String autor;
  final String fecha;
  final String calificacion;
  final String titulo;
  final String descripcion;

  Opinion({
    required this.autor,
    required this.fecha,
    required this.calificacion,
    required this.titulo,
    required this.descripcion,
  });
}

//Manejo de estado del ScrollOfset
class ScrollOffsetNotifier extends StateNotifier<double> {
  final Ref ref;
  ScrollOffsetNotifier(this.ref) : super(0) {
    _init();
  }

  void _init() {
    final scrollController = ref.read(scrollControllerProvider);
    scrollController.addListener(() {
      state = scrollController.offset * 0.2;
    });
  }
}

class SidebarExpansionNotifier extends StateNotifier<bool> {
  SidebarExpansionNotifier() : super(true);

  void toggle() => state = !state;
  void expand() => state = true;
  void collapse() => state = false;
}

// Notifier que maneja el estado del botón
class ButtonStateNotifier extends StateNotifier<ButtonState> {
  ButtonStateNotifier()
      : super(ButtonState(isHovered: false, isSelected: false));

  void hover(bool isHovered) {
    if (!state.isSelected) {
      state = state.copyWith(isHovered: isHovered);
    }
  }

  void select() {
    state = state.copyWith(isSelected: true, isHovered: false);
  }
}

class ScreenSizeNotifier extends StateNotifier<double> {
  ScreenSizeNotifier() : super(0);

  void updateSize(double newSize) {
    state = newSize;
  }
}

class CurrentRouteNotifier extends StateNotifier<String> {
  CurrentRouteNotifier() : super('/');

  void updateRoute(String newRoute) {
    state = newRoute;
  }
}

class CarouselNotifier extends StateNotifier<int> {
  CarouselNotifier() : super(0);

  void nextImage() {
    state = (state + 1) % 2; // Cambia entre 0 y 1, ya que hay dos imágenes
  }
}

class RegistrationNotifier extends StateNotifier<AsyncValue<void>> {
  RegistrationNotifier() : super(const AsyncData(null));

  Future<void> register(String email, String password) async {
    state = const AsyncLoading();
    try {
      await Future.delayed(
          const Duration(seconds: 2)); // Simulación de registro
      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}

// StateNotifier para manejar el índice y el timer
class BannerIndexNotifier extends StateNotifier<int> {
  BannerIndexNotifier(this.images) : super(0) {
    _startTimer();
  }

  final List<String> images;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 8), (_) {
      state = (state + 1) % images.length;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

/// Model class for storing form data related to wedding music selections
class WeddingMusicFormData {
  String? entranceMusic;
  String? brideEntranceMusic;
  String? groomEntranceMusic;

  // Ceremony
  final List<CeremonyReading>? lectures;
  String? ringExchangeMusic;
  String? kissAndSignatureMusic;
  String? ceremonyEndMusic;

  // Cocktail
  int? selectecMusicType;
  String? cocktailMusic;
  String? cocktailMusicStyle;

  // Dinner
  String? entranceToHallMusic;
  String? dinnerMusic;
  String? cakeCuttingMusic;
  String? giftsMusic;
  String? surpriseMusic;

  // Open Bar
  String? couplesDanceMusic;
  String? firstOpenBarSong;

  // Music Lists
  List<String> groomSongs = [];
  List<String> brideSongs = [];

  // Preferences
  bool hasForeignGuests = false;
  bool playForeignMusic = false;
  String? foreignMusicDetails;
  bool acceptGuestRequests = true;
  bool hasForbiddenSongs = false;
  String? forbiddenSongs;
  String? lastSong;

  // Additional notes
  String? additionalNotes;

  WeddingMusicFormData({
    this.entranceMusic,
    this.brideEntranceMusic,
    this.groomEntranceMusic,
    this.ringExchangeMusic,
    this.kissAndSignatureMusic,
    this.ceremonyEndMusic,
    this.selectecMusicType,
    this.cocktailMusic,
    this.cocktailMusicStyle,
    this.entranceToHallMusic,
    this.dinnerMusic,
    this.cakeCuttingMusic,
    this.giftsMusic,
    this.surpriseMusic,
    this.couplesDanceMusic,
    this.firstOpenBarSong,
    List<String>? groomSongs,
    List<String>? brideSongs,
    this.hasForeignGuests = false,
    this.playForeignMusic = false,
    this.foreignMusicDetails,
    this.acceptGuestRequests = true,
    this.hasForbiddenSongs = false,
    this.forbiddenSongs,
    this.lastSong,
    this.additionalNotes,
    List<CeremonyReading>? lectures,
  }) : lectures = lectures ??
            List.generate(
              4,
              (index) => CeremonyReading(
                  name: "", selectedOption: "Nosotros nos encargamos"),
            );

  // Copy with method for immutability
  WeddingMusicFormData copyWith({
    String? entranceMusic,
    String? brideEntranceMusic,
    String? groomEntranceMusic,
    List<CeremonyReading>? lectures,
    String? ringExchangeMusic,
    String? kissAndSignatureMusic,
    String? ceremonyEndMusic,
    String? cocktailMusic,
    String? cocktailMusicStyle,
    String? entranceToHallMusic,
    String? dinnerMusic,
    String? cakeCuttingMusic,
    String? giftsMusic,
    String? surpriseMusic,
    String? couplesDanceMusic,
    String? firstOpenBarSong,
    List<String>? groomSongs,
    List<String>? brideSongs,
    bool? hasForeignGuests,
    bool? playForeignMusic,
    String? foreignMusicDetails,
    bool? acceptGuestRequests,
    bool? hasForbiddenSongs,
    String? forbiddenSongs,
    String? lastSong,
    String? additionalNotes,
    int? selectecMusicType,
  }) {
    return WeddingMusicFormData(
      entranceMusic: entranceMusic ?? this.entranceMusic,
      brideEntranceMusic: brideEntranceMusic ?? this.brideEntranceMusic,
      groomEntranceMusic: groomEntranceMusic ?? this.groomEntranceMusic,
      ringExchangeMusic: ringExchangeMusic ?? this.ringExchangeMusic,
      kissAndSignatureMusic:
          kissAndSignatureMusic ?? this.kissAndSignatureMusic,
      ceremonyEndMusic: ceremonyEndMusic ?? this.ceremonyEndMusic,
      cocktailMusic: cocktailMusic ?? this.cocktailMusic,
      cocktailMusicStyle: cocktailMusicStyle ?? this.cocktailMusicStyle,
      entranceToHallMusic: entranceToHallMusic ?? this.entranceToHallMusic,
      dinnerMusic: dinnerMusic ?? this.dinnerMusic,
      cakeCuttingMusic: cakeCuttingMusic ?? this.cakeCuttingMusic,
      giftsMusic: giftsMusic ?? this.giftsMusic,
      surpriseMusic: surpriseMusic ?? this.surpriseMusic,
      couplesDanceMusic: couplesDanceMusic ?? this.couplesDanceMusic,
      firstOpenBarSong: firstOpenBarSong ?? this.firstOpenBarSong,
      groomSongs: groomSongs ?? this.groomSongs,
      brideSongs: brideSongs ?? this.brideSongs,
      hasForeignGuests: hasForeignGuests ?? this.hasForeignGuests,
      playForeignMusic: playForeignMusic ?? this.playForeignMusic,
      foreignMusicDetails: foreignMusicDetails ?? this.foreignMusicDetails,
      acceptGuestRequests: acceptGuestRequests ?? this.acceptGuestRequests,
      hasForbiddenSongs: hasForbiddenSongs ?? this.hasForbiddenSongs,
      forbiddenSongs: forbiddenSongs ?? this.forbiddenSongs,
      lastSong: lastSong ?? this.lastSong,
      additionalNotes: additionalNotes ?? this.additionalNotes,
      selectecMusicType: selectecMusicType ?? this.selectecMusicType,
      lectures: lectures ?? this.lectures?.map((e) => e.copyWith()).toList(),
    );
  }
}

/// Model for a reader during the ceremony
class CeremonyReading {
  final String name;
  final String selectedOption;

  CeremonyReading({required this.name, required this.selectedOption});

  CeremonyReading copyWith({String? name, String? selectedOption}) {
    return CeremonyReading(
      name: name ?? this.name,
      selectedOption: selectedOption ?? this.selectedOption,
    );
  }
}

class ContractModel {
  final String id;
  final String title;
  final DateTime date;
  final ContractStatus status;
  final String description;
  final double amount;

  ContractModel({
    required this.id,
    required this.title,
    required this.date,
    required this.status,
    required this.description,
    required this.amount,
  });

  // Sample data generator for demo purposes
  static List<ContractModel> getSampleContracts() {
    return [
      ContractModel(
        id: '001',
        title: 'Boda Clásica',
        date: DateTime.now().add(const Duration(days: 45)),
        status: ContractStatus.pending,
        description: 'Paquete de boda clásica con ceremonia y recepción',
        amount: 25000.00,
      ),
      ContractModel(
        id: '002',
        title: 'Boda Premium',
        date: DateTime.now().add(const Duration(days: 30)),
        status: ContractStatus.approved,
        description: 'Paquete premium con ceremonia, recepción y fotografía',
        amount: 35000.00,
      ),
      ContractModel(
        id: '003',
        title: 'Boda Íntima',
        date: DateTime.now().add(const Duration(days: 15)),
        status: ContractStatus.actionRequired,
        description: 'Paquete para boda íntima con 50 invitados',
        amount: 15000.00,
      ),
      ContractModel(
        id: '004',
        title: 'Boda Destino',
        date: DateTime.now().add(const Duration(days: 90)),
        status: ContractStatus.pending,
        description: 'Paquete de boda en playa con alojamiento',
        amount: 45000.00,
      ),
      ContractModel(
        id: '005',
        title: 'Renovación de Votos',
        date: DateTime.now().add(const Duration(days: 60)),
        status: ContractStatus.approved,
        description: 'Ceremonia de renovación de votos con cena',
        amount: 18000.00,
      ),
    ];
  }
}

enum ContractStatus {
  pending,
  approved,
  actionRequired,
}

extension ContractStatusExtension on ContractStatus {
  String get name {
    switch (this) {
      case ContractStatus.pending:
        return 'Pendiente';
      case ContractStatus.approved:
        return 'Aprobado';
      case ContractStatus.actionRequired:
        return 'Acción Requerida';
    }
  }

  Color get color {
    switch (this) {
      case ContractStatus.pending:
        return const Color(0xFFFFA000);
      case ContractStatus.approved:
        return const Color(0xFF4CAF50);
      case ContractStatus.actionRequired:
        return const Color(0xFFF44336);
    }
  }
}

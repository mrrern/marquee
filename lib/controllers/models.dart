import 'dart:convert';

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

/// Model class for storing form data related to wedding music selections
class WeddingMusicFormData {
  String? entranceMusic;
  String? brideEntranceMusic;
  String? groomEntranceMusic;

  // Ceremony
  final List<CeremonyReading>? readers;
  String? ringExchangeMusic;
  String? kissAndSignatureMusic;
  String? ceremonyEndMusic;

  // Cocktail
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
    List<CeremonyReading>? readers,
  }) : readers = readers ??
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
    List<CeremonyReading>? readers,
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
    String? selectecMusicType,
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
      readers: readers ?? this.readers!.map((e) => e.copyWith()).toList(),
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

class NoteModel {
  final String id;
  final String userName;
  final String userAvatar;
  final DateTime date;
  final String content;
  final List<String> images;

  NoteModel({
    required this.id,
    required this.userName,
    required this.userAvatar,
    required this.date,
    required this.content,
    this.images = const [],
  });

  NoteModel copyWith({
    String? id,
    String? userName,
    String? userAvatar,
    DateTime? date,
    String? content,
    List<String>? images,
  }) {
    return NoteModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      userAvatar: userAvatar ?? this.userAvatar,
      date: date ?? this.date,
      content: content ?? this.content,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'userAvatar': userAvatar,
      'date': date.millisecondsSinceEpoch,
      'content': content,
      'images': images,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'] ?? '',
      userName: map['userName'] ?? '',
      userAvatar: map['userAvatar'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      content: map['content'] ?? '',
      images: List<String>.from(map['images'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) => NoteModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NoteModel(id: $id, userName: $userName, userAvatar: $userAvatar, date: $date, content: $content, images: $images)';
  }
}
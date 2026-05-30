import 'dart:async';
import 'package:bodas/routes/exports.dart';

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
  String? musicCoctelPlaylist;

  // Extra readings
  List<CeremonyReading>? musicLecExt;

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
    this.musicCoctelPlaylist,
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
    List<CeremonyReading>? musicLecExt,
  })  : lectures = lectures ??
            List.generate(
              4,
              (index) => CeremonyReading(
                  name: "", selectedOption: "Nosotros nos encargamos"),
            ),
        musicLecExt = musicLecExt ?? [];

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
    String? musicCoctelPlaylist,
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
    List<CeremonyReading>? musicLecExt,
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
      musicCoctelPlaylist: musicCoctelPlaylist ?? this.musicCoctelPlaylist,
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
      musicLecExt:
          musicLecExt ?? this.musicLecExt?.map((e) => e.copyWith()).toList(),
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

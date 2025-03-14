import 'dart:async';
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

//Controllador del video principal
class YoutubeControllerNotifier extends StateNotifier<YoutubeWebPlayerController?> {
  YoutubeControllerNotifier() : super(null) {
    _init();
  }

  void _init() {
    state = YoutubeWebPlayerController();
    state?.addListener(_listener);
  }

  void _listener() {
    if (state?.isReady == true) {
      state?.play();
    }
  }

  @override
  void dispose() {
    state?.dispose();
    super.dispose();
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


// Modelo para las solicitudes de cotización
class QuotationRequest {
  final String id;
  final String name;
  final String username;
  final String avatarUrl;
  final String date;
  final int guests;
  final String ceremonyType;
  final String location;
  final bool hasQuotation;
  final bool hasSignedContract;
  final bool isAccepted;
  final bool isActive;

  QuotationRequest({
    required this.id,
    required this.name,
    required this.username,
    required this.avatarUrl,
    required this.date,
    required this.guests,
    required this.ceremonyType,
    required this.location,
    this.hasQuotation = false,
    this.hasSignedContract = false,
    this.isAccepted = false,
    this.isActive = true,
  });
}

/// Lista de datos de ejemplo para mostrar en la tabla y tarjetas
List<QuotationRequest> mockQuotationRequests = [
  QuotationRequest(
    id: '1',
    name: 'Olivia Rhye',
    username: '@olivia',
    avatarUrl: 'assets/images/avatars/olivia.png',
    date: '15/01/25',
    guests: 110,
    ceremonyType: 'Civil',
    location: 'Málaga Jardin de Palermo, España',
    hasQuotation: true,
    hasSignedContract: true,
    isAccepted: true,
    isActive: true,
  ),
  QuotationRequest(
    id: '2',
    name: 'Phoenix Baker',
    username: '@phoenix',
    avatarUrl: 'assets/images/avatars/phoenix.png',
    date: '19/03/25',
    guests: 102,
    ceremonyType: 'Religiosa',
    location: 'Catedral de San Pablo Madrid, España',
    hasQuotation: true,
    hasSignedContract: true,
    isAccepted: true,
  ),
  QuotationRequest(
    id: '3',
    name: 'Erika Rivas',
    username: '@Erika',
    avatarUrl: 'assets/images/avatars/erika.png',
    date: '29/03/25',
    guests: 246,
    ceremonyType: 'Civil',
    location: 'Valencia Jardín del Turia, España',
    hasQuotation: true,
    hasSignedContract: false,
    isAccepted: false,
  ),
  QuotationRequest(
    id: '4',
    name: 'Demi Wilkinson',
    username: '@demi',
    avatarUrl: 'assets/images/avatars/demi.png',
    date: '04/04/25',
    guests: 150,
    ceremonyType: 'Civil',
    location: 'Málaga Jardin de Palermo, España',
    hasQuotation: true,
    hasSignedContract: true,
    isAccepted: true,
  ),
  QuotationRequest(
    id: '5',
    name: 'Candice Wu',
    username: '@candice',
    avatarUrl: '',
    date: '14/04/25',
    guests: 70,
    ceremonyType: 'Civil',
    location: 'Málaga Jardin de Palermo, España',
    hasQuotation: true,
    hasSignedContract: false,
    isAccepted: false,
  ),
  QuotationRequest(
    id: '6',
    name: 'Natali Craig',
    username: '@natali',
    avatarUrl: 'assets/images/avatars/natali.png',
    date: '19/04/25',
    guests: 90,
    ceremonyType: 'Civil',
    location: 'Valencia Jardín del Turia, España',
    hasQuotation: false,
    hasSignedContract: true,
    isAccepted: true,
  ),
  QuotationRequest(
    id: '7',
    name: 'Drew Cano',
    username: '@drew',
    avatarUrl: 'assets/images/avatars/drew.png',
    date: '27/04/25',
    guests: 300,
    ceremonyType: 'Religiosa',
    location: 'Catedral de San Pablo Madrid, España',
    hasQuotation: true,
    hasSignedContract: true,
    isAccepted: true,
  ),
  QuotationRequest(
    id: '8',
    name: 'Orlando Diggs',
    username: '@orlando',
    avatarUrl: '',
    date: '03/05/25',
    guests: 280,
    ceremonyType: 'Religiosa',
    location: 'Catedral de San Pablo Madrid, España',
    hasQuotation: true,
    hasSignedContract: true,
    isAccepted: true,
  ),
  QuotationRequest(
    id: '9',
    name: 'Andi Lane',
    username: '@andi',
    avatarUrl: 'assets/images/avatars/andi.png',
    date: '10/06/25',
    guests: 130,
    ceremonyType: 'Civil',
    location: 'Valencia Jardín del Turia, España',
    hasQuotation: true,
    hasSignedContract: true,
    isAccepted: true,
  ),
];

/// Modelo para representar una notificación
class NotificationModel {
  final String id;
  final String title;
  final String content;
  final DateTime date;
  bool isRead;
  final String filterType;

  NotificationModel({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    this.isRead = false,
    this.filterType = 'Todos',
  });

  /// Crea una copia del modelo con valores actualizados
  NotificationModel copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? date,
    bool? isRead,
    String? filterType,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
      isRead: isRead ?? this.isRead,
      filterType: filterType ?? this.filterType,
    );
  }

  /// Formatea la fecha relativa (ej: "hace 2 min", "hace 1 día")
  String get formattedDate {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 60) {
      return 'hace ${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return 'hace ${difference.inHours} horas';
    } else {
      return 'hace ${difference.inDays} día${difference.inDays > 1 ? 's' : ''}';
    }
  }

  /// Convierte el modelo a un mapa para serialización
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'date': date.toIso8601String(),
      'isRead': isRead,
      'filterType': filterType,
    };
  }

  /// Crea un modelo a partir de un mapa
  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      date: DateTime.parse(map['date']),
      isRead: map['isRead'] ?? false,
      filterType: map['filterType'] ?? 'Todos',
    );
  }
}


// quotation_provider.dart
class QuotationState {
  final int currentPage;
  final int itemsPerPage;
  final List<QuotationRequest> quotations;

  QuotationState({
    this.currentPage = 1,
    this.itemsPerPage = 4,
    required this.quotations,
  });

  QuotationState copyWith({
    int? currentPage,
    int? itemsPerPage,
    List<QuotationRequest>? quotations,
  }) {
    return QuotationState(
      currentPage: currentPage ?? this.currentPage,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
      quotations: quotations ?? this.quotations,
    );
  }

  int get totalPages => (quotations.length / itemsPerPage).ceil();
}

class QuotationProvider extends StateNotifier<QuotationState> {
  QuotationProvider({required List<QuotationRequest> quotations})
      : super(QuotationState(quotations: quotations));

  void updateItemsPerPage(int itemsPerPage) {
    state = state.copyWith(
      itemsPerPage: itemsPerPage,
      currentPage: 1,
    );
  }

  void changePage(int page) {
    state = state.copyWith(currentPage: page);
  }
}



// Modelo Remarketing
class RemarketingUser {
  final String name;
  final String status;
  final String date;
  final String email;
  bool isSelected;

  RemarketingUser({
    required this.name,
    required this.status,
    required this.date,
    required this.email,
    this.isSelected = false,
  });
}


// Estado y Provider Remarketing
class RemarketingState {
  final int currentPage;
  final int itemsPerPage;
  final List<RemarketingUser> users;

  RemarketingState({
    this.currentPage = 1,
    this.itemsPerPage = 4,
    required this.users,
  });

  RemarketingState copyWith({
    int? currentPage,
    int? itemsPerPage,
    List<RemarketingUser>? users,
  }) {
    return RemarketingState(
      currentPage: currentPage ?? this.currentPage,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
      users: users ?? this.users,
    );
  }

  int get totalPages => (users.length / itemsPerPage).ceil();
}



class RemarketingProvider extends StateNotifier<RemarketingState> {
  RemarketingProvider({required List<RemarketingUser> users})
      : super(RemarketingState(users: users));

  void updateItemsPerPage(int itemsPerPage) {
    state = state.copyWith(
      itemsPerPage: itemsPerPage,
      currentPage: 1,
    );
  }

  void changePage(int page) {
    state = state.copyWith(currentPage: page);
  }

  void toggleUserSelection(int index) {
    final updatedUsers = state.users.toList();
    updatedUsers[index].isSelected = !updatedUsers[index].isSelected;
    state = state.copyWith(users: updatedUsers);
  }
}
import 'package:bodas/routes/linkspaper.dart';

class MarketingLogic {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<RemarketingUserModel>> getRemarketingUsers() async {
    // 1. Obtener todos los usuarios
    // Use eq instead of contains to avoid Postgres '@>' operator on text
    final usersResponse =
        await supabase.from('user_info').select().eq('user_rol', 'Usuario');
    final List users = usersResponse as List;
    debugPrint('DEBUG: Fetched ${users.length} users from user_info');
    List<RemarketingUserModel> remarketingUsers = [];

    for (final user in users) {
      debugPrint('DEBUG: User data: $user');
      debugPrint(
          'DEBUG: user["id"] type: ${user['id'].runtimeType}, value: ${user['id']}');
      final String userId = user['id'].toString();
      debugPrint(
          'DEBUG: Converted userId: $userId (type: ${userId.runtimeType})');
      final String nombre = user['nombre'] ?? '';
      final String email = user['email'] ?? '';
      final DateTime fechaCreacion =
          DateTime.tryParse(user['created_at'] ?? '') ?? DateTime.now();

      // 2. Buscar si tiene boda activa
      debugPrint('DEBUG: Querying listar_boda (lenient) for userId=$userId');
      final bodasResponse = await supabase.from('listar_boda').select();
      final List<dynamic> bodasAll = bodasResponse as List<dynamic>;
      debugPrint('DEBUG: Raw listar_boda rows count: ${bodasAll.length}');

      // Helper to read user id and is_deleted from a row using multiple possible keys
      List<Map<String, dynamic>> filteredBodas = [];
      for (final b in bodasAll) {
        if (b is! Map) continue;
        final Map<String, dynamic> row =
            Map<String, dynamic>.from(b as Map<String, dynamic>);
        final String? rowUserId = (row['user_id'] ??
                row['usuario_id'] ??
                row['userId'] ??
                row['usuarioId'])
            ?.toString();
        final dynamic isDeletedRaw =
            row['is_deleted'] ?? row['isDeleted'] ?? false;
        final bool isDeleted =
            (isDeletedRaw == true) || (isDeletedRaw?.toString() == 'true');
        if (rowUserId == userId && !isDeleted) filteredBodas.add(row);
      }

      debugPrint(
          'DEBUG: Filtered bodas for userId=$userId count: ${filteredBodas.length}');
      final bool tieneBodaActiva = filteredBodas.isNotEmpty;
      final String? bodaId = tieneBodaActiva
          ? (filteredBodas.first['id'] ??
                  filteredBodas.first['ID'] ??
                  filteredBodas.first['boda_id'])
              ?.toString()
          : null;
      debugPrint('DEBUG: tieneBodaActiva: $tieneBodaActiva, bodaId: $bodaId');

      try {
        final model = RemarketingUserModel(
          id: userId,
          nombre: nombre,
          email: email,
          fechaCreacion: fechaCreacion,
          tieneBodaActiva: tieneBodaActiva,
          bodaId: bodaId,
          mailto: 'mailto:$email',
        );
        remarketingUsers.add(model);
        debugPrint(
            'DEBUG: Successfully created RemarketingUserModel for userId: $userId');
      } catch (e) {
        debugPrint('DEBUG: Error creating RemarketingUserModel: $e');
      }
    }
    debugPrint('DEBUG: Returning ${remarketingUsers.length} remarketing users');
    return remarketingUsers;
  }

  /// Obtiene usuarios de remarketing con paginación simple en memoria
  Future<RemarketingPaginatedResponse> getRemarketingUsersPaginated({
    required int page,
    required int pageSize,
  }) async {
    // Obtener todos los usuarios (se recomienda optimizar a paginación en BD más adelante)
    final usersResponse =
        await supabase.from('user_info').select().eq('user_rol', 'Usuario');
    final List users = usersResponse as List;
    final totalItems = users.length;

    debugPrint(
        'DEBUG: Paginated request - page=$page, pageSize=$pageSize, totalItems=$totalItems');

    if (pageSize <= 0) {
      return RemarketingPaginatedResponse(
        items: const [],
        page: page,
        pageSize: pageSize,
        totalItems: totalItems,
      );
    }

    final startIndex = (page - 1) * pageSize;
    if (startIndex >= totalItems || startIndex < 0) {
      return RemarketingPaginatedResponse(
        items: const [],
        page: page,
        pageSize: pageSize,
        totalItems: totalItems,
      );
    }
    var endIndex = startIndex + pageSize;
    if (endIndex > totalItems) endIndex = totalItems;

    final pageUsers = users.sublist(startIndex, endIndex);
    List<RemarketingUserModel> remarketingUsers = [];

    for (final user in pageUsers) {
      debugPrint('DEBUG[PAG]: User data: $user');
      final String userId = user['id'].toString();
      final String nombre = user['nombre'] ?? '';
      final String email = user['email'] ?? '';
      final DateTime fechaCreacion =
          DateTime.tryParse(user['created_at'] ?? '') ?? DateTime.now();

      // Buscar si tiene boda activa
      final bodasResponse = await supabase.from('listar_boda').select();
      final List<dynamic> bodasAll = bodasResponse as List<dynamic>;

      List<Map<String, dynamic>> filteredBodas = [];
      for (final b in bodasAll) {
        if (b is! Map) continue;
        final Map<String, dynamic> row =
            Map<String, dynamic>.from(b as Map<String, dynamic>);
        final String? rowUserId = (row['user_id'] ??
                row['usuario_id'] ??
                row['userId'] ??
                row['usuarioId'])
            ?.toString();
        final dynamic isDeletedRaw =
            row['is_deleted'] ?? row['isDeleted'] ?? false;
        final bool isDeleted =
            (isDeletedRaw == true) || (isDeletedRaw?.toString() == 'true');
        if (rowUserId == userId && !isDeleted) filteredBodas.add(row);
      }

      final bool tieneBodaActiva = filteredBodas.isNotEmpty;
      final String? bodaId = tieneBodaActiva
          ? (filteredBodas.first['id'] ??
                  filteredBodas.first['ID'] ??
                  filteredBodas.first['boda_id'])
              ?.toString()
          : null;

      try {
        final model = RemarketingUserModel(
          id: userId,
          nombre: nombre,
          email: email,
          fechaCreacion: fechaCreacion,
          tieneBodaActiva: tieneBodaActiva,
          bodaId: bodaId,
          mailto: 'mailto:$email',
        );
        remarketingUsers.add(model);
      } catch (e) {
        debugPrint('DEBUG[PAG]: Error creating model: $e');
      }
    }

    return RemarketingPaginatedResponse(
      items: remarketingUsers,
      page: page,
      pageSize: pageSize,
      totalItems: totalItems,
    );
  }

  Future<RemarketingUserModel?> getRemarketingUser(String userId) async {
    debugPrint(
        'DEBUG: getRemarketingUser called with userId: $userId (type: ${userId.runtimeType})');
    final userResponse =
        await supabase.from('user_info').select().eq('id', userId).single();
    debugPrint('DEBUG: userResponse: $userResponse');
    if (userResponse.isEmpty) {
      debugPrint('DEBUG: userResponse is empty');
      return null;
    }

    // Buscar si tiene boda activa
    debugPrint('DEBUG: Querying listar_boda with user_id=$userId');
    final bodasResponse = await supabase.from('listar_boda').select();
    final List<dynamic> bodasAll = bodasResponse as List<dynamic>;
    final filteredBodas = bodasAll.where((b) {
      if (b is! Map) return false;
      final Map<String, dynamic> row =
          Map<String, dynamic>.from(b as Map<String, dynamic>);
      final String? rowUserId = (row['user_id'] ??
              row['usuario_id'] ??
              row['userId'] ??
              row['usuarioId'])
          ?.toString();
      final dynamic isDeletedRaw =
          row['is_deleted'] ?? row['isDeleted'] ?? false;
      final bool isDeleted =
          (isDeletedRaw == true) || (isDeletedRaw?.toString() == 'true');
      return rowUserId == userId && !isDeleted;
    }).toList();
    debugPrint(
        'DEBUG: Filtered bodas for userId=$userId count: ${filteredBodas.length}');
    final bool tieneBodaActiva = filteredBodas.isNotEmpty;
    final String? bodaId = tieneBodaActiva
        ? (filteredBodas.first['id'] ??
                filteredBodas.first['ID'] ??
                filteredBodas.first['boda_id'])
            ?.toString()
        : null;
    debugPrint('DEBUG: tieneBodaActiva: $tieneBodaActiva, bodaId: $bodaId');

    try {
      final model = RemarketingUserModel(
        id: userResponse['id'].toString(),
        nombre: userResponse['nombre'] ?? '',
        email: userResponse['email'] ?? '',
        fechaCreacion: DateTime.tryParse(userResponse['created_at'] ?? '') ??
            DateTime.now(),
        tieneBodaActiva: tieneBodaActiva,
        bodaId: bodaId,
        mailto: 'mailto:${userResponse['email'] ?? ''}',
      );
      debugPrint(
          'DEBUG: Successfully created RemarketingUserModel for userId: $userId');
      return model;
    } catch (e) {
      debugPrint('DEBUG: Error creating RemarketingUserModel: $e');
      return null;
    }
  }
}

final marketingProvider =
    FutureProvider<List<RemarketingUserModel>>((ref) async {
  final logic = MarketingLogic();
  return await logic.getRemarketingUsers();
});

// Estado para usuario seleccionado
final selectedRemarketingUserProvider =
    StateProvider<RemarketingUserModel?>((ref) => null);

// Provider para obtener un usuario por id
final remarketingUserProvider =
    FutureProvider.family<RemarketingUserModel?, String>((ref, userId) async {
  final logic = MarketingLogic();
  return await logic.getRemarketingUser(userId);
});

/// Provider para obtener usuarios de remarketing paginados
final marketingPaginatedProvider =
    FutureProvider.family<RemarketingPaginatedResponse, RemarketingPagination>(
        (ref, pagination) async {
  final logic = MarketingLogic();
  return await logic.getRemarketingUsersPaginated(
    page: pagination.page,
    pageSize: pagination.pageSize,
  );
});

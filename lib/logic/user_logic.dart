import 'package:bodas/routes/linkspaper.dart';

class UserLogic {
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Normalize a raw map from `user_info` view into the shape expected by UserInfo
  Map<String, dynamic> _normalizeUserMap(Map<String, dynamic> map) {
    // Ensure string fields are non-null strings
    final id = (map['id'] ?? map['user_id'] ?? '').toString();
    final nombre =
        (map['nombre'] ?? map['name'] ?? map['user_nombre'] ?? '').toString();
    final email =
        (map['email'] ?? map['correo'] ?? map['user_email'] ?? '').toString();
    final rol = (map['rol'] ?? map['user_rol'] ?? '').toString();
    final createdAt = map['created_at'] != null
        ? DateTime.tryParse(map['created_at'])?.toIso8601String()
        : DateTime.now().toIso8601String();

    return {
      'id': id,
      'nombre': nombre,
      'email': email,
      'rol': rol,
      'createdAt': createdAt,
    };
  }

  /// Devuelve un mapa userId -> cantidad de bodas en la vista `listar_boda`
  /// Para eficiencia consulta todos los registros con usuario_id en la lista
  /// y agrupa en memoria.
  Future<Map<String, int>> fetchWeddingsCountForUsers(
      List<String> userIds) async {
    if (userIds.isEmpty) return {};
    try {
      // Intentamos usar .in_ para filtrar por varios ids
      dynamic resp;
      // Intentamos filtrar en servidor por usuario_id; si no está disponible,
      // fallback a traer todos y filtrar en memoria.
      try {
        resp = await _supabase
            .from('listar_boda')
            .select('user_id')
            .eq('is_deleted', false);
      } catch (_) {
        resp = await _supabase
            .from('listar_boda')
            .select('user_id')
            .eq('is_deleted', false);
      }

      final rows = (resp as List).cast<dynamic>();
      final Map<String, int> counts = {};
      for (final r in rows) {
        try {
          final m = Map<String, dynamic>.from(r as Map);
          final uid = (m['usuario_id'] ?? m['user_id'])?.toString() ?? '';
          if (uid.isEmpty) continue;
          if (!userIds.contains(uid)) continue;
          counts[uid] = (counts[uid] ?? 0) + 1;
        } catch (_) {
          continue;
        }
      }

      // Ensure zero counts for users with no bodas
      for (final id in userIds) {
        counts.putIfAbsent(id, () => 0);
      }

      return counts;
    } catch (e) {
      // En caso de error devolvemos vacío y permitimos que la UI lo trate
      return {for (var id in userIds) id: 0};
    }
  }

  /// Obtiene todos los usuarios desde la vista `user_info`
  Future<List<UserInfo>> fetchAllUsers() async {
    try {
      final resp = await _supabase.from('user_info').select().order('nombre');
      final rows = (resp as List).cast<dynamic>();
      return rows.map((r) {
        final map = Map<String, dynamic>.from(r as Map);
        final normalized = _normalizeUserMap(map);
        return UserInfo.fromJson(normalized);
      }).toList();
    } catch (e) {
      throw Exception('Error al obtener usuarios: $e');
    }
  }

  /// Obtiene un usuario por id (desde la vista `user_info`)
  Future<UserInfo?> getUserById(String id) async {
    try {
      final resp =
          await _supabase.from('user_info').select().eq('id', id).maybeSingle();
      if (resp == null) return null;
      final map = Map<String, dynamic>.from(resp as Map);
      final normalized = _normalizeUserMap(map);
      return UserInfo.fromJson(normalized);
    } catch (e) {
      throw Exception('Error al obtener usuario $id: $e');
    }
  }

  /// Actualiza campos en la tabla `users` y devuelve UserInfo actualizado desde la vista
  Future<UserInfo> updateUser(String id, Map<String, dynamic> changes) async {
    try {
      await _supabase.from('users').update(changes).eq('id', id);
      final updated =
          await _supabase.from('user_info').select().eq('id', id).single();
      return UserInfo.fromJson(Map<String, dynamic>.from(updated as Map));
    } catch (e) {
      throw Exception('Error al actualizar usuario $id: $e');
    }
  }

  /// Soft delete en tabla `users`
  Future<void> deleteUser(String id) async {
    try {
      await _supabase.from('users').update({
        'is_deleted': true,
        'updated_at': DateTime.now().toIso8601String(),
      }).eq('id', id);
    } catch (e) {
      throw Exception('Error al eliminar usuario $id: $e');
    }
  }
}

// Provider de la lógica
final userLogicProvider = Provider<UserLogic>((ref) {
  return UserLogic();
});

// StateNotifier para administrar la lista de usuarios (pantalla admin)
class AdminUsersNotifier extends StateNotifier<AsyncValue<List<UserInfo>>> {
  final UserLogic logic;

  AdminUsersNotifier(this.logic) : super(const AsyncValue.loading()) {
    fetchAll();
  }

  Future<void> fetchAll() async {
    state = const AsyncValue.loading();
    try {
      final users = await logic.fetchAllUsers();
      state = AsyncValue.data(users);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() => fetchAll();

  Future<void> removeUser(String id) async {
    try {
      await logic.deleteUser(id);
      await fetchAll();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> editUser(String id, Map<String, dynamic> changes) async {
    try {
      await logic.updateUser(id, changes);
      await fetchAll();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final usersAdminProvider =
    StateNotifierProvider<AdminUsersNotifier, AsyncValue<List<UserInfo>>>(
  (ref) => AdminUsersNotifier(ref.watch(userLogicProvider)),
);

// Helper provider para obtener un solo usuario por id
final userInfoByIdProvider =
    FutureProvider.family<UserInfo?, String>((ref, id) async {
  final logic = ref.watch(userLogicProvider);
  return logic.getUserById(id);
});

// ---------------------------------------------------------------------------
// Nueva paginación usando Freezed + StateNotifier
// ---------------------------------------------------------------------------
class PaginateUsersNotifier extends StateNotifier<PaginateUserState> {
  final UserLogic logic;

  PaginateUsersNotifier(this.logic) : super(const PaginateUserState()) {
    loadAll();
  }

  Future<void> loadAll() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final all = await logic.fetchAllUsers();
      final totalPages =
          ((all.length) / state.itemsPerPage).ceil().clamp(1, 99999);
      final currentPageUsers = all.take(state.itemsPerPage).toList();
      state = state.copyWith(
        allUsers: all,
        currentPage: 1,
        totalPages: totalPages,
        currentPageUsers: currentPageUsers,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  void changePage(int page) {
    if (page < 1 || page > state.totalPages) return;
    final start = (page - 1) * state.itemsPerPage;
    final end = (start + state.itemsPerPage).clamp(0, state.allUsers.length);
    final pageItems = state.allUsers.sublist(start, end);
    state = state.copyWith(currentPage: page, currentPageUsers: pageItems);
  }

  void updateItemsPerPage(int count) {
    if (count < 1) return;
    final totalPages = ((state.allUsers.length) / count).ceil().clamp(1, 99999);
    final currentPageUsers = state.allUsers.take(count).toList();
    state = state.copyWith(
      itemsPerPage: count,
      totalPages: totalPages,
      currentPage: 1,
      currentPageUsers: currentPageUsers,
    );
  }

  Future<void> refresh() async => loadAll();
}

final paginateUsersProvider =
    StateNotifierProvider<PaginateUsersNotifier, PaginateUserState>((ref) {
  final logic = ref.watch(userLogicProvider);
  return PaginateUsersNotifier(logic);
});

import 'package:bodas/controllers/user/user_model.dart';
import 'package:bodas/routes/linkspaper.dart';

class UserLogic {
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Obtiene todos los usuarios desde la vista `user_info`
  Future<List<UserInfo>> fetchAllUsers() async {
    try {
      final resp = await _supabase.from('user_info').select().order('nombre');
      final rows = (resp as List).cast<dynamic>();
      return rows
          .map((r) => UserInfo.fromJson(Map<String, dynamic>.from(r as Map)))
          .toList();
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
      return UserInfo.fromJson(Map<String, dynamic>.from(resp as Map));
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
    } catch (e, st) {
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

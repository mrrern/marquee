import 'package:bodas/routes/exports.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_logic.g.dart';


class UserLogic {
  final SupabaseClient _supabase = Supabase.instance.client;

  Map<String, dynamic> _normalizeUserMap(Map<String, dynamic> map) {
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

  Future<Map<String, int>> fetchWeddingsCountForUsers(
      List<String> userIds) async {
    if (userIds.isEmpty) return {};
    try {
      dynamic resp;
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

      for (final id in userIds) {
        counts.putIfAbsent(id, () => 0);
      }

      return counts;
    } catch (e) {
      return {for (var id in userIds) id: 0};
    }
  }

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

  Future<void> deleteHard(String id) async {
    try {
      await _supabase.auth.admin.deleteUser(id);
      await _supabase.from('users').delete().eq('id', id);
    } catch (e) {
      throw Exception('Error al eliminar permanentemente usuario $id: $e');
    }
  }
}

// Provider de servicio
final userLogicProvider = Provider<UserLogic>((ref) => UserLogic());

// Notifier admin (lista de usuarios)
@riverpod
class AdminUsers extends _$AdminUsers {
  @override
  Future<List<UserInfo>> build() async {
    return ref.watch(userLogicProvider).fetchAllUsers();
  }

  Future<void> refresh() async => ref.invalidateSelf();

  Future<void> removeUser(String id) async {
    await ref.read(userLogicProvider).deleteUser(id);
    ref.invalidateSelf();
  }

  Future<void> editUser(String id, Map<String, dynamic> changes) async {
    await ref.read(userLogicProvider).updateUser(id, changes);
    ref.invalidateSelf();
  }
}

// Alias de compatibilidad
final usersAdminProvider = adminUsersProvider;

// Helper provider para obtener un solo usuario por id
final userInfoByIdProvider =
    FutureProvider.family<UserInfo?, String>((ref, id) async {
  final logic = ref.watch(userLogicProvider);
  return logic.getUserById(id);
});

// PaginateUserState está definido en lib/models/user_model.dart


@riverpod
class PaginateUsers extends _$PaginateUsers {
  @override
  PaginateUserState build() {
    Future.microtask(() => loadAll());
    return const PaginateUserState();
  }

  Future<void> loadAll() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final all = await ref.read(userLogicProvider).fetchAllUsers();
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
    final totalPages =
        ((state.allUsers.length) / count).ceil().clamp(1, 99999);
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

// El provider se accede como paginateUsersProvider
// generado por @riverpod desde la clase PaginateUsers.


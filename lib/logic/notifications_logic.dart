import 'dart:async';
import 'package:bodas/routes/linkspaper.dart';
import 'package:bodas/controllers/notifications/notifications_model.dart';

class NotificationsLogic {
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Obtiene todas las notificaciones del usuario actual
  Future<List<NotificationsModel>> fetchAllNotifications() async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) throw Exception('Usuario no autenticado');

      final response = await _supabase
          .from('notifications')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => NotificationsModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Error al obtener notificaciones: $e');
    }
  }

  /// Obtiene el conteo de notificaciones no leídas
  Future<int> getUnreadCount() async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return 0;

      // Obtener todas las notificaciones y filtrar en memoria
      final response = await _supabase
          .from('notifications')
          .select('id, read_at')
          .eq('user_id', userId);

      final notifications = (response as List).cast<Map<String, dynamic>>();
      return notifications.where((n) => n['read_at'] == null).length;
    } catch (e) {
      return 0;
    }
  }

  /// Marca una notificación como leída
  Future<void> markAsRead(String notificationId) async {
    try {
      await _supabase
          .from('notifications')
          .update({'read_at': DateTime.now().toIso8601String()}).eq(
              'id', notificationId);
    } catch (e) {
      throw Exception('Error al marcar notificación como leída: $e');
    }
  }

  /// Marca todas las notificaciones como leídas
  Future<void> markAllAsRead() async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) throw Exception('Usuario no autenticado');

      // Obtener todas las notificaciones no leídas y marcarlas como leídas
      final unreadNotifications = await _supabase
          .from('notifications')
          .select('id')
          .eq('user_id', userId);

      if (unreadNotifications.isNotEmpty) {
        final ids = (unreadNotifications as List)
            .map((n) => n['id'] as String)
            .toList();

        // Actualizar cada notificación individualmente
        for (final id in ids) {
          await _supabase.from('notifications').update(
              {'read_at': DateTime.now().toIso8601String()}).eq('id', id);
        }
      }
    } catch (e) {
      throw Exception(
          'Error al marcar todas las notificaciones como leídas: $e');
    }
  }

  /// Elimina una notificación
  Future<void> deleteNotification(String notificationId) async {
    try {
      await _supabase.from('notifications').delete().eq('id', notificationId);
    } catch (e) {
      throw Exception('Error al eliminar notificación: $e');
    }
  }

  /// Stream de notificaciones en tiempo real
  Stream<List<NotificationsModel>> getNotificationsStream() {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return Stream.empty();

    final controller = StreamController<List<NotificationsModel>>();
    final List<NotificationsModel> notifications = [];

    // Carga inicial
    fetchAllNotifications().then((initialNotifications) {
      notifications.clear();
      notifications.addAll(initialNotifications);
      controller.add(List.from(notifications));
    }).catchError((e) {
      controller.addError(e);
    });

    // Configurar Realtime
    final channel = _supabase
        .channel('notifications_$userId')
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'notifications',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'user_id',
            value: userId,
          ),
          callback: (payload) {
            final newNotification = NotificationsModel.fromJson(
              Map<String, dynamic>.from(payload.newRecord),
            );
            notifications.insert(0, newNotification);
            controller.add(List.from(notifications));
          },
        )
        .subscribe();

    // Cleanup cuando se cierre el stream
    controller.onCancel = () {
      _supabase.removeChannel(channel);
    };

    return controller.stream;
  }

  /// Stream de conteo de notificaciones no leídas
  Stream<int> getUnreadCountStream() {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return Stream.value(0);

    final controller = StreamController<int>();
    int unreadCount = 0;

    // Carga inicial
    getUnreadCount().then((count) {
      unreadCount = count;
      controller.add(unreadCount);
    });

    // Configurar Realtime para cambios en notificaciones
    final channel = _supabase
        .channel('unread_count_$userId')
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'notifications',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'user_id',
            value: userId,
          ),
          callback: (payload) {
            unreadCount++;
            controller.add(unreadCount);
          },
        )
        .subscribe();

    controller.onCancel = () {
      _supabase.removeChannel(channel);
    };

    return controller.stream;
  }
}

// Provider para NotificationsLogic
final notificationsLogicProvider = Provider<NotificationsLogic>((ref) {
  return NotificationsLogic();
});

// Provider para obtener solo el conteo de no leídas
final unreadCountProvider = StreamProvider<int>((ref) {
  final logic = ref.watch(notificationsLogicProvider);
  return logic.getUnreadCountStream();
});

// Provider para obtener todas las notificaciones como stream
final notificationsStreamProvider =
    StreamProvider<List<NotificationsModel>>((ref) {
  final logic = ref.watch(notificationsLogicProvider);
  return logic.getNotificationsStream();
});

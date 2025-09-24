import 'package:bodas/routes/linkspaper.dart';

class MarketingLogic {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<RemarketingUserModel>> getRemarketingUsers() async {
    // 1. Obtener todos los usuarios
    final usersResponse = await supabase.from('user_info').select();
    final List users = usersResponse as List;
    debugPrint('DEBUG: Fetched ${users.length} users from user_info');
    List<RemarketingUserModel> remarketingUsers = [];

    for (final user in users) {
      debugPrint('DEBUG: User data: $user');
      debugPrint('DEBUG: user["id"] type: ${user['id'].runtimeType}, value: ${user['id']}');
      final String userId = user['id'].toString();
      debugPrint('DEBUG: Converted userId: $userId (type: ${userId.runtimeType})');
      final String nombre = user['nombre'] ?? '';
      final String email = user['email'] ?? '';
      final DateTime fechaCreacion =
          DateTime.tryParse(user['created_at'] ?? '') ?? DateTime.now();

      // 2. Buscar si tiene boda activa
      debugPrint('DEBUG: Querying listar_boda with usuario_id=$userId');
      final bodasResponse = await supabase
          .from('listar_boda')
          .select()
          .eq('usuario_id', userId)
          .eq('is_deleted', false);
      final List bodas = bodasResponse as List;
      debugPrint('DEBUG: Bodas query result: $bodas');
      final bool tieneBodaActiva = bodas.isNotEmpty;
      final String? bodaId =
          tieneBodaActiva ? bodas.first['id'].toString() : null;
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
        debugPrint('DEBUG: Successfully created RemarketingUserModel for userId: $userId');
      } catch (e) {
        debugPrint('DEBUG: Error creating RemarketingUserModel: $e');
      }
    }
    debugPrint('DEBUG: Returning ${remarketingUsers.length} remarketing users');
    return remarketingUsers;
  }

  Future<RemarketingUserModel?> getRemarketingUser(String userId) async {
    debugPrint('DEBUG: getRemarketingUser called with userId: $userId (type: ${userId.runtimeType})');
    final userResponse =
        await supabase.from('user_info').select().eq('id', userId).single();
    debugPrint('DEBUG: userResponse: $userResponse');
    if (userResponse.isEmpty) {
      debugPrint('DEBUG: userResponse is empty');
      return null;
    }

    // Buscar si tiene boda activa
    debugPrint('DEBUG: Querying listar_boda with usuario_id=$userId');
    final bodasResponse = await supabase
        .from('listar_boda')
        .select()
        .eq('usuario_id', userId)
        .eq('is_deleted', false);
    final List bodas = bodasResponse as List;
    debugPrint('DEBUG: Bodas query result: $bodas');
    final bool tieneBodaActiva = bodas.isNotEmpty;
    final String? bodaId =
        tieneBodaActiva ? bodas.first['id'].toString() : null;
    debugPrint('DEBUG: tieneBodaActiva: $tieneBodaActiva, bodaId: $bodaId');

    try {
      final model = RemarketingUserModel(
        id: userResponse['id'].toString(),
        nombre: userResponse['nombre'] ?? '',
        email: userResponse['email'] ?? '',
        fechaCreacion:
            DateTime.tryParse(userResponse['created_at'] ?? '') ?? DateTime.now(),
        tieneBodaActiva: tieneBodaActiva,
        bodaId: bodaId,
        mailto: 'mailto:${userResponse['email'] ?? ''}',
      );
      debugPrint('DEBUG: Successfully created RemarketingUserModel for userId: $userId');
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

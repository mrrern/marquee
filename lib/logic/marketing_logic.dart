import 'package:bodas/routes/linkspaper.dart';

class MarketingLogic {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<RemarketingUserModel>> getRemarketingUsers() async {
    // 1. Obtener todos los usuarios
    final usersResponse = await supabase.from('user_info').select();
    final List users = usersResponse as List;
    List<RemarketingUserModel> remarketingUsers = [];

    for (final user in users) {
      final String userId = user['id'].toString();
      final String nombre = user['nombre'] ?? '';
      final String email = user['email'] ?? '';
      final DateTime fechaCreacion =
          DateTime.tryParse(user['created_at'] ?? '') ?? DateTime.now();

      // 2. Buscar si tiene boda activa
      final bodasResponse = await supabase
          .from('listar_boda')
          .select()
          .eq('id', userId)
          .eq('is_deleted', false);
      final List bodas = bodasResponse as List;
      final bool tieneBodaActiva = bodas.isNotEmpty;
      final String? bodaId =
          tieneBodaActiva ? bodas.first['id'].toString() : null;

      remarketingUsers.add(RemarketingUserModel(
        id: userId,
        nombre: nombre,
        email: email,
        fechaCreacion: fechaCreacion,
        tieneBodaActiva: tieneBodaActiva,
        bodaId: bodaId,
        mailto: 'mailto:$email',
      ));
    }
    return remarketingUsers;
  }

  Future<RemarketingUserModel?> getRemarketingUser(String userId) async {
    final userResponse =
        await supabase.from('user_info').select().eq('id', userId).single();
    if (userResponse.isEmpty) return null;

    // Buscar si tiene boda activa
    final bodasResponse = await supabase
        .from('listar_boda')
        .select()
        .eq('usuario_id', userId)
        .eq('is_deleted', false);
    final List bodas = bodasResponse as List;
    final bool tieneBodaActiva = bodas.isNotEmpty;
    final String? bodaId =
        tieneBodaActiva ? bodas.first['id'].toString() : null;

    return RemarketingUserModel(
      id: userResponse['id'].toString(),
      nombre: userResponse['nombre'] ?? '',
      email: userResponse['email'] ?? '',
      fechaCreacion:
          DateTime.tryParse(userResponse['created_at'] ?? '') ?? DateTime.now(),
      tieneBodaActiva: tieneBodaActiva,
      bodaId: bodaId,
      mailto: 'mailto:${userResponse['email'] ?? ''}',
    );
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

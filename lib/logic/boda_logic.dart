import "package:bodas/routes/linkspaper.dart";

// Provider para WeddingLogic
final weddingLogicProvider = Provider<WeddingLogic>((ref) {
  final supabase = Supabase.instance.client;
  return WeddingLogic(supabase);
});

class WeddingLogic {
  final SupabaseClient supabase;

  WeddingLogic(this.supabase);

  // Crear una nueva boda
  Future<void> createWedding(Boda boda) async {
    final response = await supabase.from('boda').insert({
      'usuario_id': boda.usuarioId,
      'fecha': boda.fecha.toIso8601String(),
      'ubicacion': boda.ubicacion,
      'invitados': boda.invitados,
      'estado_id': boda.estadoId,
      'boda_tipo': boda.bodaTipo,
      'novio_nombre': boda.novioNombre,
      'novia_nombre': boda.noviaNombre,
      'phone_novio': boda.phoneNovio,
      'phone_novia': boda.phoneNovia,
      'novio_birthday': boda.novioBirthday.toIso8601String(),
      'novia_birthday': boda.noviaBirthday.toIso8601String(),
      'novio_email': boda.novioEmail,
      'novia_email': boda.noviaEmail,
      'is_deleted': false,
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    });
    if (response == null || response.error != null) {
      throw Exception('Error al crear la boda: ${response.error?.message}');
    }
  }

  // Editar una boda existente
  Future<void> updateWedding(Boda boda) async {
    final response = await supabase.from('boda').update({
      'fecha': boda.fecha.toIso8601String(),
      'ubicacion': boda.ubicacion,
      'invitados': boda.invitados,
      'estado_id': boda.estadoId,
      'boda_tipo': boda.bodaTipo,
      'novio_nombre': boda.novioNombre,
      'novia_nombre': boda.noviaNombre,
      'phone_novio': boda.phoneNovio,
      'phone_novia': boda.phoneNovia,
      'novio_birthday': boda.novioBirthday.toIso8601String(),
      'novia_birthday': boda.noviaBirthday.toIso8601String(),
      'novio_email': boda.novioEmail,
      'novia_email': boda.noviaEmail,
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', boda.id);
    if (response == null || response.error != null) {
      throw Exception(
          'Error al actualizar la boda: ${response.error?.message}');
    }
  }

  // Eliminar (soft delete) una boda
  Future<void> deleteWedding(String bodaId) async {
    final response = await supabase.from('boda').update({
      'is_deleted': true,
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', bodaId);
    if (response == null || response.error != null) {
      throw Exception('Error al eliminar la boda: ${response.error?.message}');
    }
  }

  // Obtener bodas usando el view listar_boda
  Future<List<Boda>> fetchWeddings(String usuarioId) async {
    final response = await supabase
        .from('listar_boda')
        .select()
        .eq('usuario_id', usuarioId)
        .eq('is_deleted', false);

    final data = response;
    return data.map((json) => Boda.fromJson(json)).toList();
  }

  // Obtener estados de boda
  Future<List<BodaEstado>> fetchBodaEstados() async {
    final response =
        await supabase.from('boda_estado').select().eq('is_deleted', false);

    final data = response;
    return data.map((json) => BodaEstado.fromJson(json)).toList();
  }

  // Obtener tipos de boda
  Future<List<BodaTipo>> fetchBodaTipos() async {
    final response =
        await supabase.from('boda_tipo').select().eq('is_deleted', false);

    final data = response;
    return data.map((json) => BodaTipo.fromJson(json)).toList();
  }
}

// StateNotifier para manejar la lista de bodas
class WeddingsNotifier extends StateNotifier<AsyncValue<List<Boda>>> {
  final WeddingLogic logic;
  final String usuarioId;

  WeddingsNotifier(this.logic, this.usuarioId)
      : super(const AsyncValue.loading()) {
    fetchWeddings();
  }

  Future<void> fetchWeddings() async {
    state = const AsyncValue.loading();
    try {
      final bodas = await logic.fetchWeddings(usuarioId);
      state = AsyncValue.data(bodas);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addWedding(Boda boda) async {
    try {
      await logic.createWedding(boda);
      await fetchWeddings();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final weddingsProvider = StateNotifierProvider.family<WeddingsNotifier,
    AsyncValue<List<Boda>>, String>(
  (ref, usuarioId) =>
      WeddingsNotifier(ref.watch(weddingLogicProvider), usuarioId),
);

// Provider para los estados de boda
final bodaEstadosProvider = FutureProvider<List<BodaEstado>>((ref) async {
  final logic = ref.watch(weddingLogicProvider);
  return logic.fetchBodaEstados();
});

// Provider para los tipos de boda
final bodaTiposProvider = FutureProvider<List<BodaTipo>>((ref) async {
  final logic = ref.watch(weddingLogicProvider);
  return logic.fetchBodaTipos();
});

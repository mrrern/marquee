import "package:bodas/routes/exports.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boda_logic.g.dart';

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
    try {
      await supabase.from('boda').insert({
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
        'is_active': boda.isActive,
        'created_at': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('Error al crear la boda: $e');
    }
  }

  // Editar una boda existente
  Future<void> updateWedding(Boda boda) async {
    try {
      await supabase.from('boda').update({
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
    } catch (e) {
      throw Exception('Error al actualizar la boda: $e');
    }
  }

  // Eliminar (soft delete) una boda
  Future<void> deleteWedding(String bodaId) async {
    try {
      await supabase.from('boda').update({
        'is_deleted': true,
        'updated_at': DateTime.now().toIso8601String(),
      }).eq('id', bodaId);
    } catch (e) {
      throw Exception('Error al eliminar la boda: $e');
    }
  }

  // Actualizar el estado isActive de una boda (cuando se acepta la cotización)
  Future<void> updateIsActive(String bodaId, bool isActive) async {
    try {
      await supabase.from('boda').update({
        'is_active': isActive,
        'updated_at': DateTime.now().toIso8601String(),
      }).eq('id', bodaId);
    } catch (e) {
      throw Exception('Error al actualizar el estado activo de la boda: $e');
    }
  }

  // Actualizar el estado de una boda (para el flujo de trabajo de cotización)
  Future<void> updateWeddingStatus(int bodaId, int newStatus) async {
    try {
      await supabase.from('boda').update({
        'estado_id': newStatus, // columna correcta en la tabla boda
        'updated_at': DateTime.now().toIso8601String(),
      }).eq('id', bodaId);
    } catch (e) {
      throw Exception('Error al actualizar el estado de la boda: $e');
    }
  }

  // Obtener bodas usando el view listar_boda
  Future<List<Boda>> fetchWeddings(String usuarioId) async {
    final response = await supabase
        .from('listar_boda')
        .select()
        .eq('user_id', usuarioId)
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

  // Obtener todas las bodas desde la vista listar_boda (sin filtrar por usuario)
  Future<List<Boda>> fetchAllFromListarBoda() async {
    final response =
        await supabase.from('listar_boda').select().eq('is_deleted', false);
    final data = response;
    return data.map((json) => Boda.fromJson(json)).toList();
  }

  // Obtener todas las filas crudas desde la vista listar_boda (map raw)
  Future<List<Map<String, dynamic>>> fetchAllListarBodaRaw() async {
    final response =
        await supabase.from('listar_boda').select().eq('is_deleted', false);
    final data = response as List<dynamic>;
    return data.map((e) => Map<String, dynamic>.from(e as Map)).toList();
  }

  // Obtener todas las filas crudas desde la vista musica_por_boda
  Future<List<Map<String, dynamic>>> fetchAllMusicaPorBodaRaw() async {
    final resp = await supabase.from('musica_por_boda').select();
    final data = resp as List<dynamic>;
    return data.map((e) => Map<String, dynamic>.from(e as Map)).toList();
  }

  /// Dada una lista de boda ids, retorna un mapa {bodaId: isMusicComplete}
  /// Determinamos 'completa' si existe al menos una fila en musica_por_boda
  /// para esa boda donde al menos un campo tiene valor no-nulo y no vacío.
  Future<Map<String, bool>> fetchMusicCompletenessForBodas(
      List<String> bodaIds) async {
    if (bodaIds.isEmpty) return {};
    final all = await fetchAllMusicaPorBodaRaw();
    final Map<String, List<Map<String, dynamic>>> grouped = {};
    for (final row in all) {
      final id =
          (row['boda_id'] ?? row['bodaId'] ?? row['id_boda'])?.toString();
      if (id == null) continue;
      if (!bodaIds.contains(id)) continue;
      grouped.putIfAbsent(id, () => []).add(row);
    }

    final Map<String, bool> result = {};
    for (final id in bodaIds) {
      final rows = grouped[id] ?? [];
      final complete = rows.any((r) =>
          r.values.any((v) => v != null && v.toString().trim().isNotEmpty));
      result[id] = complete;
    }
    return result;
  }
}


// Notifier para manejar la lista de bodas por usuario
@riverpod
class Weddings extends _$Weddings {
  @override
  Future<List<Boda>> build(String usuarioId) async {
    return ref.watch(weddingLogicProvider).fetchWeddings(usuarioId);
  }

  Future<void> addWedding(Boda boda) async {
    await ref.watch(weddingLogicProvider).createWedding(boda);
    ref.invalidateSelf();
  }
}

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

// Provider que devuelve todas las bodas (para uso administrativo)
final allWeddingsProvider = FutureProvider<List<Boda>>((ref) async {
  final logic = ref.watch(weddingLogicProvider);
  return logic.fetchAllFromListarBoda();
});

// Provider que devuelve solo las bodas marcadas como contratadas (estado 4)
// Para la UI admin de "contratados" vamos a retornar una lista de mapas
// con los campos necesarios extraídos de la vista `listar_boda`.
final contractedWeddingsProvider =
    FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final logic = ref.watch(weddingLogicProvider);
  final rows = await logic.fetchAllListarBodaRaw();
  // Filtrar solo bodas con estado_id == 4 (Contratada) — comparación numérica
  final filtered = rows.where((r) {
    final estado = r['estado_id'];
    return estado == 4;
  }).toList();

  return filtered;
});

@riverpod
class ContractedPagination extends _$ContractedPagination {
  @override
  ContractedPaginationState build() {
    // Iniciamos la carga al construir el notifier
    Future.microtask(() => loadItems());
    return const ContractedPaginationState();
  }

  Future<void> loadItems() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final all = await ref.watch(contractedWeddingsProvider.future);
      final totalPages =
          (all.length / state.itemsPerPage).ceil().clamp(1, 9999);
      final currentPageItems = all.take(state.itemsPerPage).toList();
      state = state.copyWith(
        allItems: all,
        currentPage: 1,
        totalPages: totalPages,
        currentPageItems: currentPageItems,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  void changePage(int page) {
    if (page < 1 || page > state.totalPages) return;
    final start = (page - 1) * state.itemsPerPage;
    final end = (start + state.itemsPerPage).clamp(0, state.allItems.length);
    final currentPageItems = state.allItems.sublist(start, end);
    state =
        state.copyWith(currentPage: page, currentPageItems: currentPageItems);
  }

  void updateItemsPerPage(int count) {
    final totalPages = (state.allItems.length / count).ceil().clamp(1, 9999);
    final currentPageItems = state.allItems.take(count).toList();
    state = state.copyWith(
      itemsPerPage: count,
      totalPages: totalPages,
      currentPage: 1,
      currentPageItems: currentPageItems,
    );
  }
}

/// Provider para el estado del formulario de boda
@riverpod
class WeddingForm extends _$WeddingForm {
  @override
  WeddingFormState build() => const WeddingFormState();

  void updateNovioNombre(String v) => state = state.copyWith(novioNombre: v);
  void updateNoviaNombre(String v) => state = state.copyWith(noviaNombre: v);
  void updatePhoneNovio(String v) => state = state.copyWith(phoneNovio: v);
  void updatePhoneNovia(String v) => state = state.copyWith(phoneNovia: v);
  void updateNovioEmail(String v) => state = state.copyWith(novioEmail: v);
  void updateNoviaEmail(String v) => state = state.copyWith(noviaEmail: v);
  void updateInvitados(String v) => state = state.copyWith(invitados: v);
  void updateUbicacion(String v) => state = state.copyWith(ubicacion: v);
  void updateNovioBirthday(DateTime v) =>
      state = state.copyWith(novioBirthday: v);
  void updateNoviaBirthday(DateTime v) =>
      state = state.copyWith(noviaBirthday: v);
  void updateSelectedBodaTipo(int v) =>
      state = state.copyWith(selectedBodaTipo: v);
  void updateIsActive(bool v) => state = state.copyWith(isActive: v);
  void reset() => state = const WeddingFormState();
}

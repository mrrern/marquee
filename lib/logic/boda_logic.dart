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

// Provider que devuelve todas las bodas (para uso administrativo)
final allWeddingsProvider = FutureProvider<List<Boda>>((ref) async {
  final logic = ref.watch(weddingLogicProvider);
  return logic.fetchAllFromListarBoda();
});

// Provider que devuelve solo las bodas marcadas como contratadas (filtrado cliente)
// Para la UI admin de "contratados" vamos a retornar una lista de mapas
// con los campos necesarios extraídos de la vista `listar_boda`.
final contractedWeddingsProvider =
    FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final logic = ref.watch(weddingLogicProvider);
  final rows = await logic.fetchAllListarBodaRaw();
  // Filtramos por la columna 'estado_boda' que viene en la vista
  final filtered = rows.where((r) {
    final estado = (r['estado_boda'] ?? '').toString().toLowerCase();
    return estado.contains('contrat');
  }).toList();

  return filtered;
});

class ContractedPaginationState {
  final List<Map<String, dynamic>> allItems;
  final List<Map<String, dynamic>> currentPageItems;
  final int currentPage;
  final int totalPages;
  final int itemsPerPage;
  final bool isLoading;
  final String? errorMessage;

  const ContractedPaginationState({
    this.allItems = const [],
    this.currentPageItems = const [],
    this.currentPage = 1,
    this.totalPages = 1,
    this.itemsPerPage = 10,
    this.isLoading = false,
    this.errorMessage,
  });

  ContractedPaginationState copyWith({
    List<Map<String, dynamic>>? allItems,
    List<Map<String, dynamic>>? currentPageItems,
    int? currentPage,
    int? totalPages,
    int? itemsPerPage,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ContractedPaginationState(
      allItems: allItems ?? this.allItems,
      currentPageItems: currentPageItems ?? this.currentPageItems,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class ContractedPaginationNotifier
    extends StateNotifier<ContractedPaginationState> {
  ContractedPaginationNotifier(this.ref)
      : super(const ContractedPaginationState()) {
    loadItems();
  }

  final Ref ref;

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

final contractedPaginationProvider = StateNotifierProvider<
    ContractedPaginationNotifier, ContractedPaginationState>((ref) {
  return ContractedPaginationNotifier(ref);
});

/// Provider para el estado del formulario de boda
final weddingFormProvider =
    StateNotifierProvider<WeddingFormNotifier, WeddingFormState>((ref) {
  return WeddingFormNotifier();
});

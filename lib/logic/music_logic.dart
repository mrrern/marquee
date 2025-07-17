import 'package:bodas/routes/linkspaper.dart';

// Provider para WeddingLogic
final musicLogicProvider = Provider<MusicLogic>((ref) {
  final supabase = Supabase.instance.client;
  return MusicLogic(supabase);
});

class MusicLogic {
  final SupabaseClient supabase;
  MusicLogic(this.supabase);
  // Crear nueva música para una boda
  Future<BodaMusic> createMusic(BodaMusic music) async {
    try {
      final response =
          await supabase.from('music').insert(music.toJson()).select().single();
      return BodaMusic.fromJson(response);
    } catch (e) {
      throw Exception('Error al crear la música: $e');
    }
  }

  // Actualizar música existente
  Future<BodaMusic> updateMusic(BodaMusic music) async {
    try {
      final response = await supabase
          .from('music')
          .update(music.toJson())
          .eq('id', music.id)
          .select()
          .single();
      return BodaMusic.fromJson(response);
    } catch (e) {
      throw Exception('Error al actualizar la música: $e');
    }
  }

  // Borrado lógico de música
  Future<void> deleteMusic(int musicId) async {
    try {
      await supabase
          .from('music')
          .update({'is_deleted': true}).eq('id', musicId);
    } catch (e) {
      throw Exception('Error al eliminar la música: $e');
    }
  }

  // Obtener música por ID de boda
  Future<BodaMusic?> getMusicByBodaId(int bodaId) async {
    try {
      final response = await supabase
          .from('music')
          .select()
          .eq('boda_id', bodaId)
          .eq('is_deleted', false)
          .single();
      return BodaMusic.fromJson(response);
    } catch (e) {
      if (e is PostgrestException && e.code == 'PGRST116') {
        return null; // No se encontró la música
      }
      throw Exception('Error al obtener la música: $e');
    }
  }

  // Obtener todas las músicas por boda usando la vista
  Future<List<Map<String, dynamic>>> getAllMusicByBoda() async {
    try {
      final response = await supabase
          .from('musica_por_boda')
          .select()
          .order('created_at', ascending: false);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Error al obtener las músicas: $e');
    }
  }

  // Obtener música por ID usando la vista
  Future<Map<String, dynamic>?> getMusicById(int musicId) async {
    try {
      final response = await supabase
          .from('musica_por_boda')
          .select()
          .eq('musica_id', musicId)
          .single();
      return response;
    } catch (e) {
      if (e is PostgrestException && e.code == 'PGRST116') {
        return null; // No se encontró la música
      }
      throw Exception('Error al obtener la música: $e');
    }
  }

  //obtener tipos de musica
  Future<List<MusicType>> getMusicType() async {
    try {
      final response = await supabase
          .from('music_types')
          .select()
          .eq('is_deleted', false)
          .order('id');

      print('Respuesta de Supabase: $response');

      final data = response as List;
      print('Número de tipos de música encontrados: ${data.length}');

      return data.map((json) => MusicType.fromJson(json)).toList();
    } catch (e) {
      print('Error al obtener tipos de música: $e');
      throw Exception('Error al obtener los tipos de música: $e');
    }
  }
}

// Estado de la música
class MusicState {
  final List<Map<String, dynamic>> musicList;
  final BodaMusic? currentMusic;
  final bool isLoading;
  final String? error;

  MusicState({
    this.musicList = const [],
    this.currentMusic,
    this.isLoading = false,
    this.error,
  });

  MusicState copyWith({
    List<Map<String, dynamic>>? musicList,
    BodaMusic? currentMusic,
    bool? isLoading,
    String? error,
  }) {
    return MusicState(
      musicList: musicList ?? this.musicList,
      currentMusic: currentMusic ?? this.currentMusic,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

// Notifier para manejar el estado de la música
class MusicNotifier extends StateNotifier<MusicState> {
  final MusicLogic _musicLogic;

  MusicNotifier(this._musicLogic) : super(MusicState());

  // Cargar todas las músicas
  Future<void> loadAllMusic() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final musicList = await _musicLogic.getAllMusicByBoda();
      state = state.copyWith(
        musicList: musicList,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  // Cargar música por ID de boda
  Future<void> loadMusicByBodaId(int bodaId) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final music = await _musicLogic.getMusicByBodaId(bodaId);
      state = state.copyWith(
        currentMusic: music,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  // Crear nueva música
  Future<void> createMusic(BodaMusic music) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final newMusic = await _musicLogic.createMusic(music);
      state = state.copyWith(
        currentMusic: newMusic,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  // Actualizar música
  Future<void> updateMusic(BodaMusic music) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final updatedMusic = await _musicLogic.updateMusic(music);
      state = state.copyWith(
        currentMusic: updatedMusic,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  // Eliminar música
  Future<void> deleteMusic(int musicId) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      await _musicLogic.deleteMusic(musicId);
      state = state.copyWith(
        currentMusic: null,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}

// Provider para el MusicNotifier
final musicProvider = StateNotifierProvider<MusicNotifier, MusicState>((ref) {
  final musicLogic = MusicLogic(supabase);
  return MusicNotifier(musicLogic);
});

final musicaTipoProvider = FutureProvider<List<MusicType>>((ref) async {
  final musicTyeProvider = ref.watch(musicLogicProvider);
  return musicTyeProvider.getMusicType();
});

import 'package:bodas/routes/exports.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'music_logic.g.dart';

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

      debugPrint('Respuesta de Supabase: $response');

      final data = response as List;
      debugPrint('Número de tipos de música encontrados: ${data.length}');

      return data.map((json) => MusicType.fromJson(json)).toList();
    } catch (e) {
      debugPrint('Error al obtener tipos de música: $e');
      throw Exception('Error al obtener los tipos de música: $e');
    }
  }
}

// Notifier de música migrado a @riverpod
@riverpod
class Music extends _$Music {
  @override
  Future<BodaMusic?> build(int bodaId) async {
    return ref.watch(musicLogicProvider).getMusicByBodaId(bodaId);
  }

  Future<void> createMusic(BodaMusic music) async {
    await ref.read(musicLogicProvider).createMusic(music);
    ref.invalidateSelf();
  }

  Future<void> updateMusic(BodaMusic music) async {
    await ref.read(musicLogicProvider).updateMusic(music);
    ref.invalidateSelf();
  }

  Future<void> deleteMusic(int musicId) async {
    await ref.read(musicLogicProvider).deleteMusic(musicId);
    ref.invalidateSelf();
  }
}

final musicaTipoProvider = FutureProvider<List<MusicType>>((ref) async {
  return ref.watch(musicLogicProvider).getMusicType();
});

import 'package:bodas/routes/linkspaper.dart';

class MusicLogic {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Crear nueva música para una boda
  Future<BodaMusic> createMusic(BodaMusic music) async {
    try {
      final response = await _supabase
          .from('music')
          .insert(music.toJson())
          .select()
          .single();
      return BodaMusic.fromJson(response);
    } catch (e) {
      throw Exception('Error al crear la música: $e');
    }
  }

  // Actualizar música existente
  Future<BodaMusic> updateMusic(BodaMusic music) async {
    try {
      final response = await _supabase
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
      await _supabase
          .from('music')
          .update({'is_deleted': true}).eq('id', musicId);
    } catch (e) {
      throw Exception('Error al eliminar la música: $e');
    }
  }

  // Obtener música por ID de boda
  Future<BodaMusic?> getMusicByBodaId(int bodaId) async {
    try {
      final response = await _supabase
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
      final response = await _supabase
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
      final response = await _supabase
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
}

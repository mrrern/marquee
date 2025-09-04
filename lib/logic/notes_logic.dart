import 'package:bodas/routes/linkspaper.dart';

class NotesLogic {
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Crea una nueva nota
  Future<NotesModel> createNote({
    required int bodaId,
    required String title,
    required String description,
    Map<String, dynamic>? images,
    String? file,
  }) async {
    try {
      final data = {
        'boda_id': bodaId,
        'title': title,
        'description': description,
        'images': images,
        'file': file,
        'created_at': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
        'is_deleted': false,
      };

      final response =
          await _supabase.from('notas').insert(data).select().single();

      return NotesModel.fromJson(response);
    } catch (e) {
      throw Exception('Error al crear la nota: $e');
    }
  }

  /// Actualiza una nota existente
  Future<NotesModel> updateNote({
    required int id,
    String? title,
    String? description,
    Map<String, dynamic>? images,
    String? file,
  }) async {
    try {
      final data = {
        if (title != null) 'title': title,
        if (description != null) 'description': description,
        if (images != null) 'images': images,
        if (file != null) 'file': file,
        'updated_at': DateTime.now().toIso8601String(),
      };

      final response = await _supabase
          .from('notas')
          .update(data)
          .eq('id', id)
          .select()
          .single();

      return NotesModel.fromJson(response);
    } catch (e) {
      throw Exception('Error al actualizar la nota: $e');
    }
  }

  /// Elimina una nota (soft delete)
  Future<void> deleteNote(int id) async {
    try {
      await _supabase.from('notas').update({
        'is_deleted': true,
        'updated_at': DateTime.now().toIso8601String(),
      }).eq('id', id);
    } catch (e) {
      throw Exception('Error al eliminar la nota: $e');
    }
  }

  /// Obtiene todas las notas de una boda
  Future<List<NotesModel>> getNotesByBodaId(int bodaId) async {
    try {
      final response = await _supabase
          .from('notas')
          .select()
          .eq('boda_id', bodaId)
          .eq('is_deleted', false)
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => NotesModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Error al obtener las notas: $e');
    }
  }

  /// Obtiene una nota específica por su ID
  Future<NotesModel> getNoteById(int id) async {
    try {
      final response =
          await _supabase.from('notas').select().eq('id', id).single();

      return NotesModel.fromJson(response);
    } catch (e) {
      throw Exception('Error al obtener la nota: $e');
    }
  }

  /// Responde a una nota (actualiza la descripción)
  Future<NotesModel> respondToNote({
    required int id,
    required String response,
  }) async {
    try {
      final note = await getNoteById(id);
      final updatedDescription = '${note.description}\n\nRespuesta: $response';

      return await updateNote(
        id: id,
        description: updatedDescription,
      );
    } catch (e) {
      throw Exception('Error al responder la nota: $e');
    }
  }

  /// Obtiene todas las notas del sistema junto con información mínima del usuario
  /// usando la vista `listar_notas` (la vista debe devolver campos de nota + campos de usuario)
  Future<List<AdminNoteView>> fetchAllNotes() async {
    try {
      final resp = await _supabase
          .from('listar_notas')
          .select()
          .order('created_at', ascending: false);
      final rows = (resp as List).cast<dynamic>();
      return rows.map((r) {
        final map = Map<String, dynamic>.from(r as Map);
        final note = NotesModel.fromJson(map);
        final usuarioId = map['usuario_id'] is int
            ? map['usuario_id'] as int
            : (map['user_id'] is int ? map['user_id'] as int : null);
        final usuarioNombre = map['usuario_nombre'] as String? ??
            map['nombre'] as String? ??
            map['user_nombre'] as String?;
        final usuarioEmail = map['usuario_email'] as String? ??
            map['email'] as String? ??
            map['user_email'] as String?;
        return AdminNoteView(
          note: note,
          usuarioId: usuarioId,
          usuarioNombre: usuarioNombre,
          usuarioEmail: usuarioEmail,
        );
      }).toList();
    } catch (e) {
      throw Exception('Error al obtener notas administrativas: $e');
    }
  }
}

// Nueva clase de vista para administradores
class AdminNoteView {
  final NotesModel note;
  final int? usuarioId;
  final String? usuarioNombre;
  final String? usuarioEmail;

  AdminNoteView({
    required this.note,
    this.usuarioId,
    this.usuarioNombre,
    this.usuarioEmail,
  });
}

// Provider para NotesLogic
final notesLogicProvider = Provider<NotesLogic>((ref) {
  return NotesLogic();
});

// StateNotifier para el listado administrador de notas
class AdminNotesNotifier
    extends StateNotifier<AsyncValue<List<AdminNoteView>>> {
  final NotesLogic logic;

  AdminNotesNotifier(this.logic) : super(const AsyncValue.loading()) {
    fetchAll();
  }

  Future<void> fetchAll() async {
    state = const AsyncValue.loading();
    try {
      final data = await logic.fetchAllNotes();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async => fetchAll();
}

final notesAdminProvider =
    StateNotifierProvider<AdminNotesNotifier, AsyncValue<List<AdminNoteView>>>(
  (ref) => AdminNotesNotifier(ref.watch(notesLogicProvider)),
);

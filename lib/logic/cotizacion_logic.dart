import 'package:bodas/routes/linkspaper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io';

part 'cotizacion_logic.freezed.dart';

class CotizacionLogic {
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Sube un archivo al storage de Supabase y crea un registro en la tabla uploaded_files
  ///
  /// [bodaId] - ID de la boda a la que pertenece el archivo
  /// [file] - Archivo a subir
  /// [isAdmin] - Indica si el archivo es subido por un administrador
  ///
  /// Retorna el objeto UploadedFile creado
  Future<CotizacionModel> uploadFile({
    required int bodaId,
    required File file,
    required bool isAdmin,
  }) async {
    try {
      // Crear el path del archivo en el storage
      final String fileName = file.path.split('/').last;
      final String storagePath = 'bodas/$bodaId/$fileName';

      // Subir el archivo al storage
      await _supabase.storage.from('archives-bodas').upload(storagePath, file);

      // Obtener la URL pública del archivo
      final String fileUrl =
          _supabase.storage.from('archives-bodas').getPublicUrl(storagePath);

      // Crear el registro en la tabla uploaded_files
      final Map<String, dynamic> data = {
        'boda_id': bodaId,
        if (isAdmin) 'file_path_admin': fileUrl,
        if (!isAdmin) 'file_path_user': fileUrl,
        'created_at': DateTime.now().toIso8601String(),
      };

      final response =
          await _supabase.from('uploaded_files').insert(data).select().single();

      return CotizacionModel.fromJson(response);
    } catch (e) {
      throw Exception('Error al subir el archivo: $e');
    }
  }

  /// Obtiene los archivos subidos para una boda específica
  Future<List<CotizacionModel>> getFilesByBodaId(int bodaId) async {
    try {
      final response = await _supabase
          .from('uploaded_files')
          .select()
          .eq('boda_id', bodaId)
          .eq('is_deleted', false);

      return response.map((json) => CotizacionModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error al obtener los archivos: $e');
    }
  }

  /// Elimina un archivo (soft delete)
  Future<void> deleteFile(int fileId) async {
    try {
      await _supabase
          .from('uploaded_files')
          .update({'is_deleted': true}).eq('id', fileId);
    } catch (e) {
      throw Exception('Error al eliminar el archivo: $e');
    }
  }

  /// Obtiene todas las solicitudes de cotización (mock, reemplaza con lógica real)
  Future<List<CotizacionRequest>> getAllCotizacionRequests() async {
    // Aquí deberías consultar Supabase y armar la lista real
    // Ejemplo mock:
    return _supabase.from('bodas_lista').select().then(
          (data) => (data as List)
              .map((json) => CotizacionRequest.fromJson(json))
              .toList(),
        );
  }
}

@freezed
abstract class CotizacionRequestPaginationState
    with _$CotizacionRequestPaginationState {
  const factory CotizacionRequestPaginationState({
    @Default([]) List<CotizacionRequest> allRequests,
    @Default([]) List<CotizacionRequest> currentPageRequests,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    @Default(10) int itemsPerPage,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _CotizacionRequestPaginationState;
}

class CotizacionRequestPaginationNotifier
    extends StateNotifier<CotizacionRequestPaginationState> {
  CotizacionRequestPaginationNotifier(this._logic)
      : super(const CotizacionRequestPaginationState()) {
    loadRequests();
  }

  final CotizacionLogic _logic;

  Future<void> loadRequests() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final all = await _logic.getAllCotizacionRequests();
      final totalPages =
          (all.length / state.itemsPerPage).ceil().clamp(1, 9999);
      final currentPageRequests = all.take(state.itemsPerPage).toList();
      state = state.copyWith(
        allRequests: all,
        currentPage: 1,
        totalPages: totalPages,
        currentPageRequests: currentPageRequests,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  void changePage(int page) {
    if (page < 1 || page > state.totalPages) return;
    final start = (page - 1) * state.itemsPerPage;
    final end = (start + state.itemsPerPage).clamp(0, state.allRequests.length);
    final currentPageRequests = state.allRequests.sublist(start, end);
    state = state.copyWith(
        currentPage: page, currentPageRequests: currentPageRequests);
  }

  void updateItemsPerPage(int count) {
    final totalPages = (state.allRequests.length / count).ceil().clamp(1, 9999);
    final currentPageRequests = state.allRequests.take(count).toList();
    state = state.copyWith(
      itemsPerPage: count,
      totalPages: totalPages,
      currentPage: 1,
      currentPageRequests: currentPageRequests,
    );
  }
}

final cotizacionRequestPaginationProvider = StateNotifierProvider<
    CotizacionRequestPaginationNotifier,
    CotizacionRequestPaginationState>((ref) {
  final logic = CotizacionLogic();
  return CotizacionRequestPaginationNotifier(logic);
});

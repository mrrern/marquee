import 'package:bodas/routes/linkspaper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io';
import 'package:bodas/controllers/user/user_model.dart';

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
      // Forzar un nombre estable para permitir sobrescritura admin/usuario
      final String originalName = file.path.split('/').last;
      final String ext =
          (originalName.contains('.') ? originalName.split('.').last : 'pdf')
              .toLowerCase();
      final String storagePath = 'bodas/$bodaId/cotizacion.$ext';

      // Intentar primero en bucket `cotizaciones`, si no existe usar `archives-bodas`
      final List<String> bucketCandidates = ['cotizaciones', 'archives-bodas'];
      String? selectedBucket;

      Object? lastError;
      for (final bucket in bucketCandidates) {
        try {
          await _supabase.storage.from(bucket).upload(storagePath, file,
              fileOptions: const FileOptions(upsert: true));
          selectedBucket = bucket;
          break;
        } catch (e) {
          lastError = e;
        }
      }

      if (selectedBucket == null) {
        throw Exception(
            'No se pudo subir el archivo a ningún bucket: $lastError');
      }

      // Generar URL firmada (los buckets son privados por RLS)
      final signed = await _supabase.storage
          .from(selectedBucket)
          .createSignedUrl(storagePath, 60 * 60 * 24 * 7); // 7 días
      final String fileUrl = signed;

      // Upsert en `uploaded_files` por boda_id
      final List existing = await _supabase
          .from('uploaded_files')
          .select('id')
          .eq('boda_id', bodaId)
          .limit(1);

      if (existing.isNotEmpty) {
        final int existingId = (existing.first)['id'] as int;
        final Map<String, dynamic> updateData = {
          if (isAdmin) 'file_path_admin': fileUrl,
          if (!isAdmin) 'file_path_user': fileUrl,
          'updated_at': DateTime.now().toIso8601String(),
        };
        final response = await _supabase
            .from('uploaded_files')
            .update(updateData)
            .eq('id', existingId)
            .select()
            .single();
        return CotizacionModel.fromJson(response);
      } else {
        final Map<String, dynamic> insertData = {
          'boda_id': bodaId,
          if (isAdmin) 'file_path_admin': fileUrl,
          if (!isAdmin) 'file_path_user': fileUrl,
          'created_at': DateTime.now().toIso8601String(),
          'updated_at': DateTime.now().toIso8601String(),
        };
        final response = await _supabase
            .from('uploaded_files')
            .insert(insertData)
            .select()
            .single();
        return CotizacionModel.fromJson(response);
      }
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

  /// Obtiene todas las solicitudes de cotización desde listar_boda
  Future<List<CotizacionRequest>> getAllCotizacionRequests() async {
    try {
      // Consultar desde la vista listar_boda
      final response =
          await _supabase.from('listar_boda').select().eq('is_deleted', false);

      // Mapear de Boda a CotizacionRequest
      return (response as List).map((json) {
        final boda = Boda.fromJson(json);

        // Determinar si está activa/contratada basándose en el estado
        final isActive = boda.estadoId.toLowerCase().contains('contrat') ||
            boda.estadoId.toLowerCase().contains('activ');

        return CotizacionRequest(
          userId: boda.usuarioId,
          nombre: '${boda.novioNombre} & ${boda.noviaNombre}',
          email: boda.novioEmail,
          telefonoNovio: boda.phoneNovio,
          telefonoNovia: boda.phoneNovia,
          lugarCeremonia: boda.ubicacion,
          isSumitedBoda: isActive,
          isActive: isActive,
          fechaUltimaBoda: boda.fecha,
          invitados: boda.invitados.round(),
          tipoCeremonia: boda.bodaTipo.toString(),
        );
      }).toList();
    } catch (e) {
      throw Exception('Error al obtener las solicitudes de cotización: $e');
    }
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

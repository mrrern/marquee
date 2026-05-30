import 'package:bodas/routes/exports.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:io';

part 'cotizacion_logic.freezed.dart';
part 'cotizacion_logic.g.dart';

class CotizacionLogic {
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Sube un archivo al storage de Supabase y crea un registro en la tabla uploaded_files
  Future<CotizacionModel> uploadFile({
    required int bodaId,
    required File file,
    required bool isAdmin,
  }) async {
    try {
      final String originalName = file.path.split('/').last;
      final String ext =
          (originalName.contains('.') ? originalName.split('.').last : 'pdf')
              .toLowerCase();
      final String storagePath = 'bodas/$bodaId/cotizacion.$ext';

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

      final signed = await _supabase.storage
          .from(selectedBucket)
          .createSignedUrl(storagePath, 60 * 60 * 24 * 7);
      final String fileUrl = signed;

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

  Future<void> deleteFile(int fileId) async {
    try {
      await _supabase
          .from('uploaded_files')
          .update({'is_deleted': true}).eq('id', fileId);
    } catch (e) {
      throw Exception('Error al eliminar el archivo: $e');
    }
  }

  Future<List<CotizacionRequest>> getAllCotizacionRequests() async {
    try {
      final response =
          await _supabase.from('listar_boda').select().eq('is_deleted', false);

      final allRequests = (response as List).map((json) {
        final boda = Boda.fromJson(json);

        return CotizacionRequest(
          userId: boda.usuarioId,
          nombre: '${boda.novioNombre} & ${boda.noviaNombre}',
          email: boda.novioEmail,
          telefonoNovio: boda.phoneNovio,
          telefonoNovia: boda.phoneNovia,
          lugarCeremonia: boda.ubicacion,
          isSumitedBoda: boda.isActive,
          isActive: boda.isActive,
          fechaUltimaBoda: boda.fecha,
          invitados: boda.invitados.round(),
          tipoCeremonia: boda.bodaTipo.toString(),
          estadoId: boda.estadoId,
          bodaId: boda.id,
        );
      }).toList();

      return allRequests.where((request) {
        final estado = request.estadoId ?? 0;
        return estado >= 1 && estado <= 3;
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

final cotizacionLogicProvider = Provider<CotizacionLogic>((ref) {
  return CotizacionLogic();
});

@riverpod
class CotizacionRequestPagination extends _$CotizacionRequestPagination {
  @override
  CotizacionRequestPaginationState build() {
    Future.microtask(() => loadRequests());
    return const CotizacionRequestPaginationState();
  }

  Future<void> loadRequests() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final all =
          await ref.read(cotizacionLogicProvider).getAllCotizacionRequests();
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

// El provider se accede como cotizacionRequestPaginationProvider
// generado por @riverpod desde la clase CotizacionRequestPagination.


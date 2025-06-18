import 'package:bodas/routes/linkspaper.dart';

import 'dart:io';

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
}

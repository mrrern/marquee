import 'package:bodas/routes/linkspaper.dart';
import 'dart:io';

enum UploadState {
  initial,
  loading,
  success,
  error,
}

class FileUploadWidget extends ConsumerStatefulWidget {
  final int bodaId;
  final VoidCallback? onUploadComplete;

  const FileUploadWidget({
    super.key,
    required this.bodaId,
    this.onUploadComplete,
  });

  @override
  ConsumerState<FileUploadWidget> createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends ConsumerState<FileUploadWidget> {
  UploadState _uploadState = UploadState.initial;
  String? _fileName;
  String? _errorMessage;

  Future<void> _pickFile() async {
    setState(() {
      _uploadState = UploadState.loading;
      _errorMessage = null;
    });

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null && result.files.single.path != null) {
        final file = File(result.files.single.path!);

        // Use CotizacionLogic to upload
        await CotizacionLogic().uploadFile(
          bodaId: widget.bodaId,
          file: file,
          isAdmin: false, // User upload
        );

        setState(() {
          _uploadState = UploadState.success;
          _fileName = result.files.single.name;
        });

        if (widget.onUploadComplete != null) {
          widget.onUploadComplete!();
        }
      } else {
        // User canceled
        setState(() {
          _uploadState = UploadState.initial;
        });
      }
    } catch (e) {
      setState(() {
        _uploadState = UploadState.error;
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xEED9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 71, horizontal: 59),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 640) {
            return SizedBox(
              width: 288,
              child: _buildUploadContent(),
            );
          }

          return Row(
            children: [
              _buildUploadIcon(),
              const SizedBox(width: 49),
              Expanded(
                child: Text(
                  _getUploadMessage(),
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF808080),
                    height: 1.0,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildUploadContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildUploadIcon(),
        const SizedBox(height: 20),
        Text(
          _getUploadMessage(),
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF808080),
            height: 1.0,
          ),
        ),
      ],
    );
  }

  Widget _buildUploadIcon() {
    switch (_uploadState) {
      case UploadState.initial:
        return InkWell(
          onTap: _pickFile,
          child: Container(
            width: 62,
            height: 62,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.upload_file,
              size: 30,
              color: Color(0xFF808080),
            ),
          ),
        );

      case UploadState.loading:
        return Container(
          width: 62,
          height: 62,
          padding: const EdgeInsets.all(5),
          child: const CircularProgressIndicator(
            color: Color(0xFF808080),
            strokeWidth: 3,
          ),
        );

      case UploadState.success:
        return Container(
          width: 62,
          height: 62,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check_circle,
            size: 30,
            color: Colors.green,
          ),
        );

      case UploadState.error:
        return InkWell(
          onTap: _pickFile,
          child: Container(
            width: 62,
            height: 62,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.error,
              size: 30,
              color: Colors.red,
            ),
          ),
        );
    }
  }

  String _getUploadMessage() {
    switch (_uploadState) {
      case UploadState.initial:
        return 'Sube aquí tu contrato firmado.';
      case UploadState.loading:
        return 'Subiendo archivo, por favor espere...';
      case UploadState.success:
        return 'Archivo ${_fileName ?? ""} subido correctamente. Gracias.';
      case UploadState.error:
        return _errorMessage != null && _errorMessage!.contains('User canceled')
            ? 'Subida cancelada.'
            : 'Error al subir el archivo. Intenta nuevamente.';
    }
  }
}

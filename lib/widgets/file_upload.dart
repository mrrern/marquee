import 'package:bodas/routes/linkspaper.dart';

enum UploadState {
  initial,
  loading,
  success,
  error,
}

class FileUploadWidget extends StatefulWidget {
  const FileUploadWidget({super.key});

  @override
  State<FileUploadWidget> createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  UploadState _uploadState = UploadState.initial;
  String? _fileName;

  Future<void> _pickFile() async {
    setState(() {
      _uploadState = UploadState.loading;
    });

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null) {
        // Simulate upload process
        await Future.delayed(const Duration(seconds: 2));

        // For demo purposes, we'll randomly succeed or fail
        final bool success = DateTime.now().millisecondsSinceEpoch % 2 == 0;

        setState(() {
          if (success) {
            _uploadState = UploadState.success;
            _fileName = result.files.single.name;
          } else {
            _uploadState = UploadState.error;
          }
        });
      } else {
        // User canceled the picker
        setState(() {
          _uploadState = UploadState.initial;
        });
      }
    } catch (e) {
      setState(() {
        _uploadState = UploadState.error;
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
          // For mobile screens, use a more compact layout
          if (constraints.maxWidth < 640) {
            return SizedBox(
              width: 288,
              child: _buildUploadContent(),
            );
          }

          // For larger screens
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
        return 'Agradecemos tu registro. Te enviaremos a la brevedad posible tu presupuesto con la información proporcionada.';
      case UploadState.loading:
        return 'Subiendo archivo, por favor espere...';
      case UploadState.success:
        return 'Archivo $_fileName subido correctamente. Te enviaremos a la brevedad posible tu presupuesto.';
      case UploadState.error:
        return 'Error al subir el archivo. Por favor, intenta nuevamente.';
    }
  }
}
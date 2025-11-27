import 'package:bodas/routes/linkspaper.dart';
import 'dart:io';

class NoteCard extends StatelessWidget {
  final NotesModel note;

  const NoteCard({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => NoteDetailDialog(note: note),
        );
      },
      child: Container(
        width: 217,
        height: 241,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 20),
              blurRadius: 0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Note header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // User info (puedes personalizar si tienes usuario)
                Row(
                  children: [
                    // Avatar placeholder
                    CircleAvatar(
                      radius: 20,
                      foregroundColor: grey,
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    // User details
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          note.title,
                          style: const TextStyle(
                            color: Color(0xFF101828),
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          note.createdAt != null
                              ? DateFormat('dd/MM/yy').format(note.createdAt!)
                              : 'Sin fecha',
                          style: const TextStyle(
                            color: Color(0xFF667085),
                            fontFamily: 'Inter',
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Pin
                Container(
                  width: 18,
                  height: 17,
                  decoration: const BoxDecoration(
                    color: Color(0xFF9F9F9F),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Note content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.description,
                      style: const TextStyle(
                        color: Color(0xFFA8A8A8),
                        fontFamily: 'Inter',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                      ),
                    ),
                    if (note.images != null && note.images!.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      _buildImagesGrid(note.images!),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagesGrid(Map<String, dynamic> images) {
    final imageList = images.values.whereType<String>().toList();
    if (imageList.isEmpty) return const SizedBox.shrink();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: imageList.length > 4 ? 4 : imageList.length,
      itemBuilder: (context, index) {
        if (index == 3 && imageList.length > 4) {
          // Show a +X more overlay on the last visible image
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                imageList[index],
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withValues(alpha: 0.5),
                child: Center(
                  child: Text(
                    '+${imageList.length - 3}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return Image.network(
          imageList[index],
          fit: BoxFit.cover,
        );
      },
    );
  }
}

// Diálogo para agregar nota
class AddNoteDialog extends ConsumerStatefulWidget {
  final int bodaId;
  final VoidCallback? onNoteAdded;
  const AddNoteDialog({super.key, required this.bodaId, this.onNoteAdded});

  @override
  ConsumerState<AddNoteDialog> createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends ConsumerState<AddNoteDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  final List<File> _selectedImages = [];

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _pickImages() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );

      if (result != null) {
        setState(() {
          _selectedImages.addAll(result.paths.map((path) => File(path!)));
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error al seleccionar imágenes: $e';
      });
    }
  }

  Future<void> _submitNote() async {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();

    if (title.isEmpty || content.isEmpty) {
      setState(() {
        _errorMessage = 'Por favor, completa el título y la descripción';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final Map<String, dynamic> imageUrls = {};

      // Subir imágenes si hay seleccionadas
      if (_selectedImages.isNotEmpty) {
        final notesLogic = ref.read(notesLogicProvider);
        for (var i = 0; i < _selectedImages.length; i++) {
          final file = _selectedImages[i];
          final url = await notesLogic.uploadImage(
            bodaId: widget.bodaId,
            file: file,
          );
          imageUrls['image_$i'] = url;
        }
      }

      await ref.read(notesProvider.notifier).addNote(
            bodaId: widget.bodaId,
            title: title,
            description: content,
            images: imageUrls,
          );
      if (widget.onNoteAdded != null) {
        widget.onNoteAdded!();
      }
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Error al guardar la nota: $e';
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Agregar Nota',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF101828),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: 'Título de la nota',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _contentController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Descripción...',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            const SizedBox(height: 10),
            // Área de selección de imágenes
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _pickImages,
                  icon: const Icon(Icons.image, size: 18),
                  label: const Text('Adjuntar Imagen'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF667085),
                    elevation: 0,
                    side: const BorderSide(color: Color(0xFFD0D5DD)),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '${_selectedImages.length} imágenes seleccionadas',
                  style: const TextStyle(
                    color: Color(0xFF667085),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            if (_selectedImages.isNotEmpty) ...[
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _selectedImages.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              image: FileImage(_selectedImages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 8,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedImages.removeAt(index);
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.black54,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                size: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
            if (_errorMessage != null) ...[
              const SizedBox(height: 10),
              Text(
                _errorMessage!,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ],
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed:
                      _isLoading ? null : () => Navigator.of(context).pop(),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(
                      color: Color(0xFF667085),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _isLoading ? null : _submitNote,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD9D9D9),
                    foregroundColor: Colors.black,
                    elevation: 7,
                    shadowColor: Colors.black.withValues(alpha: 0.25),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Guardar Nota'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Diálogo de detalle de nota
class NoteDetailDialog extends StatelessWidget {
  final NotesModel note;
  const NoteDetailDialog({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 850;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: isMobile ? size.width * 0.9 : 600,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Note header
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      style: const TextStyle(
                        color: Color(0xFF101828),
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      note.createdAt != null
                          ? DateFormat('dd/MM/yy').format(note.createdAt!)
                          : 'Sin fecha',
                      style: const TextStyle(
                        color: Color(0xFF667085),
                        fontFamily: 'Inter',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const Divider(height: 30),
            // Note content
            Text(
              note.description,
              style: const TextStyle(
                color: Color(0xFF101828),
                fontFamily: 'Inter',
                fontSize: 14,
                height: 1.5,
              ),
            ),
            if (note.images != null && note.images!.isNotEmpty) ...[
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: note.images!.values
                      .whereType<String>()
                      .map((img) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.network(img, fit: BoxFit.contain),
                          ))
                      .toList(),
                ),
              ),
            ],
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD9D9D9),
                  foregroundColor: Colors.black,
                ),
                child: const Text('Cerrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

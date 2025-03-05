import 'package:bodas/routes/linkspaper.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;

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
                // User info
                Row(
                  children: [
                    // User avatar
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(note.userAvatar),
                    ),
                    const SizedBox(width: 12),
                    // User details
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          note.userName,
                          style: const TextStyle(
                            color: Color(0xFF101828),
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          DateFormat('dd/MM/yy').format(note.date),
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
                      note.content,
                      style: const TextStyle(
                        color: Color(0xFFA8A8A8),
                        fontFamily: 'Inter',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                      ),
                    ),
                    if (note.images.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      _buildImagesGrid(),
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

  Widget _buildImagesGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: note.images.length > 4 ? 4 : note.images.length,
      itemBuilder: (context, index) {
        if (index == 3 && note.images.length > 4) {
          // Show a +X more overlay on the last visible image
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                note.images[index],
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: Text(
                    '+${note.images.length - 3}',
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
        return Image.asset(
          note.images[index],
          fit: BoxFit.cover,
        );
      },
    );
  }
}




//Adds Notes
class AddNoteDialog extends ConsumerStatefulWidget {
  const AddNoteDialog({super.key});

  @override
  ConsumerState<AddNoteDialog> createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends ConsumerState<AddNoteDialog> {
  final TextEditingController _contentController = TextEditingController();
  final List<String> _selectedImages = [];
  bool _isLoading = false;
  String? _errorMessage;

  static const int maxImages = 6;

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _pickImages() async {
    if (_selectedImages.length >= maxImages) {
      setState(() {
        _errorMessage = 'No puedes agregar más de $maxImages imágenes';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );

      if (result != null) {
        final paths = result.paths
            .where((path) => path != null)
            .map((path) => path!)
            .toList();

        // Check if adding these would exceed the limit
        if (_selectedImages.length + paths.length > maxImages) {
          setState(() {
            _errorMessage = 'Solo puedes agregar hasta $maxImages imágenes en total';
            // Add as many as possible up to the limit
            final remainingSlots = maxImages - _selectedImages.length;
            if (remainingSlots > 0) {
              _selectedImages.addAll(paths.take(remainingSlots));
            }
          });
        } else {
          setState(() {
            _selectedImages.addAll(paths);
          });
        }
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error al seleccionar imágenes: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
      _errorMessage = null;
    });
  }

  void _submitNote() {
    final content = _contentController.text.trim();

    if (content.isEmpty) {
      setState(() {
        _errorMessage = 'Por favor, escribe algún contenido para la nota';
      });
      return;
    }

    // Add the note using the provider
    ref.read(notesProvider.notifier).addNote(
      content: content,
      userName: 'Usuario', // This would come from user authentication
      userAvatar: 'assets/images/user_avatar.png', // This would come from user profile
      images: _selectedImages,
    );

    Navigator.of(context).pop();
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
              controller: _contentController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Escribe tu nota aquí...',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _pickImages,
                  icon: const Icon(Icons.image),
                  label: Text(_isLoading
                    ? 'Cargando...'
                    : 'Agregar imágenes (${_selectedImages.length}/$maxImages)'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD9D9D9),
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
            ),
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
            if (_selectedImages.isNotEmpty) ...[
              const SizedBox(height: 20),
              const Text(
                'Imágenes seleccionadas:',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _selectedImages.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage(_selectedImages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 5,
                          right: 15,
                          child: GestureDetector(
                            onTap: () => _removeImage(index),
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                size: 18,
                                color: Colors.red,
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(
                      color: Color(0xFF667085),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _submitNote,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD9D9D9),
                    foregroundColor: Colors.black,
                    elevation: 7,
                    shadowColor: Colors.black.withValues(alpha: 0.25),
                  ),
                  child: const Text('Guardar Nota'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class NoteDetailDialog extends StatefulWidget {
  final NoteModel note;

  const NoteDetailDialog({
    super.key,
    required this.note,
  });

  @override
  State<NoteDetailDialog> createState() => _NoteDetailDialogState();
}

class _NoteDetailDialogState extends State<NoteDetailDialog> {
  int _currentImageIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

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
                  backgroundImage: AssetImage(widget.note.userAvatar),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.note.userName,
                      style: const TextStyle(
                        color: Color(0xFF101828),
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      DateFormat('dd/MM/yy').format(widget.note.date),
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
              widget.note.content,
              style: const TextStyle(
                color: Color(0xFF101828),
                fontFamily: 'Inter',
                fontSize: 14,
                height: 1.5,
              ),
            ),

            // Images carousel if there are images
            if (widget.note.images.isNotEmpty) ...[
              const SizedBox(height: 20),
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                ),
                items: widget.note.images.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              // Image indicators
              if (widget.note.images.length > 1) ...[
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < widget.note.images.length; i++)
                      GestureDetector(
                        onTap: () {
                          _carouselController.animateToPage(i);
                        },
                        child: Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentImageIndex == i
                                ? const Color(0xFF101828)
                                : const Color(0xFFD9D9D9),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ],

            const SizedBox(height: 20),

            // Close button
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

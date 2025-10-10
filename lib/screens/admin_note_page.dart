import 'package:bodas/routes/linkspaper.dart';

class NotesAdminScreen extends ConsumerStatefulWidget {
  const NotesAdminScreen({super.key});

  @override
  ConsumerState<NotesAdminScreen> createState() => _AdminNotesScreenState();
}

class _AdminNotesScreenState extends ConsumerState<NotesAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      _buildWebLayout(
        context,
      ),
      mobile: _buildWebLayout(context, isMobile: true),
      web: _buildWebLayout(context),
    );
  }

  Widget _buildWebLayout(BuildContext context, {isMobile = false}) {
    final notesState = ref.watch(notesAdminProvider);

    return notesState.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, st) => Scaffold(
        body: Stack(
          children: [
            // Background color
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
            ),

            // Noise texture
            Positioned(
              top: -0.8,
              left: -1,
              child: Transform.rotate(
                angle: 179.864 * (3.14159 / 180), // Convert degrees to radians
                child: Image.asset(
                  back2,
                  width: 1442,
                  height: 1028,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Gradient overlay
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 359,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF0C0C0C),
                      Color(0x00737373),
                    ],
                  ),
                ),
              ),
            ),

            // Main Content (error message)
            Positioned.fill(
              child: Center(
                child: SizedBox(
                    width: isMobile ? 400 : 1000,
                    height: isMobile ? 500 : 850,
                    child: Text('Error cargando notas: $e')),
              ),
            ),

            // Header
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AdminNavBar(),
            ),
          ],
        ),
      ),
      data: (notes) {
        return Scaffold(
          body: Stack(
            children: [
              // Background color
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
              ),

              // Noise texture
              Positioned(
                top: -0.8,
                left: -1,
                child: Transform.rotate(
                  angle:
                      179.864 * (3.14159 / 180), // Convert degrees to radians
                  child: Image.asset(
                    back2,
                    width: 1442,
                    height: 1028,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Gradient overlay
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 359,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF0C0C0C),
                        Color(0x00737373),
                      ],
                    ),
                  ),
                ),
              ),

              //Barra incial
              Positioned(
                top: isMobile ? 120 : 110,
                left: isMobile ? 10 : 50,
                right: isMobile ? 10 : 50,
                child: SizedBox(
                  width: isMobile ? double.infinity : 800,
                  height: isMobile ? 60 : 70,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Todas las notas del sistema. Aquí puedes ver a qué usuario pertenece cada nota y gestionarlas.",
                            style: TextStyle(
                              color: const Color(0xFF797979),
                              fontFamily: 'Inter',
                              fontSize: isMobile ? 12 : 15,
                              fontWeight: FontWeight.w500,
                              height: 1.3,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () =>
                              ref.read(notesAdminProvider.notifier).refresh(),
                          icon: const Icon(Icons.refresh),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Main Content (notes list)
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: isMobile ? 200 : 190,
                    left: isMobile ? 10 : 50,
                    right: isMobile ? 10 : 50,
                    bottom: 20,
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 570),
                      padding: EdgeInsets.all(isMobile ? 10 : 20),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(pizarra),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: notes.isEmpty
                          ? const Center(
                              child: Text(
                                'No hay notas registradas',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: isMobile ? 1 : 3,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: isMobile ? 3 / 1 : 217 / 241,
                              ),
                              itemCount: notes.length,
                              itemBuilder: (context, index) {
                                final item = notes[index];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: Colors.white
                                            .withValues(alpha: 0.85),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        item.usuarioNombre != null
                                            ? 'Usuario: ${item.usuarioNombre} ${item.usuarioEmail != null ? '(${item.usuarioEmail})' : ''}'
                                            : 'Usuario ID: ${item.usuarioId ?? 'desconocido'}',
                                        style: const TextStyle(
                                          color: Color(0xFF333333),
                                          fontFamily: 'Inter',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    // NoteCard acepta NotesModel; usamos item.note
                                    Expanded(child: NoteCard(note: item.note)),
                                  ],
                                );
                              },
                            ),
                    ),
                  ),
                ),
              ),
              // Header
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AdminNavBar(),
              ),
            ],
          ),
        );
      },
    );
  }
}

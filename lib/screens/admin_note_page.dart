import 'package:bodas/routes/linkspaper.dart';

class NotesAdminScreen extends ConsumerStatefulWidget {
  const NotesAdminScreen({super.key});

  @override
  ConsumerState<NotesAdminScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends ConsumerState<NotesAdminScreen> {
  Future<int?> _getBodaIdForUser() async {
    final prefs = await SharedPreferences.getInstance();
    final usuarioId = prefs.getString('usuarioId');
    if (usuarioId == null) return null;

    // Suponiendo que tienes un método para obtener bodas por usuarioId
    final bodas = await ref.read(weddingLogicProvider).fetchWeddings(usuarioId);
    if (bodas.isEmpty) return null;
    return bodas.first.id; // O la lógica que prefieras
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int?>(
      future: _getBodaIdForUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        final bodaId = snapshot.data;
        if (bodaId == null) {
          return _NotesEmptyScreen();
        }

        // Cargar notas y mostrar la UI normal
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final size = MediaQuery.of(context).size;
          final isMobile = size.width < 850;
          ref.read(notesProvider.notifier).updateNotesPerPage(isMobile ? 2 : 4);
          ref.read(notesProvider.notifier).loadNotes(bodaId: bodaId);
        });

        return _NotesScreenBody(bodaId: bodaId);
      },
    );
  }
}

// Extrae la lógica de la UI a un widget aparte para recibir el bodaId
class _NotesScreenBody extends ConsumerWidget {
  final int bodaId;
  const _NotesScreenBody({required this.bodaId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 850;

    // Escucha el estado de las notas
    final notesState = ref.watch(notesProvider);

    return Scaffold(
      body: _buildResponsiveLayout(context, isMobile, notesState, ref),
    );
  }

  Widget _buildResponsiveLayout(BuildContext context, bool isMobile,
      NotesState notesState, WidgetRef ref) {
    return Row(
      children: [
        // Main content
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 10 : 40,
              vertical: isMobile ? 10 : 20,
            ),
            child: Column(
              children: [
                // Header
                AdminNavBar(),

                // Notes container
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Notes header with description
                        _buildNotesHeader(isMobile, context, ref),

                        const SizedBox(height: 20),

                        // Cork board with notes
                        _buildCorkBoard(context, notesState, isMobile),

                        const SizedBox(height: 20),

                        // Pagination
                        _buildPagination(notesState, ref),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotesHeader(bool isMobile, BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Nuestros clientes hablan sobre sus experiencias y preferencias a través de nuestras notas.\n\nNota: Este apartado es exclusivo para clientes que ya han contratado nuestros servicios.",
              style: TextStyle(
                color: const Color(0xFF797979),
                fontFamily: 'Inter',
                fontSize: isMobile ? 12 : 15,
                fontWeight: FontWeight.w500,
                height: 1.3,
              ),
              textAlign: isMobile ? TextAlign.left : TextAlign.center,
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AddNoteDialog(
                  bodaId: bodaId,
                  onNoteAdded: () {
                    ref.read(notesProvider.notifier).loadNotes(bodaId: bodaId);
                  },
                ),
              );
            },
            child: Container(
              width: 56,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 7),
                    blurRadius: 0,
                  ),
                ],
              ),
              child: const Icon(
                Icons.add,
                size: 30,
                color: Color(0xFF667085),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCorkBoard(
      BuildContext context, NotesState notesState, bool isMobile) {
    return Container(
      constraints: const BoxConstraints(minHeight: 570),
      padding: EdgeInsets.all(isMobile ? 10 : 20),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(pizarra),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: notesState.currentPageNotes.isEmpty
          ? const Center(
              child: Text(
                'No hay notas para mostrar',
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 2 : 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 217 / 241,
              ),
              itemCount: notesState.currentPageNotes.length,
              itemBuilder: (context, index) {
                final note = notesState.currentPageNotes[index];
                return NoteCard(note: note);
              },
            ),
    );
  }

  Widget _buildPagination(NotesState notesState, WidgetRef ref) {
    return Container(
      width: 194,
      height: 39,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 1; i <= notesState.totalPages; i++)
            GestureDetector(
              onTap: () => ref.read(notesProvider.notifier).changePage(i),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  i == notesState.currentPage ? 'Pag $i' : '$i',
                  style: TextStyle(
                    color: i == notesState.currentPage
                        ? Colors.black
                        : const Color(0xFF999999),
                    fontFamily: 'Inter',
                    fontSize: 15,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Widget para pantalla vacía de notas
class _NotesEmptyScreen extends StatelessWidget {
  const _NotesEmptyScreen();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 850;
    const emptyText = 'No tienes bodas registradas.';

    return Scaffold(
      body: Row(
        children: [
          // Main content
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 10 : 40,
                vertical: isMobile ? 10 : 20,
              ),
              child: Column(
                children: [
                  // Header
                  AdminNavBar(),

                  // Notes container
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Notes header with description
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    emptyText,
                                    style: TextStyle(
                                      color: const Color(0xFF797979),
                                      fontFamily: 'Inter',
                                      fontSize: isMobile ? 12 : 15,
                                      fontWeight: FontWeight.w500,
                                      height: 1.3,
                                    ),
                                    textAlign: isMobile
                                        ? TextAlign.left
                                        : TextAlign.center,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Container(
                                  width: 56,
                                  height: 52,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0, 7),
                                        blurRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Color(0xFF667085),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Cork board con mensaje vacío
                          Container(
                            constraints: const BoxConstraints(minHeight: 570),
                            padding: EdgeInsets.all(isMobile ? 10 : 20),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(pizarra),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                emptyText,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Paginación con mensaje vacío
                          Container(
                            width: 194,
                            height: 39,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                emptyText,
                                style: TextStyle(
                                  color: Color(0xFF999999),
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

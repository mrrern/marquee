import 'package:bodas/routes/linkspaper.dart';

class NotesScreen extends ConsumerStatefulWidget {
  const NotesScreen({super.key});

  @override
  ConsumerState<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends ConsumerState<NotesScreen> {
  @override
  void initState() {
    super.initState();
    // Update notes per page based on screen size
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      final isMobile = size.width < 850;
      ref.read(notesProvider.notifier).updateNotesPerPage(isMobile ? 2 : 4);
    });
  }

  void _showAddNoteDialog() {
    showDialog(
      context: context,
      builder: (context) => const AddNoteDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 850;

    // Listen to notes state
    final notesState = ref.watch(notesProvider);

    return Scaffold(
      body: _buildResponsiveLayout(context, isMobile, notesState),
    );
  }

  Widget _buildResponsiveLayout(BuildContext context, bool isMobile, NotesState notesState) {
    return Row(
      children: [
        // Sidebar
        SidebarMenu(),

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
                HeaderWidget(),

                // Notes container
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Notes header with description
                        _buildNotesHeader(isMobile),

                        const SizedBox(height: 20),

                        // Cork board with notes
                        _buildCorkBoard(context, notesState, isMobile),

                        const SizedBox(height: 20),

                        // Pagination
                        _buildPagination(notesState),
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

  

  Widget _buildNotesHeader(bool isMobile) {
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
              "Contáctanos a través de nuestras notas para conocer tus preferencias o resolver cualquier duda que puedas tener. Estas pueden referirse a especificaciones técnicas, contratación de servicios adicionales o cuestiones relacionadas con tu ficha musical.\n\nNota: Este apartado es exclusivo para clientes que ya han contratado nuestros servicios.",
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
            onTap: _showAddNoteDialog,
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

  Widget _buildCorkBoard(BuildContext context, NotesState notesState, bool isMobile) {
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

  Widget _buildPagination(NotesState notesState) {
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
                    color: i == notesState.currentPage ? Colors.black : const Color(0xFF999999),
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
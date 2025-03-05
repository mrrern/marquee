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
        _buildSidebar(isMobile),

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
                _buildHeader(isMobile),

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

  Widget _buildSidebar(bool isMobile) {
    return Container(
      width: isMobile ? 60 : 215,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 10 : 20),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // Logo
          if (!isMobile) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'assets/images/logo.png',
                width: 216,
                height: 46,
              ),
            ),
            const SizedBox(height: 30),
          ],

          // Welcome text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Bienvenido",
              style: TextStyle(
                color: const Color(0xFF4E4C4C),
                fontFamily: 'Inter',
                fontSize: isMobile ? 18 : 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Navigation links
          _buildNavItem(isMobile, 'ti-user', 'Registro'),
          _buildNavItem(isMobile, 'ti-calculator', 'Cotización'),
          _buildNavItem(isMobile, 'ti-music', 'Ficha musical'),
          _buildNavItem(isMobile, 'ti-notes', 'Notas', isActive: true),
          _buildNavItem(isMobile, 'ti-bell', 'Notificación'),
        ],
      ),
    );
  }

  Widget _buildNavItem(bool isMobile, String icon, String label, {bool isActive = false}) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: isMobile ? 0 : 20,
      ),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Icon(
            _getIconData(icon),
            size: 25,
            color: isActive ? Colors.black : const Color(0xFFA3A3A3),
          ),
          if (!isMobile) ...[
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.black : const Color(0xFFA3A3A3),
                fontFamily: 'Inter',
                fontSize: 15,
              ),
            ),
          ],
        ],
      ),
    );
  }

  IconData _getIconData(String icon) {
    switch (icon) {
      case 'ti-user':
        return Icons.person;
      case 'ti-calculator':
        return Icons.calculate;
      case 'ti-music':
        return Icons.music_note;
      case 'ti-notes':
        return Icons.note;
      case 'ti-bell':
        return Icons.notifications;
      default:
        return Icons.circle;
    }
  }

  Widget _buildHeader(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Notas",
            style: TextStyle(
              color: const Color(0xFF888888),
              fontFamily: 'Inter',
              fontSize: isMobile ? 30 : 45,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Salir",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontSize: isMobile ? 16 : 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
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
          image: AssetImage('assets/images/cork_board.png'),
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
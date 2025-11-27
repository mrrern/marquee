import 'package:bodas/routes/linkspaper.dart';

class NotesScreen extends ConsumerStatefulWidget {
  const NotesScreen({super.key});

  @override
  ConsumerState<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends ConsumerState<NotesScreen> {
  Future<int?> _getBodaIdForUser() async {
    final prefs = await SharedPreferences.getInstance();
    final usuarioId = prefs.getString('usuarioId');
    if (usuarioId == null) return null;

    try {
      final bodas =
          await ref.read(weddingLogicProvider).fetchWeddings(usuarioId);
      if (bodas.isEmpty) return null;
      // Retornamos el ID de la primera boda encontrada
      // (asumiendo que el usuario solo tiene una boda activa o queremos la primera)
      return bodas.first.id;
    } catch (e) {
      debugPrint('Error fetching wedding for user: $e');
      return null;
    }
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final notesState = ref.watch(notesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              // Background (using same as music_form_page or keeping white/default)
              // music_form_page uses 'background' asset. note_page didn't have a global background image before,
              // but to match structure we can add one or just keep it white.
              // Assuming we want to keep the "clean" look or use the same background if available.
              // I'll use the 'background' asset if it's available in linkspaper, otherwise just white.
              // Looking at music_form_page, it uses `background`.
              Positioned.fill(
                child: SizedBox(
                  width: width,
                  height: height,
                  child: Image.asset(
                    back2,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: SizedBox(
                      width: width,
                      height: height,
                      child: Responsive(
                        SingleChildScrollView(
                            child: _buildContent(context, ref, notesState,
                                isTablet: true)),
                        mobile: SingleChildScrollView(
                            child: _buildContent(context, ref, notesState,
                                isMobile: true)),
                        web: SingleChildScrollView(
                            child: _buildContent(context, ref, notesState)),
                      ),
                    ),
                  )),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child:
                      HeaderWidget(), // User changed HeaderWidget to NavBar in previous step
                ),
              ),
              Align(
                alignment: const Alignment(-1, 0),
                child: SidebarMenu(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
      BuildContext context, WidgetRef ref, NotesState notesState,
      {bool isMobile = false, bool isTablet = false}) {
    return Container(
      // color: Colors.white, // Optional, music_form_page has it
      padding: const EdgeInsets.only(bottom: 40),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20.0 : 200.0,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add spacing for the fixed header
            SizedBox(height: isMobile ? 80 : 100),
            _buildResponsiveContent(context, ref, notesState,
                isMobile: isMobile, isTablet: isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveContent(
      BuildContext context, WidgetRef ref, NotesState notesState,
      {bool isMobile = false, bool isTablet = false}) {
    // Here we put the actual content of the notes page
    return Column(
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
class _NotesEmptyScreen extends ConsumerStatefulWidget {
  const _NotesEmptyScreen();

  @override
  ConsumerState<_NotesEmptyScreen> createState() => _NotesEmptyScreenState();
}

class _NotesEmptyScreenState extends ConsumerState<_NotesEmptyScreen> {
  bool _isLoading = false;

  Future<void> _refresh() async {
    setState(() {
      _isLoading = true;
    });

    // Forzar recarga de la página completa reconstruyendo el widget padre
    // O simplemente reintentar obtener el ID de la boda
    // En este caso, como el padre es quien decide qué mostrar basado en el FutureBuilder,
    // lo más limpio es invalidar el provider o forzar un setState en el padre.
    // Pero como no tenemos acceso directo al padre, podemos usar un truco:
    // Navegar a la misma página o usar un provider para el ID de la boda.
    // Dado que el padre usa un FutureBuilder local, la mejor opción es
    // que el padre exponga un método de refresco o convertir el padre a usar Riverpod.

    // Sin embargo, para mantenerlo simple y local:
    // Vamos a invalidar el provider de bodas para forzar un refetch si se usa.
    // Y luego forzar la reconstrucción del padre.
    // Como no podemos forzar la reconstrucción del padre fácilmente desde aquí sin callback,
    // vamos a asumir que el usuario navegará o que podemos usar un provider global.

    // MEJOR ENFOQUE: Convertir NotesScreen para que use un provider para el bodaId
    // o simplemente mostrar un mensaje y un botón que al pulsar haga:
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const NotesScreen()));
    // O mejor aún, usar el router de go_router si está disponible.

    // Vamos a intentar recargar las bodas del usuario primero.
    try {
      final prefs = await SharedPreferences.getInstance();
      final usuarioId = prefs.getString('usuarioId');
      if (usuarioId != null) {
        await ref.read(weddingLogicProvider).fetchWeddings(usuarioId);
      }
    } catch (e) {
      debugPrint('Error refreshing weddings: $e');
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
      // Recargar la pantalla actual
      context.go('/notes'); // Asumiendo que esta es la ruta, o pushReplacement
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const emptyText = 'No tienes bodas registradas.';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              Positioned.fill(
                child: SizedBox(
                  width: width,
                  height: height,
                  child: Image.asset(
                    background,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: width,
                  height: height,
                  child: Responsive(
                    SingleChildScrollView(
                        child: _buildContent(emptyText, isTablet: true)),
                    mobile: SingleChildScrollView(
                        child: _buildContent(emptyText, isMobile: true)),
                    web: SingleChildScrollView(child: _buildContent(emptyText)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: HeaderWidget(),
                ),
              ),
              Align(
                alignment: const Alignment(-1, 0),
                child: SidebarMenu(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(String emptyText,
      {bool isMobile = false, bool isTablet = false}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 40),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20.0 : 200.0,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: isMobile ? 80 : 100),
            _buildResponsiveContent(emptyText,
                isMobile: isMobile, isTablet: isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveContent(String emptyText,
      {bool isMobile = false, bool isTablet = false}) {
    return Column(
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
                  textAlign: isMobile ? TextAlign.left : TextAlign.center,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Cork board con mensaje vacío y botón de refrescar
        Container(
          constraints: const BoxConstraints(minHeight: 570),
          padding: EdgeInsets.all(isMobile ? 20 : 30),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(pizarra),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  emptyText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _refresh,
                  icon: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.black),
                        )
                      : const Icon(Icons.refresh),
                  label: const Text('Refrescar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
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
          child: Center(
            child: Text(
              emptyText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF999999),
                fontFamily: 'Inter',
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

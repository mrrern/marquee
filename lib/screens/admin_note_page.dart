import 'package:bodas/routes/linkspaper.dart';

class NotesAdminScreen extends ConsumerStatefulWidget {
  const NotesAdminScreen({super.key});

  @override
  ConsumerState<NotesAdminScreen> createState() => _AdminNotesScreenState();
}

class _AdminNotesScreenState extends ConsumerState<NotesAdminScreen> {
  @override
  Widget build(BuildContext context) {
    final notesState = ref.watch(notesAdminProvider);

    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 850;

    return notesState.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, st) => Scaffold(
        body: Center(child: Text('Error cargando notas: $e')),
      ),
      data: (notes) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final list = notes;
              final rows = list
                  .map<Map<String, dynamic>>((n) => {
                        'id': n.note.id.toString(),
                        'usuario':
                            n.usuarioNombre ?? n.usuarioId?.toString() ?? '',
                        'nota': n.note.description,
                      })
                  .toList();

              if (rows.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('No hay notas para exportar')));
                return;
              }

              final csv = exportToCsv(rows);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('CSV de notas generado (ver consola)')));
              // ignore: avoid_print
              print(csv);
            },
            child: const Icon(Icons.download),
          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 10 : 40,
                vertical: isMobile ? 10 : 20,
              ),
              child: Column(
                children: [
                  AdminNavBar(),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        constraints: const BoxConstraints(minHeight: 570),
                        padding: EdgeInsets.all(isMobile ? 10 : 20),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(pizarra),
                            fit: BoxFit.cover,
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
                                  childAspectRatio:
                                      isMobile ? 3 / 1 : 217 / 241,
                                ),
                                itemCount: notes.length,
                                itemBuilder: (context, index) {
                                  final item = notes[index];
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.85),
                                          borderRadius:
                                              BorderRadius.circular(6),
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
                                      Expanded(
                                          child: NoteCard(note: item.note)),
                                    ],
                                  );
                                },
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

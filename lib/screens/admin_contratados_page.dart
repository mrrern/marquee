import 'dart:math' as math;
import 'package:bodas/routes/linkspaper.dart';

class ContratadosScreen extends ConsumerStatefulWidget {
  const ContratadosScreen({super.key});

  @override
  ConsumerState<ContratadosScreen> createState() => _ContratadosScreenState();
}

class _ContratadosScreenState extends ConsumerState<ContratadosScreen> {
  final String _search = '';
  int _currentPage = 1;
  int _itemsPerPage = 6;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      final isMobile = size.width < 850;
      setState(() {
        _itemsPerPage = isMobile ? 4 : 6;
        _currentPage = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      _buildWebLayout(context),
      mobile: _buildWebLayout(context, isMobile: true),
      web: _buildWebLayout(context),
    );
  }

  Widget _buildWebLayout(BuildContext context, {bool isMobile = false}) {
    final contractedAsync = ref.watch(contractedWeddingsProvider);
    const text = 'Usuarios Contratados';

    return Scaffold(
      body: Stack(children: [
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

        // Title bar
        Positioned(
          top: isMobile ? 120 : 110,
          left: isMobile ? 10 : 50,
          right: isMobile ? 10 : 50,
          child: BuildTitleWidget(text: text),
        ),

        //Main Content
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
                  borderRadius: BorderRadius.circular(10),
                ),
                child: contractedAsync.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, st) => Center(child: Text('Error: $e')),
                  data: (rows) {
                    if (rows.isEmpty) {
                      return Container(
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height * .6,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Center(
                            child: Text('No hay bodas contratadas')),
                      );
                    }

                    final filtered = rows.where((r) {
                      final name = (r['name_user'] ?? r['nombre'] ?? '')
                          .toString()
                          .toLowerCase();
                      return name.contains(_search.toLowerCase());
                    }).toList();

                    final totalPages =
                        (filtered.length / _itemsPerPage).ceil().clamp(1, 9999);
                    final start = (_currentPage - 1) * _itemsPerPage;
                    final end =
                        (start + _itemsPerPage).clamp(0, filtered.length);
                    final visible = filtered.sublist(start, end);

                    return Column(
                      children: [
                        ContratadosTable(rows: visible),
                        const SizedBox(height: 12),
                        _buildPaginationControls(totalPages),
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
      ]),
    );
  }

  Widget _buildPaginationControls(int totalPages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed:
              _currentPage > 1 ? () => setState(() => _currentPage = 1) : null,
          icon: const Icon(Icons.first_page),
        ),
        IconButton(
          onPressed: _currentPage > 1
              ? () => setState(() => _currentPage = _currentPage - 1)
              : null,
          icon: const Icon(Icons.chevron_left),
        ),
        Text('Página $_currentPage de $totalPages'),
        IconButton(
          onPressed: _currentPage < totalPages
              ? () => setState(() => _currentPage = _currentPage + 1)
              : null,
          icon: const Icon(Icons.chevron_right),
        ),
        IconButton(
          onPressed: _currentPage < totalPages
              ? () => setState(() => _currentPage = totalPages)
              : null,
          icon: const Icon(Icons.last_page),
        ),
      ],
    );
  }
}

class ContratadosTable extends StatelessWidget {
  final List<Map<String, dynamic>> rows;
  const ContratadosTable({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    // Desktop / Tablet: use TableMarquee for consistent table styling
    if (!isMobile) {
      final screenWidth = MediaQuery.of(context).size.width;
      final minWidth = math.max(800.0, screenWidth - 80);
      // limit height to avoid unbounded height inside parent ScrollViews
      final tableHeight =
          math.min(640.0, MediaQuery.of(context).size.height * 0.6);

      return SizedBox(
        height: tableHeight,
        child: TableMarquee<Map<String, dynamic>>(
          headers: const [
            'Usuario',
            'Estado',
            'Fecha',
            'Ceremonia',
            'Invitados',
            'Lugar',
            'Ficha musical',
            'Acción',
          ],
          data: rows,
          minWidth: minWidth,
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(2),
            3: FlexColumnWidth(2),
            4: FlexColumnWidth(1),
            5: FlexColumnWidth(2),
            6: FlexColumnWidth(1),
            7: FlexColumnWidth(1.5), // Acción
          },
          headerTextStyle: const TextStyle(fontWeight: FontWeight.w600),
          headerBackgroundColor: Colors.grey[200],
          headerPadding: const EdgeInsets.all(12.0),
          cellPadding: const EdgeInsets.all(12.0),
          cellBuilder: (ctx, col, row) {
            switch (col) {
              case 0:
                return Text(
                    (row['name_user'] ?? row['nombre'] ?? '-').toString());
              case 1:
                return Text((row['estado_boda'] ?? '-').toString());
              case 2:
                return Text((row['fecha'] ?? '-').toString());
              case 3:
                return Text((row['tipo_boda'] ?? '-').toString());
              case 4:
                return Text((row['invitados']?.toString() ?? '-').toString());
              case 5:
                return Text((row['ubicacion'] ?? '-').toString());
              case 6:
                final musicComplete = row['music_complete'] ?? false;
                return Icon(
                  musicComplete == true ? Icons.check_circle : Icons.error,
                  color: musicComplete == true ? Colors.green : Colors.orange,
                );
              case 7:
                // Botón para marcar como completada
                return Consumer(
                  builder: (context, ref, _) {
                    return IconButton(
                      icon: const Icon(Icons.check_circle_outline),
                      color: const Color(0xFF027A48),
                      tooltip: 'Marcar como completada',
                      onPressed: () async {
                        try {
                          final bodaId = row['id'] as int?;
                          if (bodaId == null) {
                            throw Exception('ID de boda no encontrado');
                          }

                          final weddingLogic = ref.read(weddingLogicProvider);
                          await weddingLogic.updateWeddingStatus(bodaId, 6);

                          // Refrescar los datos
                          ref.invalidate(contractedWeddingsProvider);

                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Boda marcada como completada'),
                                backgroundColor: Color(0xFF027A48),
                              ),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error: $e'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                    );
                  },
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      );
    }

    // Mobile: keep the existing card-like list
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: rows.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final r = rows[index];
        final userName = r['name_user'] ?? r['nombre'] ?? '-';
        final estado = r['estado_boda'] ?? '-';
        final fecha = r['fecha'] ?? '-';
        final ceremonia = (r['tipo_boda'] ?? '-');
        final invitados = r['invitados']?.toString() ?? '-';
        final lugar = r['ubicacion'] ?? '-';
        final musicComplete = r['music_complete'] ?? false;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            children: [
              Expanded(flex: 2, child: Text(userName.toString())),
              Expanded(flex: 2, child: Text(estado.toString())),
              Expanded(flex: 2, child: Text(fecha.toString())),
              Expanded(flex: 2, child: Text(ceremonia.toString())),
              Expanded(flex: 1, child: Text(invitados.toString())),
              Expanded(flex: 2, child: Text(lugar.toString())),
              Expanded(
                flex: 1,
                child: Icon(
                  musicComplete == true ? Icons.check_circle : Icons.error,
                  color: musicComplete == true ? Colors.green : Colors.orange,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ContratadoCard extends StatelessWidget {
  final Map<String, dynamic> row;
  const ContratadoCard({super.key, required this.row});

  @override
  Widget build(BuildContext context) {
    final userName = row['name_user'] ?? row['nombre'] ?? '-';
    final estado = row['estado_boda'] ?? '-';
    final fecha = row['fecha'] ?? '-';
    final ceremonia = (row['tipo_boda'] ?? '-');
    final invitados = row['invitados']?.toString() ?? '-';
    final lugar = row['ubicacion'] ?? '-';
    final musicComplete = row['music_complete'] ?? false;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Usuario: ${userName.toString()}'),
            Text('Estado: ${estado.toString()}'),
            Text('Fecha: ${fecha.toString()}'),
            Text('Ceremonia: ${ceremonia.toString()}'),
            Text('Invitados: ${invitados.toString()}'),
            Text('Lugar: ${lugar.toString()}'),
            Row(
              children: [
                const Text('Ficha musical completa:'),
                const SizedBox(width: 8),
                Icon(
                  musicComplete == true ? Icons.check_circle : Icons.error,
                  color: musicComplete == true ? Colors.green : Colors.orange,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

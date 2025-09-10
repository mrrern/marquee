import 'package:bodas/routes/linkspaper.dart';

class ContratadosScreen extends ConsumerStatefulWidget {
  const ContratadosScreen({super.key});

  @override
  ConsumerState<ContratadosScreen> createState() => _ContratadosScreenState();
}

class _ContratadosScreenState extends ConsumerState<ContratadosScreen> {
  String _search = '';
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
    final contractedAsync = ref.watch(contractedWeddingsProvider);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Responsive(
          Column(
            children: [
              _buildHeader(context),
              _buildTitle(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: contractedAsync.when(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (e, st) => Center(child: Text('Error: $e')),
                      data: (rows) {
                        if (rows.isEmpty) {
                          return const Center(
                              child: Text('No hay bodas contratadas'));
                        }

                        // Apply search filter
                        final filtered = rows.where((r) {
                          final name = (r['name_user'] ?? r['nombre'] ?? '')
                              .toString()
                              .toLowerCase();
                          return name.contains(_search.toLowerCase());
                        }).toList();

                        final totalPages = (filtered.length / _itemsPerPage)
                            .ceil()
                            .clamp(1, 9999);
                        final start = (_currentPage - 1) * _itemsPerPage;
                        final end =
                            (start + _itemsPerPage).clamp(0, filtered.length);
                        final visible = filtered.sublist(start, end);

                        return Column(
                          children: [
                            // Search and page size
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      decoration: const InputDecoration(
                                        hintText: 'Buscar por usuario',
                                        border: OutlineInputBorder(),
                                      ),
                                      onChanged: (v) {
                                        setState(() {
                                          _search = v;
                                          _currentPage = 1;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  DropdownButton<int>(
                                    value: _itemsPerPage,
                                    items: const [4, 6, 10]
                                        .map((i) => DropdownMenuItem(
                                              value: i,
                                              child: Text('$i'),
                                            ))
                                        .toList(),
                                    onChanged: (v) {
                                      if (v == null) return;
                                      setState(() {
                                        _itemsPerPage = v;
                                        _currentPage = 1;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),

                            // Fetch music completeness for visible bodas
                            FutureBuilder<Map<String, bool>>(
                              future: ref
                                  .read(weddingLogicProvider)
                                  .fetchMusicCompletenessForBodas(
                                    visible
                                        .map((r) => (r['id'] ??
                                                r['boda_id'] ??
                                                r['id_boda'])
                                            .toString())
                                        .toList(),
                                  ),
                              builder: (context, snap) {
                                final map = snap.data ?? {};
                                final annotated = visible.map((r) {
                                  final id =
                                      (r['id'] ?? r['boda_id'] ?? r['id_boda'])
                                          .toString();
                                  return {
                                    ...r,
                                    'music_complete': map[id] ?? false
                                  };
                                }).toList();

                                return Column(
                                  children: [
                                    ContratadosTable(rows: annotated),
                                    const SizedBox(height: 12),
                                    _buildPaginationControls(totalPages),
                                  ],
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          mobile: Column(
            children: [
              _buildHeader(context),
              _buildTitle(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: contractedAsync.when(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (e, st) => Center(child: Text('Error: $e')),
                      data: (rows) => FutureBuilder<Map<String, bool>>(
                        future: ref
                            .read(weddingLogicProvider)
                            .fetchMusicCompletenessForBodas(rows
                                .map((r) =>
                                    (r['id'] ?? r['boda_id'] ?? r['id_boda'])
                                        .toString())
                                .toList()),
                        builder: (context, snap) {
                          final map = snap.data ?? {};
                          final annotated = rows.map((r) {
                            final id = (r['id'] ?? r['boda_id'] ?? r['id_boda'])
                                .toString();
                            return {...r, 'music_complete': map[id] ?? false};
                          }).toList();
                          return Column(
                            children: annotated
                                .map((r) => ContratadoCard(row: r))
                                .toList(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          web: Column(
            children: [
              _buildHeader(context),
              _buildTitle(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: contractedAsync.when(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (e, st) => Center(child: Text('Error: $e')),
                      data: (rows) {
                        if (rows.isEmpty) return const SizedBox.shrink();

                        final filtered = rows.where((r) {
                          final name = (r['name_user'] ?? r['nombre'] ?? '')
                              .toString()
                              .toLowerCase();
                          return name.contains(_search.toLowerCase());
                        }).toList();

                        final totalPages = (filtered.length / _itemsPerPage)
                            .ceil()
                            .clamp(1, 9999);
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
            ],
          ),
        ),
      ),
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

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0C0C0C), Color(0x00737373)],
        ),
      ),
      child: Responsive.isMobile(context)
          ? Column(
              children: [
                Image.asset(
                  logo,
                  width: 200,
                  height: 42,
                ),
                const SizedBox(height: 20),
                _buildNavLinks(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  logo,
                  width: 309,
                  height: 65,
                ),
                _buildNavLinks(),
              ],
            ),
    );
  }

  Widget _buildNavLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _navLink('Usuario'),
        const SizedBox(width: 20),
        _navLink('Menú'),
        const SizedBox(width: 20),
        _navLink('Salir'),
      ],
    );
  }

  Widget _navLink(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    double fontSize = 45.0;

    if (Responsive.isMobile(context)) {
      fontSize = 25.0;
    } else if (Responsive.isTablet(context)) {
      fontSize = 35.0;
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Bodas contratadas',
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          color: const Color(0xFF616161),
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class ContratadosTable extends StatelessWidget {
  final List<Map<String, dynamic>> rows;
  const ContratadosTable({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Column(
      children: [
        if (!isMobile)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: const [
                Expanded(flex: 2, child: Text('Usuario')),
                Expanded(flex: 2, child: Text('Estado')),
                Expanded(flex: 2, child: Text('Fecha')),
                Expanded(flex: 2, child: Text('Ceremonia')),
                Expanded(flex: 1, child: Text('Invitados')),
                Expanded(flex: 2, child: Text('Lugar')),
                Expanded(flex: 1, child: Text('Ficha musical')),
              ],
            ),
          ),
        ListView.separated(
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

            // Determine if music is complete by querying musica_por_boda rows later, for now show placeholder
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
                      color:
                          musicComplete == true ? Colors.green : Colors.orange,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
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

import 'package:bodas/routes/linkspaper.dart';

class AdminUsersScreen extends ConsumerStatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  ConsumerState<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends ConsumerState<AdminUsersScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;
    final isTablet = size.width >= 600 && size.width < 850;
    final paginateState = ref.watch(paginateUsersProvider);
    final usersAsync = ref.watch(usersAdminProvider);
    return Responsive(
      _buildMainContent(context, isTablet, usersAsync, paginateState),
      mobile: _buildMainContent(context, isMobile, usersAsync, paginateState),
      web: _buildMainContent(context, false, usersAsync, paginateState),
    );
  }

  Widget _buildMainContent(BuildContext context, bool isMobile,
      AsyncValue<List<UserInfo>> usersAsync, PaginateUserState paginateState) {
    final text = "Usuarios registrados";
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          usersAsync.when(
            data: (users) {
              final rows = users
                  .map((u) => {
                        'id': u.id,
                        'email': u.email,
                        'nombre': u.nombre,
                        'rol': u.rol,
                        'createdAt': u.createdAt,
                      })
                  .toList();
              final csv = exportToCsv(rows);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('CSV de usuarios generado (ver consola)')));
              // ignore: avoid_print
              print(csv);
            },
            loading: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cargando usuarios...'))),
            error: (e, st) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Error generando CSV'))),
          );
        },
        child: const Icon(Icons.add_to_photos),
      ),
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
              angle: 179.864 * (3.14159 / 180),
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

          // Main centered content: Sidebar + users table
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 10 : 40,
                vertical: isMobile ? 10 : 20,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80),
                    BuildTitleWidget(text: text),
                    const SizedBox(height: 12),

                    // Container(
                    //   padding: const EdgeInsets.all(16),
                    //   decoration: BoxDecoration(
                    //     color: const Color(0xFFD9D9D9),
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: Text(
                    //           'Gestiona los usuarios: editar, eliminar y navegar entre usuarios.',
                    //           style: TextStyle(
                    //             color: const Color(0xFF797979),
                    //             fontSize: isMobile ? 12 : 14,
                    //           ),
                    //         ),
                    //       ),
                    //       IconButton(
                    //         onPressed: () =>
                    //             ref.read(usersAdminProvider.notifier).refresh(),
                    //         icon: const Icon(Icons.refresh),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    // const SizedBox(height: 16),

                    // Users table container
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(isMobile ? 8 : 20),
                        height: MediaQuery.of(context).size.height * .6,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: usersAsync.when(
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (e, st) {
                            debugPrint('Error loading users: $e');
                            debugPrint(st.toString());
                            return Center(child: Text('Error: $e'));
                          },
                          data: (allUsers) {
                            final pageState = paginateState;
                            final shown = pageState.currentPageUsers;

                            if (shown.isEmpty) {
                              return const Center(
                                  child: Text('No hay usuarios registrados'));
                            }

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Desktop/tablet: show a material Table with header and rows
                                if (!isMobile) ...[
                                  const SizedBox(height: 6),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                            minWidth: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                80),
                                        child: Table(
                                          border: TableBorder.symmetric(
                                            inside: const BorderSide(
                                                color: Colors.white24,
                                                width: 1),
                                          ),
                                          columnWidths: const {
                                            0: FlexColumnWidth(3),
                                            1: FlexColumnWidth(2),
                                            2: FlexColumnWidth(3),
                                            3: FlexColumnWidth(2),
                                            4: FlexColumnWidth(2),
                                          },
                                          children: [
                                            // Header row
                                            TableRow(
                                              decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withAlpha(2)),
                                              children: const [
                                                Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Text('Nombre',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Text('Rol',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Text('Correo',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Text('Fecha',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Text('Acciones',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                              ],
                                            ),

                                            // Data rows
                                            for (final u in shown)
                                              TableRow(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 20,
                                                          child: Text(u.nombre
                                                                  .isNotEmpty
                                                              ? u.nombre[0]
                                                              : 'U'),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Flexible(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(u.nombre,
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600)),
                                                              const SizedBox(
                                                                  height: 6),
                                                              Text(
                                                                  '@${u.nombre}',
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          12)),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12.0),
                                                      child: Text(u.rol)),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12.0),
                                                      child: Text(u.email)),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: Text(''),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        IconButton(
                                                          onPressed: () =>
                                                              context.pushNamed(
                                                                  'user_edit',
                                                                  extra: u),
                                                          icon: const Icon(
                                                              Icons.edit,
                                                              size: 18),
                                                        ),
                                                        IconButton(
                                                          onPressed: () async {
                                                            final confirm =
                                                                await showDialog<
                                                                    bool>(
                                                              context: context,
                                                              builder: (c) =>
                                                                  AlertDialog(
                                                                title: const Text(
                                                                    'Eliminar usuario'),
                                                                content: Text(
                                                                    '¿Eliminar a ${u.nombre}?'),
                                                                actions: [
                                                                  TextButton(
                                                                      onPressed: () =>
                                                                          Navigator.of(c).pop(
                                                                              false),
                                                                      child: const Text(
                                                                          'Cancelar')),
                                                                  TextButton(
                                                                      onPressed: () =>
                                                                          Navigator.of(c).pop(
                                                                              true),
                                                                      child: const Text(
                                                                          'Eliminar')),
                                                                ],
                                                              ),
                                                            );
                                                            if (confirm ??
                                                                false) {
                                                              await ref
                                                                  .read(usersAdminProvider
                                                                      .notifier)
                                                                  .removeUser(
                                                                      u.id);
                                                              await ref
                                                                  .read(paginateUsersProvider
                                                                      .notifier)
                                                                  .refresh();
                                                            }
                                                          },
                                                          icon: const Icon(
                                                              Icons.delete,
                                                              size: 18),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  // Pagination controls (desktop)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () => ref
                                            .read(
                                                paginateUsersProvider.notifier)
                                            .changePage(
                                                (paginateState.currentPage - 1)
                                                    .clamp(
                                                        1,
                                                        paginateState
                                                            .totalPages)),
                                        icon: const Icon(Icons.chevron_left),
                                      ),
                                      for (int i = 1;
                                          i <= paginateState.totalPages;
                                          i++)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          child: GestureDetector(
                                            onTap: () => ref
                                                .read(paginateUsersProvider
                                                    .notifier)
                                                .changePage(i),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 6),
                                              decoration: BoxDecoration(
                                                color: i ==
                                                        paginateState
                                                            .currentPage
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Text('$i',
                                                  style: TextStyle(
                                                      color: i ==
                                                              paginateState
                                                                  .currentPage
                                                          ? Colors.black
                                                          : Colors.white)),
                                            ),
                                          ),
                                        ),
                                      IconButton(
                                        onPressed: () => ref
                                            .read(
                                                paginateUsersProvider.notifier)
                                            .changePage(
                                                (paginateState.currentPage + 1)
                                                    .clamp(
                                                        1,
                                                        paginateState
                                                            .totalPages)),
                                        icon: const Icon(Icons.chevron_right),
                                      ),
                                    ],
                                  ),
                                ]
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
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
  }
}

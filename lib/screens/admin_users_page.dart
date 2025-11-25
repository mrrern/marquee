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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navegar a la página de registro para añadir nuevo usuario
          context.pushNamed('sign');
        },
        icon: const Icon(Icons.person_add),
        label: const Text('Añadir Usuario'),
        backgroundColor: const Color(0xFF0C0C0C),
        foregroundColor: Colors.white,
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
                    //Titulo de la pagina
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
                                                      .withAlpha(3)),
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
                                                          tooltip:
                                                              'Editar usuario',
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
                                                                    'Deshabilitar usuario'),
                                                                content: Text(
                                                                    '¿Deshabilitar a ${u.nombre}?\n\nEsto hará un soft delete (el usuario no se eliminará permanentemente).'),
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
                                                                          'Deshabilitar')),
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
                                                              Icons.block,
                                                              size: 18),
                                                          tooltip:
                                                              'Deshabilitar (Soft Delete)',
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
                                                                    'ELIMINAR PERMANENTEMENTE',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                content: Text(
                                                                    '⚠️ ¿Está SEGURO de eliminar PERMANENTEMENTE a ${u.nombre}?\n\nEsta acción:\n• Eliminará al usuario de la base de datos\n• Eliminará su acceso de signIn\n• NO SE PUEDE DESHACER\n\n¿Desea continuar?'),
                                                                actions: [
                                                                  TextButton(
                                                                      onPressed: () =>
                                                                          Navigator.of(c).pop(
                                                                              false),
                                                                      child: const Text(
                                                                          'Cancelar')),
                                                                  TextButton(
                                                                      style: TextButton
                                                                          .styleFrom(
                                                                        foregroundColor:
                                                                            Colors.red,
                                                                      ),
                                                                      onPressed: () =>
                                                                          Navigator.of(c).pop(
                                                                              true),
                                                                      child: const Text(
                                                                          'ELIMINAR PERMANENTEMENTE',
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold))),
                                                                ],
                                                              ),
                                                            );
                                                            if (confirm ??
                                                                false) {
                                                              try {
                                                                // Usar deleteHard para eliminación permanente
                                                                await ref
                                                                    .read(
                                                                        userLogicProvider)
                                                                    .deleteHard(
                                                                        u.id);

                                                                // Refrescar la lista de usuarios
                                                                await ref
                                                                    .read(usersAdminProvider
                                                                        .notifier)
                                                                    .refresh();
                                                                await ref
                                                                    .read(paginateUsersProvider
                                                                        .notifier)
                                                                    .refresh();

                                                                // Mostrar mensaje de éxito
                                                                if (context
                                                                    .mounted) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content: Text(
                                                                          'Usuario ${u.nombre} eliminado permanentemente'),
                                                                      backgroundColor:
                                                                          Colors
                                                                              .green,
                                                                    ),
                                                                  );
                                                                }
                                                              } catch (e) {
                                                                // Mostrar mensaje de error
                                                                if (context
                                                                    .mounted) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content: Text(
                                                                          'Error al eliminar: $e'),
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red,
                                                                    ),
                                                                  );
                                                                }
                                                              }
                                                            }
                                                          },
                                                          icon: const Icon(
                                                              Icons
                                                                  .delete_forever,
                                                              size: 18,
                                                              color:
                                                                  Colors.red),
                                                          tooltip:
                                                              'Eliminar permanentemente (Hard Delete)',
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

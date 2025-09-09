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
    final isMobile = size.width < 850;

    final paginateState = ref.watch(paginateUsersProvider);
    final usersAsync = ref.watch(usersAdminProvider);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 10 : 40,
            vertical: isMobile ? 10 : 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AdminNavBar(),
              const SizedBox(height: 20),

              // Title
              Text(
                'Usuario Registrado',
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 24 : 36,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 18),

              // Info bar
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Gestiona los usuarios registrados. Puedes editar, eliminar o navegar entre páginas.',
                        style: TextStyle(
                          color: const Color(0xFF797979),
                          fontSize: isMobile ? 12 : 14,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () =>
                          ref.read(usersAdminProvider.notifier).refresh(),
                      icon: const Icon(Icons.refresh),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Table header
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(isMobile ? 8 : 20),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/pizarra.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: usersAsync.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, st) => Center(child: Text('Error: $e')),
                    data: (allUsers) {
                      final pageState = paginateState;
                      final shown = pageState.currentPageUsers;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // column titles (desktop)
                          if (!isMobile)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: const [
                                  Expanded(flex: 2, child: Text('')),
                                  Expanded(flex: 3, child: Text('Nombre')),
                                  Expanded(flex: 2, child: Text('Estado')),
                                  Expanded(flex: 2, child: Text('Fecha')),
                                  Expanded(flex: 2, child: Text('Ceremonia')),
                                  Expanded(flex: 1, child: Text('Invitados')),
                                  Expanded(flex: 3, child: Text('Lugar')),
                                  Expanded(flex: 3, child: Text('Correo')),
                                  Expanded(flex: 2, child: Text('Acciones')),
                                ],
                              ),
                            ),

                          const SizedBox(height: 6),

                          Expanded(
                            child: ListView.separated(
                              itemCount: shown.length,
                              separatorBuilder: (_, __) => const Divider(
                                  height: 1, color: Colors.white24),
                              itemBuilder: (context, index) {
                                final u = shown[index];
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.06),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    children: [
                                      // avatar
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 20,
                                              child: Text(u.nombre.isNotEmpty
                                                  ? u.nombre[0]
                                                  : 'U'),
                                            ),
                                            const SizedBox(width: 10),
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(u.nombre,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(height: 6),
                                                  Text('@${u.nombre}',
                                                      style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 12)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // rest columns
                                      Expanded(
                                          flex: 3,
                                          child: Text(isMobile
                                              ? ''
                                              : ((u as dynamic).nombre ?? ''))),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                              ((u as dynamic).is_deleted ??
                                                          (u as dynamic)
                                                              .isDeleted) ==
                                                      true
                                                  ? 'Inactivo'
                                                  : 'Active')),
                                      Expanded(
                                          flex: 2,
                                          child: Text(_formatDate(
                                              (u as dynamic).created_at ??
                                                  (u as dynamic).createdAt))),
                                      Expanded(
                                          flex: 2,
                                          child: Text(((u as dynamic)
                                                          .boda_tipo ??
                                                      (u as dynamic).bodaTipo ??
                                                      '-')
                                                  ?.toString() ??
                                              '-')),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                              ((u as dynamic).invitados ??
                                                      (u as dynamic)
                                                          .invitados_count ??
                                                      '-') is num
                                                  ? ((u as dynamic).invitados ??
                                                          (u as dynamic)
                                                              .invitados_count)
                                                      .toString()
                                                  : '-')),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                              ((u as dynamic).ubicacion ?? '-')
                                                      ?.toString() ??
                                                  '-')),
                                      Expanded(
                                          flex: 3,
                                          child: Text(((u as dynamic).email ??
                                                      (u as dynamic).correo ??
                                                      '-')
                                                  ?.toString() ??
                                              '-')),

                                      // actions
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () async {
                                                // open edit dialog or navigate
                                                // For now, simple edit placeholder
                                                context.pushNamed('user_edit',
                                                    extra: u);
                                              },
                                              icon: const Icon(Icons.edit,
                                                  size: 18),
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                final confirm =
                                                    await showDialog<bool>(
                                                  context: context,
                                                  builder: (c) => AlertDialog(
                                                    title: const Text(
                                                        'Eliminar usuario'),
                                                    content: Text(
                                                        '¿Eliminar a ${u.nombre}?'),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () =>
                                                              Navigator.of(c)
                                                                  .pop(false),
                                                          child: const Text(
                                                              'Cancelar')),
                                                      TextButton(
                                                          onPressed: () =>
                                                              Navigator.of(c)
                                                                  .pop(true),
                                                          child: const Text(
                                                              'Eliminar')),
                                                    ],
                                                  ),
                                                );
                                                if (confirm ?? false) {
                                                  final id = (u as dynamic)
                                                          .id ??
                                                      (u as dynamic).user_id ??
                                                      (u as dynamic).usuario_id;
                                                  if (id != null) {
                                                    await ref
                                                        .read(usersAdminProvider
                                                            .notifier)
                                                        .removeUser(
                                                            id.toString());
                                                    await ref
                                                        .read(
                                                            paginateUsersProvider
                                                                .notifier)
                                                        .refresh();
                                                  }
                                                }
                                              },
                                              icon: const Icon(Icons.delete,
                                                  size: 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                          // Pagination controls
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => ref
                                    .read(paginateUsersProvider.notifier)
                                    .changePage((pageState.currentPage - 1)
                                        .clamp(1, pageState.totalPages)),
                                icon: const Icon(Icons.chevron_left),
                              ),
                              for (int i = 1; i <= pageState.totalPages; i++)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: GestureDetector(
                                    onTap: () => ref
                                        .read(paginateUsersProvider.notifier)
                                        .changePage(i),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: i == pageState.currentPage
                                            ? Colors.white
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text('$i',
                                          style: TextStyle(
                                              color: i == pageState.currentPage
                                                  ? Colors.black
                                                  : Colors.white)),
                                    ),
                                  ),
                                ),
                              IconButton(
                                onPressed: () => ref
                                    .read(paginateUsersProvider.notifier)
                                    .changePage((pageState.currentPage + 1)
                                        .clamp(1, pageState.totalPages)),
                                icon: const Icon(Icons.chevron_right),
                              ),
                            ],
                          ),
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
    );
  }

  String _formatDate(dynamic d) {
    if (d == null) return '-';
    try {
      if (d is String) return DateFormat('dd/MM/yy').format(DateTime.parse(d));
      if (d is DateTime) return DateFormat('dd/MM/yy').format(d);
      return d.toString();
    } catch (_) {
      return d.toString();
    }
  }
}

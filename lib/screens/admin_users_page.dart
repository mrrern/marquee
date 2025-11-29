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
        onPressed: () => _showAddUserDialog(context, ref),
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
                                                                // Usar Edge Function para eliminación permanente
                                                                final supabase =
                                                                    Supabase
                                                                        .instance
                                                                        .client;
                                                                final session =
                                                                    supabase
                                                                        .auth
                                                                        .currentSession;

                                                                if (session ==
                                                                    null) {
                                                                  throw Exception(
                                                                      'No hay sesión activa');
                                                                }

                                                                final response =
                                                                    await supabase
                                                                        .functions
                                                                        .invoke(
                                                                  'admin-delete-user',
                                                                  body: {
                                                                    'target_user_id':
                                                                        u.id,
                                                                  },
                                                                );

                                                                if (response
                                                                        .status !=
                                                                    200) {
                                                                  throw Exception(
                                                                      response.data[
                                                                              'error'] ??
                                                                          'Error desconocido');
                                                                }

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
                                                                  debugPrint(
                                                                      'Error al eliminar: $e');
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

  void _showAddUserDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    int selectedRole = 2; // Default: Usuario (2)
    bool isPasswordVisible = false;
    bool isConfirmPasswordVisible = false;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            // Validaciones
            String? nameError;
            String? emailError;
            String? passwordError;
            String? confirmPasswordError;

            if (nameController.text.isNotEmpty) {
              if (nameController.text.length < 3) {
                nameError = 'El nombre debe tener al menos 3 caracteres';
              }
            }

            if (emailController.text.isNotEmpty) {
              if (!emailController.text.contains('@')) {
                emailError = 'Email inválido';
              }
            }

            if (passwordController.text.isNotEmpty) {
              if (passwordController.text.length < 6) {
                passwordError =
                    'La contraseña debe tener al menos 6 caracteres';
              }
            }

            if (confirmPasswordController.text.isNotEmpty) {
              if (confirmPasswordController.text.length < 6) {
                confirmPasswordError =
                    'La contraseña debe tener al menos 6 caracteres';
              } else if (confirmPasswordController.text !=
                  passwordController.text) {
                confirmPasswordError = 'Las contraseñas no coinciden';
              }
            }

            final isFormValid = nameController.text.isNotEmpty &&
                emailController.text.isNotEmpty &&
                passwordController.text.isNotEmpty &&
                confirmPasswordController.text.isNotEmpty &&
                nameError == null &&
                emailError == null &&
                passwordError == null &&
                confirmPasswordError == null;

            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Row(
                children: [
                  Icon(Icons.person_add, color: const Color(0xFF7F56D9)),
                  const SizedBox(width: 8),
                  Text(
                    'Agregar Usuario',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nombre
                      Text(
                        'Nombre',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF344054),
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Nombre completo',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          errorText: nameError,
                        ),
                        style: GoogleFonts.inter(fontSize: 14),
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(height: 16),

                      // Email
                      Text(
                        'Email',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF344054),
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'correo@ejemplo.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          errorText: emailError,
                        ),
                        style: GoogleFonts.inter(fontSize: 14),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(height: 16),

                      // Contraseña
                      Text(
                        'Contraseña',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF344054),
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: passwordController,
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          hintText: 'Mínimo 6 caracteres',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          errorText: passwordError,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        style: GoogleFonts.inter(fontSize: 14),
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(height: 16),

                      // Confirmar Contraseña
                      Text(
                        'Confirmar Contraseña',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF344054),
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: confirmPasswordController,
                        obscureText: !isConfirmPasswordVisible,
                        decoration: InputDecoration(
                          hintText: 'Confirmar contraseña',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          errorText: confirmPasswordError,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                isConfirmPasswordVisible =
                                    !isConfirmPasswordVisible;
                              });
                            },
                          ),
                        ),
                        style: GoogleFonts.inter(fontSize: 14),
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(height: 16),

                      // Selector de Rol
                      Text(
                        'Rol',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF344054),
                        ),
                      ),
                      const SizedBox(height: 6),
                      DropdownButtonFormField<int>(
                        initialValue: selectedRole,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 1,
                            child: Text('Administrador'),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text('Usuario'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedRole = value ?? 2;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: Text(
                    'Cancelar',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF667085),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: !isFormValid
                      ? null
                      : () async {
                          // Mostrar loading
                          Navigator.of(dialogContext).pop();
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );

                          try {
                            // Crear usuario
                            await ref.read(authServiceProvider).signUp(
                                  emailController.text.trim(),
                                  passwordController.text,
                                  nameController.text.trim(),
                                  selectedRole,
                                );

                            // Refrescar lista de usuarios
                            await ref
                                .read(usersAdminProvider.notifier)
                                .refresh();
                            await ref
                                .read(paginateUsersProvider.notifier)
                                .refresh();

                            // Cerrar loading y mostrar éxito
                            if (context.mounted) {
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Usuario creado exitosamente',
                                    style: GoogleFonts.inter(),
                                  ),
                                  backgroundColor: const Color(0xFF027A48),
                                ),
                              );
                            }
                          } catch (e) {
                            // Cerrar loading y mostrar error
                            if (context.mounted) {
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Error al crear usuario: $e',
                                    style: GoogleFonts.inter(),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7F56D9),
                    disabledBackgroundColor:
                        const Color(0xFF7F56D9).withValues(alpha: 0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Crear Usuario',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

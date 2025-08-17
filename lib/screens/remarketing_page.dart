import 'package:bodas/routes/linkspaper.dart';

class RemarketingPage extends ConsumerWidget {
  const RemarketingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(marketingProvider);

    return Scaffold(
      body: Stack(
        children: [
          // Contenido principal con padding superior para el header
          Padding(
            padding: const EdgeInsets.only(
                top: 80), // Ajusta según la altura del AdminNavBar
            child: usersAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Error: $e')),
              data: (users) {
                if (users.isEmpty) {
                  return const Center(
                      child: Text('No hay usuarios para remarketing.'));
                }
                return ListView.separated(
                  itemCount: users.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      leading: CircleAvatar(
                          child: Text(
                              user.nombre.isNotEmpty ? user.nombre[0] : '?')),
                      title: Text(user.nombre),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.email),
                          Text(
                              'Creado: ${user.fechaCreacion.toLocal().toString().split(' ')[0]}'),
                          Text(user.tieneBodaActiva
                              ? 'Boda activa: Sí'
                              : 'Boda activa: No'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.email),
                        onPressed: () {
                          final uri = Uri.parse(user.mailto);
                          // Usa launchUrl si tienes url_launcher, o muestra el mailto
                          launchUrl(uri);
                        },
                        tooltip: 'Enviar correo',
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // Header fijo
          const Positioned(
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

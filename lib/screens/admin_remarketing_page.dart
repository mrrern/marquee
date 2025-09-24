import 'package:bodas/routes/linkspaper.dart';

class RemarketingPage extends ConsumerWidget {
  const RemarketingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(marketingProvider);

    return Scaffold(
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

                // Responsive: table on desktop/web, cards/list on mobile
                return Responsive(
                  // Desktop / large screens
                  Column(
                    children: [
                      AdminNavBar(),
                      Container(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                RemarketingTable(users: users),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Mobile
                  mobile: Column(
                    children: [
                      AdminNavBar(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                ...users.map((u) => RemarketingCard(user: u)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Web (treat same as desktop)
                  web: Column(
                    children: [
                      AdminNavBar(),
                      Container(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                RemarketingTable(users: users),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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

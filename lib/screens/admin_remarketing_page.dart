import 'package:bodas/routes/linkspaper.dart';

/// Estado local de paginación para la pantalla de remarketing
final remarketingPaginationProvider =
    StateProvider.autoDispose<RemarketingPagination>((ref) {
  return const RemarketingPagination();
});

class RemarketingPage extends ConsumerWidget {
  const RemarketingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagination = ref.watch(remarketingPaginationProvider);
    final pageAsync = ref.watch(marketingPaginatedProvider(pagination));

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
            child: pageAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Error: $e')),
              data: (pageData) {
                final users = pageData.items;
                if (users.isEmpty) {
                  return const Center(
                      child: Text('No hay usuarios para remarketing.'));
                }

                // Responsive: table on desktop/web, cards/list on mobile
                return Responsive(
                  // Desktop / large screens
                  Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: RemarketingTable(
                              pageData: pageData,
                              onPageChange: (newPage) {
                                ref
                                    .read(remarketingPaginationProvider.notifier)
                                    .state = pagination.copyWith(page: newPage);
                              },
                              onPageSizeChange: (newSize) {
                                ref
                                    .read(remarketingPaginationProvider.notifier)
                                    .state = pagination.copyWith(
                                  page: 1,
                                  pageSize: newSize,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Mobile
                  mobile: Column(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              ...users.map((u) => RemarketingCard(user: u)),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total: ${pageData.totalItems}'),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: pageData.page > 1
                                            ? () => ref
                                                .read(remarketingPaginationProvider
                                                    .notifier)
                                                .state = pagination.copyWith(
                                                  page: pageData.page - 1,
                                                )
                                            : null,
                                        icon: const Icon(Icons.chevron_left),
                                      ),
                                      Text(
                                          'Página ${pageData.page} de ${pageData.pageSize <= 0 ? 0 : ((pageData.totalItems + pageData.pageSize - 1) / pageData.pageSize).floor()}'),
                                      IconButton(
                                        onPressed: (pageData.pageSize > 0 &&
                                                pageData.page * pageData.pageSize <
                                                    pageData.totalItems)
                                            ? () => ref
                                                .read(remarketingPaginationProvider
                                                    .notifier)
                                                .state = pagination.copyWith(
                                                  page: pageData.page + 1,
                                                )
                                            : null,
                                        icon: const Icon(Icons.chevron_right),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Web (treat same as desktop)
                  web: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: RemarketingTable(
                              pageData: pageData,
                              onPageChange: (newPage) {
                                ref
                                    .read(remarketingPaginationProvider.notifier)
                                    .state = pagination.copyWith(page: newPage);
                              },
                              onPageSizeChange: (newSize) {
                                ref
                                    .read(remarketingPaginationProvider.notifier)
                                    .state = pagination.copyWith(
                                  page: 1,
                                  pageSize: newSize,
                                );
                              },
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

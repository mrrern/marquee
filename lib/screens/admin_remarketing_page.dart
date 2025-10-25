import 'package:bodas/routes/linkspaper.dart';

final remarketingPaginationProvider =
    StateProvider.autoDispose<RemarketingPagination>((ref) {
  return const RemarketingPagination();
});

class RemarketingPage extends ConsumerStatefulWidget {
  const RemarketingPage({super.key});

  @override
  ConsumerState<RemarketingPage> createState() => _RemarketingPageState();
}

class _RemarketingPageState extends ConsumerState<RemarketingPage> {
  int _currentPage = 1;
  int _itemsPerPage = 10;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      final isMobile = size.width < 850;
      setState(() {
        _itemsPerPage = isMobile ? 6 : 10;
        _currentPage = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final pagination = ref.watch(remarketingPaginationProvider);
    final pageAsync = ref.watch(marketingPaginatedProvider(pagination));

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
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
          Positioned(
            top: 110,
            left: 50,
            right: 50,
            child: BuildTitleWidget(text: 'Usuarios Remarketing'),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 190, left: 50, right: 50, bottom: 20),
              child: SingleChildScrollView(
                child: Container(
                  constraints: const BoxConstraints(minHeight: 570),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: pageAsync.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, st) => Center(child: Text('Error: $e')),
                    data: (pageData) {
                      final users = pageData.items;
                      if (users.isEmpty) {
                        return Container(
                          width: double.maxFinite,
                          height: MediaQuery.of(context).size.height * .6,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.8),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Center(
                              child: Text('No hay usuarios para remarketing.')),
                        );
                      }

                      final totalPages =
                          (pageData.totalItems / pageData.pageSize)
                              .ceil()
                              .clamp(1, 9999);

                      final isMobile = MediaQuery.of(context).size.width < 600;
                      if (!isMobile) {
                        return Column(
                          children: [
                            RemarketingTable(
                              pageData: pageData,
                              onPageChange: (newPage) {
                                ref
                                    .read(
                                        remarketingPaginationProvider.notifier)
                                    .state = pagination.copyWith(page: newPage);
                              },
                              onPageSizeChange: (newSize) {
                                ref
                                        .read(remarketingPaginationProvider
                                            .notifier)
                                        .state =
                                    pagination.copyWith(
                                        page: 1, pageSize: newSize);
                              },
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: pageData.page > 1
                                      ? () => ref
                                          .read(remarketingPaginationProvider
                                              .notifier)
                                          .state = pagination.copyWith(page: 1)
                                      : null,
                                  icon: const Icon(Icons.first_page),
                                ),
                                IconButton(
                                  onPressed: pageData.page > 1
                                      ? () => ref
                                              .read(
                                                  remarketingPaginationProvider
                                                      .notifier)
                                              .state =
                                          pagination.copyWith(
                                              page: pageData.page - 1)
                                      : null,
                                  icon: const Icon(Icons.chevron_left),
                                ),
                                Text('Página ${pageData.page} de $totalPages'),
                                IconButton(
                                  onPressed: pageData.page < totalPages
                                      ? () => ref
                                              .read(
                                                  remarketingPaginationProvider
                                                      .notifier)
                                              .state =
                                          pagination.copyWith(
                                              page: pageData.page + 1)
                                      : null,
                                  icon: const Icon(Icons.chevron_right),
                                ),
                                IconButton(
                                  onPressed: pageData.page < totalPages
                                      ? () => ref
                                              .read(
                                                  remarketingPaginationProvider
                                                      .notifier)
                                              .state =
                                          pagination.copyWith(page: totalPages)
                                      : null,
                                  icon: const Icon(Icons.last_page),
                                ),
                              ],
                            ),
                          ],
                        );
                      }

                      // Mobile: lista de tarjetas y paginación
                      return Column(
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
                                                .read(
                                                    remarketingPaginationProvider
                                                        .notifier)
                                                .state =
                                            pagination.copyWith(
                                                page: pageData.page - 1)
                                        : null,
                                    icon: const Icon(Icons.chevron_left),
                                  ),
                                  Text(
                                      'Página ${pageData.page} de $totalPages'),
                                  IconButton(
                                    onPressed: (pageData.pageSize > 0 &&
                                            pageData.page * pageData.pageSize <
                                                pageData.totalItems)
                                        ? () => ref
                                                .read(
                                                    remarketingPaginationProvider
                                                        .notifier)
                                                .state =
                                            pagination.copyWith(
                                                page: pageData.page + 1)
                                        : null,
                                    icon: const Icon(Icons.chevron_right),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
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

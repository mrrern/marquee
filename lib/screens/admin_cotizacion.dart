import 'package:bodas/routes/linkspaper.dart';

class CotizacionPage extends ConsumerStatefulWidget {
  const CotizacionPage({super.key});

  @override
  ConsumerState<CotizacionPage> createState() => _CotizacionPageState();
}

class _CotizacionPageState extends ConsumerState<CotizacionPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      final isMobile = size.width < 850;
      ref
          .read(cotizacionRequestPaginationProvider.notifier)
          .updateItemsPerPage(isMobile ? 4 : 6);
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
    final state = ref.watch(cotizacionRequestPaginationProvider);
    final currentQuotations = state.currentPageRequests;
    final text = "Solicitud de Cotización";

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

          // Title bar
          Positioned(
            top: isMobile ? 120 : 110,
            left: isMobile ? 10 : 50,
            right: isMobile ? 10 : 50,
            child: BuildTitleWidget(text: text),
          ),

          // Main content
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isMobile) ...[
                        // Table for tablet/web
                        QuotationTable(quotations: currentQuotations),
                        const SizedBox(height: 12),
                        _buildPagination(state),
                      ] else ...[
                        // Cards for mobile
                        ...currentQuotations.map((q) => Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: QuotationCard(quotation: q),
                            )),
                        const SizedBox(height: 12),
                        _buildPagination(state),
                      ],
                    ],
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
        ],
      ),
    );
  }

  Widget _buildPagination(CotizacionRequestPaginationState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => ref
              .read(cotizacionRequestPaginationProvider.notifier)
              .changePage((state.currentPage - 1).clamp(1, state.totalPages)),
          icon: const Icon(Icons.chevron_left),
        ),
        for (int i = 1; i <= state.totalPages; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () => ref
                  .read(cotizacionRequestPaginationProvider.notifier)
                  .changePage(i),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: i == state.currentPage
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '$i',
                  style: TextStyle(
                    color: i == state.currentPage ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        IconButton(
          onPressed: () => ref
              .read(cotizacionRequestPaginationProvider.notifier)
              .changePage((state.currentPage + 1).clamp(1, state.totalPages)),
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}

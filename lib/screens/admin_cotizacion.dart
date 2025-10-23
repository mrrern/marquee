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
    final state = ref.watch(cotizacionRequestPaginationProvider);
    final currentQuotations = state.currentPageRequests;
    final text = "Solicitud de Cotización";

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Responsive(
          // Tablet
          Column(
            children: [
              AdminNavBar(),
              BuildTitleWidget(text: text),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        QuotationTable(quotations: currentQuotations),
                        _buildPagination(state),
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
              BuildTitleWidget(text: text),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ...currentQuotations.map(
                            (quotation) => QuotationCard(quotation: quotation)),
                        _buildPagination(state),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Web
          web: Column(
            children: [
              AdminNavBar(),
              BuildTitleWidget(text: text),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        QuotationTable(quotations: currentQuotations),
                        _buildPagination(state),
                      ],
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

  Widget _buildPagination(CotizacionRequestPaginationState state) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 40),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 1; i <= state.totalPages; i++)
            GestureDetector(
              onTap: () => ref
                  .read(cotizacionRequestPaginationProvider.notifier)
                  .changePage(i),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  i == state.currentPage ? 'Pag $i' : '$i',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: i == state.currentPage
                        ? Colors.black
                        : const Color(0xFF999999),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:bodas/routes/linkspaper.dart';

// class QuotationRequestScreen extends StatelessWidget {
//   const QuotationRequestScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         child: Responsive(
//           // Tablet view
//           Column(
//             children: [
//               _buildHeader(context),
//               _buildTitle(context),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       children: [
//                         QuotationTable(quotations: mockQuotationRequests),
//                         _buildPagination(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // Mobile view
//           mobile: Column(
//             children: [
//               _buildHeader(context),
//               _buildTitle(context),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       children: [
//                         ...mockQuotationRequests.take(4).map((quotation) =>
//                           QuotationCard(quotation: quotation)
//                         ),
//                         _buildPagination(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // Web view
//           web: Column(
//             children: [
//               _buildHeader(context),
//               _buildTitle(context),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       children: [
//                         QuotationTable(quotations: mockQuotationRequests),
//                         _buildPagination(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [Color(0xFF0C0C0C), Color(0x00737373)],
//         ),
//       ),
//       child: Responsive.isMobile(context)
//           ? Column(
//               children: [
//                 Image.asset(
//                   logo,
//                   width: 200,
//                   height: 42,
//                 ),
//                 const SizedBox(height: 20),
//                 _buildNavLinks(),
//               ],
//             )
//           : Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Image.asset(
//                   logo,
//                   width: 309,
//                   height: 65,
//                 ),
//                 _buildNavLinks(),
//               ],
//             ),
//     );
//   }

//   Widget _buildNavLinks() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         _navLink('Usuario'),
//         const SizedBox(width: 20),
//         _navLink('Menú'),
//         const SizedBox(width: 20),
//         _navLink('Salir'),
//       ],
//     );
//   }

//   Widget _navLink(String text) {
//     return Text(
//       text,
//       style: GoogleFonts.inter(
//         color: Colors.white,
//         fontSize: 20,
//         fontWeight: FontWeight.w700,
//       ),
//     );
//   }

//   Widget _buildTitle(BuildContext context) {
//     double fontSize = 45.0;

//     if (Responsive.isMobile(context)) {
//       fontSize = 25.0;
//     } else if (Responsive.isTablet(context)) {
//       fontSize = 35.0;
//     }

//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: const Color(0xFFD9D9D9),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Text(
//         'Solicitud de cotización',
//         textAlign: TextAlign.center,
//         style: GoogleFonts.inter(
//           color: const Color(0xFF616161),
//           fontSize: fontSize,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     );
//   }

//   Widget _buildPagination() {
//     return Container(
//       margin: const EdgeInsets.only(top: 20, bottom: 40),
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       decoration: BoxDecoration(
//         color: const Color(0xFFD9D9D9),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(
//         'Pag 1 2 3 4 5 6',
//         style: GoogleFonts.inter(
//           fontSize: 15,
//         ),
//       ),
//     );
//   }
// }



class QuotationRequestScreen extends ConsumerStatefulWidget {
  const QuotationRequestScreen({super.key});

  @override
  ConsumerState<QuotationRequestScreen> createState() => _QuotationRequestScreenState();
}

class _QuotationRequestScreenState extends ConsumerState<QuotationRequestScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      final isMobile = size.width < 850;
      ref.read(quotationProvider.notifier).updateItemsPerPage(isMobile ? 4 : 6);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quotationProvider);
    final currentQuotations = state.quotations
        .skip((state.currentPage - 1) * state.itemsPerPage)
        .take(state.itemsPerPage)
        .toList();

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Responsive(
          // Tablet
          Column(
            children: [
              _buildHeader(context),
              _buildTitle(context),
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
              _buildHeader(context),
              _buildTitle(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ...currentQuotations.map((quotation) => QuotationCard(quotation: quotation)),
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
              _buildHeader(context),
              _buildTitle(context),
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

   Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0C0C0C), Color(0x00737373)],
        ),
      ),
      child: Responsive.isMobile(context)
          ? Column(
              children: [
                Image.asset(
                  logo,
                  width: 200,
                  height: 42,
                ),
                const SizedBox(height: 20),
                _buildNavLinks(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  logo,
                  width: 309,
                  height: 65,
                ),
                _buildNavLinks(),
              ],
            ),
    );
  }

  Widget _buildNavLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _navLink('Usuario'),
        const SizedBox(width: 20),
        _navLink('Menú'),
        const SizedBox(width: 20),
        _navLink('Salir'),
      ],
    );
  }

  Widget _navLink(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    double fontSize = 45.0;

    if (Responsive.isMobile(context)) {
      fontSize = 25.0;
    } else if (Responsive.isTablet(context)) {
      fontSize = 35.0;
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Solicitud de cotización',
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          color: const Color(0xFF616161),
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }



  Widget _buildPagination(QuotationState state) {
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
              onTap: () => ref.read(quotationProvider.notifier).changePage(i),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  i == state.currentPage ? 'Pag $i' : '$i',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: i == state.currentPage ? Colors.black : const Color(0xFF999999),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
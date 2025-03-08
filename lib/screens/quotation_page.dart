import 'package:bodas/routes/linkspaper.dart';

class QuotationRequestScreen extends StatelessWidget {
  const QuotationRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Responsive(
          // Tablet view
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
                        QuotationTable(quotations: mockQuotationRequests),
                        _buildPagination(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Mobile view
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
                        ...mockQuotationRequests.take(4).map((quotation) =>
                          QuotationCard(quotation: quotation)
                        ),
                        _buildPagination(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Web view
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
                        QuotationTable(quotations: mockQuotationRequests),
                        _buildPagination(),
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
                  'assets/images/logo.png',
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
                  'assets/images/logo.png',
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

  Widget _buildPagination() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 40),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Pag 1 2 3 4 5 6',
        style: GoogleFonts.inter(
          fontSize: 15,
        ),
      ),
    );
  }
}
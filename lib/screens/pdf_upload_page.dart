import 'package:bodas/routes/linkspaper.dart';

class ContratoScreen extends StatelessWidget {
  final String? contractId;

  const ContratoScreen({
    super.key,
    this.contractId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: _buildMainContent(context),
      )),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 1397),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              logo,
              width: 216,
              fit: BoxFit.contain,
            ),
            Text(
              'Salir',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Responsive(
      // Tablet view
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset(
              back2,
              width: double.infinity,
              height: 686,
              fit: BoxFit.cover,
            ),
            _buildContentWithSidebar(context, isTablet: true),
          ],
        ),
      ),
      // Mobile view
      mobile: Container(
        margin: const EdgeInsets.only(top: 40),
        child: Stack(
          children: [
            Image.asset(
              back2,
              width: double.infinity,
              height: 686,
              fit: BoxFit.cover,
            ),
            _buildMobileContent(context),
          ],
        ),
      ),
      // Web view
      web: SizedBox(
        width: 1100,
        child: Stack(
          children: [
            Image.asset(
              back2,
              width: double.infinity,
              height: 686,
              fit: BoxFit.cover,
            ),
            _buildContentWithSidebar(context, isTablet: false),
            const SidebarMenu(),
          ],
        ),
      ),
    );
  }

  Widget _buildContentWithSidebar(BuildContext context,
      {required bool isTablet}) {
    return Container(
      width: 941,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar menu - 24% width
          const SizedBox(width: 20),
          // Main content - 76% width
          Expanded(
            child: _buildRightContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return SafeArea(
      child: _buildRightContent(context),
    );
  }

  Widget _buildRightContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cotización',
          style: GoogleFonts.inter(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF888888),
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 26),
        Text(
          'Agradecemos tu registro. Te enviaremos a la brevedad posible tu presupuesto con la información proporcionada.\n\nEl proceso es el siguiente: encontrarás un cuadro donde adjuntaremos el presupuesto en formato PDF, el cual podrás descargar. Una vez que estés de acuerdo, por favor, sube el documento firmado y selecciona "Aceptar"\n\nEsto nos permitirá confirmar tanto el producto como la garantía de nuestros servicios.',
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            height: 1.0,
          ),
        ),
        const SizedBox(height: 42),
        const FileUploadWidget(),
        const SizedBox(height: 93),
        Center(
          child: Container(
            width: 208,
            height: 41,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: Text(
              'LLENAR FICHA MUSICAL',
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

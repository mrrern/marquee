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
          child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              back2,
              width: double.infinity,
              height: 686,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: _buildMainContent(context),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SidebarMenu(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: HeaderWidget(),
            ),
          ),
        ],
      )),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Responsive(
      // Tablet view
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: _buildContentWithSidebar(context, isTablet: true),
      ),
      // Mobile view
      mobile: Container(
        padding: const EdgeInsets.only(top: 80, left: 60, right: 5),
        child: _buildMobileContent(context),
      ),
      // Web view
      web: SizedBox(
        width: 1100,
        child: _buildContentWithSidebar(context, isTablet: false),
      ),
    );
  }

  Widget _buildContentWithSidebar(BuildContext context,
      {required bool isTablet}) {
    return Container(
      padding: EdgeInsets.only(left: isTablet ? 180 : 250),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: isTablet ? 2 : 3,
            child: _buildRightContent(context),
          ),
          SizedBox(width: isTablet ? 40 : 50),
          Expanded(
              flex: 2,
              child: Image.asset(
                port1,
                fit: BoxFit.fitHeight,
              ))
        ],
      ),
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _buildRightContent(context),
          ),
        ],
      ),
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
          child: HoverButton("GUARDAR FICHA", press: () {
            context.go('/notificacion');
          }),
        ),
      ],
    );
  }
}

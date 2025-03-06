import 'package:bodas/routes/linkspaper.dart';

class WeddingRegistrationScreen extends StatelessWidget {
  const WeddingRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Responsive(
        // Tablet view
        SingleChildScrollView(child: _buildContent(isTablet: true)),
        // Mobile view
        mobile: SingleChildScrollView(child: _buildContent(isMobile: true)),
        // Web view
        web: SingleChildScrollView(child: _buildContent()),
      ),
    );
  }

  Widget _buildContent({bool isMobile = false, bool isTablet = false}) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              background,
              fit: BoxFit.cover,
            ),
          ),

          // Main content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20.0 : 40.0,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Responsive content
                _buildResponsiveContent(isMobile: isMobile, isTablet: isTablet),
              ],
            ),
          ),
          // Sidebar Menu
          Align(
            alignment: Alignment.centerLeft,
            child: SidebarMenu(),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveContent(
      {bool isMobile = false, bool isTablet = false}) {
    if (isMobile) {
      return _buildMobileContent();
    }
    return _buildDesktopContent(isTablet: isTablet);
  }

  Widget _buildDesktopContent({bool isTablet = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 300 ),
        Expanded(
          flex: isTablet ? 3 : 2,
          child: SingleChildScrollView(
            child: WeddingFormFields(),
          ),
        ),
        const SizedBox(width: 30),
        if (!isTablet) // Solo mostrar imagen en versión web
          Flexible(
            flex: 2,
            child: Image.asset(
              port1,
              fit: BoxFit.fitHeight,
            ),
          ),
      ],
    );
  }

  Widget _buildMobileContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 20),
      child: WeddingFormFields(),
    );
  }
}

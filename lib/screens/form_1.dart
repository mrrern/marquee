import 'package:bodas/routes/linkspaper.dart';

class WeddingRegistrationScreen extends StatelessWidget {
  const WeddingRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                background,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: SizedBox(
                width: width,
                height: height,
                child: Responsive(
                  // Tablet view
                  SingleChildScrollView(child: _buildContent(isTablet: true)),
                  // Mobile view
                  mobile: SingleChildScrollView(
                      child: _buildContent(isMobile: true)),
                  // Web view
                  web: SingleChildScrollView(
                      child: _buildContent(isTablet: true)),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-1, 0),
              child: SidebarMenu(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContent({bool isMobile = false, bool isTablet = false}) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          // Main content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20.0 : 40.0,
              vertical: 20,
            ),
            child: Expanded(
              flex: isTablet ? 2 : 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Responsive content
                  _buildResponsiveContent(
                      isMobile: isMobile, isTablet: isTablet),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment(0, -1),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: HeaderWidget(),
            ),
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
        const SizedBox(width: 300),
        Expanded(
          child: SingleChildScrollView(
            child: WeddingFormFields(),
          ),
        ),
        const SizedBox(width: 30),
        // Solo mostrar imagen en versión web
        if (!isTablet)
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

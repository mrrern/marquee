import 'package:bodas/routes/linkspaper.dart';

class WeddingRegistrationScreen extends StatelessWidget {
  const WeddingRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                background,
                fit: BoxFit.cover,
              ),
            ),

            if (Responsive.isMobile(context))
              Positioned(
                top: 0,
                child: SizedBox(
                    width: width,
                    height: height,
                    child: SingleChildScrollView(
                        child: _buildContent(isMobile: true))),
              ),
            if (Responsive.isTablet(context))
              Positioned(
                top: 0,
                child: SizedBox(
                    width: width,
                    height: height,
                    child: SingleChildScrollView(
                        child: _buildContent(isTablet: true))),
              ),
            if (Responsive.isWeb(context))
              Positioned(
                top: 0,
                child: SizedBox(
                    width: width,
                    height: height,
                    child: SingleChildScrollView(child: _buildContent())),
              ),

            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: HeaderWidget(),
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
    return SizedBox(
      child: Padding(
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
              _buildResponsiveContent(isMobile: isMobile, isTablet: isTablet),
            ],
          ),
        ),
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
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 300),
              child: WeddingFormFields(),
            ),
          ),
          const SizedBox(width: 30),
          // Solo mostrar imagen en versión web
          if (!isTablet)
            Flexible(
              flex: 1,
              child: Image.asset(
                port1,
                fit: BoxFit.fitHeight,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMobileContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 20, left: 25),
      child: WeddingFormFields(),
    );
  }
}

import 'package:bodas/routes/linkspaper.dart';

class MarqueeAdminDashboard extends StatelessWidget {
  const MarqueeAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      // Tablet layout
      _buildTabletLayout(context),
      // Mobile layout
      mobile: _buildMobileLayout(context),
      // Web layout
      web: _buildWebLayout(context),
    );
  }

  Widget _buildWebLayout(BuildContext context) {
    return Scaffold(
      body: _buildMainContent(context, isWeb: true),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      body: _buildMainContent(context, isTablet: true),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      body: _buildMainContent(context, isMobile: true),
    );
  }

  Widget _buildMainContent(BuildContext context,
      {bool isWeb = false, bool isTablet = false, bool isMobile = false}) {
    final screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Background color
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
        ),

        // Noise texture
        Positioned(
          top: -.8,
          left: -1,
          child: Transform.rotate(
            angle: 179.864 * (3.14159 / 180), // Convert degrees to radians
            child: Image.asset(
              back2, // Replace with actual asset path
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

        // Main content
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: isMobile ? 250 : 100,
              ),
              SizedBox(
                height: isMobile ? 250 : 100,
              ),
              // Grid of cards
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 16 : (isTablet ? 20 : 181),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile || isTablet ? 1 : 2,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                    childAspectRatio: isMobile ? 3 : 2.5,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    String title = '';
                    String route = '';

                    switch (index) {
                      case 0:
                        title = 'Gestión de Cotizaciones';
                        route = '/admin/cotizaciones';
                        break;
                      case 1:
                        title = 'Servicios Contratados';
                        route = '/admin/contratados';
                        break;
                      case 2:
                        title = 'Administrar Notas';
                        route = '/admin/notas';
                        break;
                      case 3:
                        title = 'Panel de Remarketing';
                        route = '/admin/remarketing';
                        break;
                      case 4:
                        title = 'Gestión de Usuarios';
                        route = '/admin/usuarios';
                        break;
                      case 5:
                        title = 'Panel de Estadísticas';
                        route = '/admin/estadisticas';
                        break;
                    }

                    return GestureDetector(
                      onTap: () => context.go(route),
                      child: MarqueeCard(title: title, isMobile: isMobile),
                    );
                  },
                ),
              ),
              const SizedBox(height: 100), // Space at the bottom
            ],
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
    );
  }
}

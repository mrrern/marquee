import 'package:bodas/routes/linkspaper.dart';

class MusicFormScreen extends ConsumerStatefulWidget {
  const MusicFormScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MusicFormScreenState();
}

class _MusicFormScreenState extends ConsumerState<MusicFormScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
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
                    SingleChildScrollView(child: _buildContent(isTablet: true)),
                    mobile: SingleChildScrollView(
                        child: _buildContent(isMobile: true)),
                    web: SingleChildScrollView(child: _buildContent()),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-1, 0),
                child: SidebarMenu(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent({bool isMobile = false, bool isTablet = false}) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 40),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20.0 : 40.0,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(),
            _buildResponsiveContent(isMobile: isMobile, isTablet: isTablet),
          ],
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
      padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 20.0 : 40.0, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: MusicFormContent(),
          ),
          if (!isTablet) ...[
            const SizedBox(width: 20),
            Flexible(flex: 2, child: Image.asset(port2, fit: BoxFit.fitHeight)),
          ]
        ],
      ),
    );
  }

  Widget _buildMobileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SidebarMenu(
          onMenuItemTap: (index) {
            // Handle menu item tap
          },
        ),
        const SizedBox(height: 20),
        MusicFormContent(),
      ],
    );
  }
}

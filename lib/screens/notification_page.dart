import 'package:bodas/routes/linkspaper.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: _buildResponsiveLayout(context),
      ),
    );
  }

  Widget _buildResponsiveLayout(BuildContext context) {
    return Responsive(
      // Tablet layout
      Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 6, top: 10),
                  child: SidebarMenu(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _buildTitle(),
                        const SizedBox(height: 20),
                        const NotificationFilterWidget(),
                        const SizedBox(height: 20),
                        NotificationListWidget(),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          FooterWidget(),
        ],
      ),
      // Mobile layout
      mobile: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  _buildTitle(),
                  const SizedBox(height: 20),
                  const NotificationFilterWidget(),
                  const SizedBox(height: 20),
                  const NotificationListWidget(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
      // Web layout
      web: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 6, top: 10),
                  child: SidebarMenu(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _buildTitle(),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const NotificationFilterWidget(),
                                  const SizedBox(height: 20),
                                  const NotificationListWidget(),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            _buildDecorativeImages(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          FooterWidget(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 216,
            height: 46,
          ),
          InkWell(
            onTap: () {
              context.go('/');
            },
            child: Text(
              'Salir',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Bandeja de Notificación',
      style: GoogleFonts.inter(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF888888),
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDecorativeImages() {
    return SizedBox(
      width: 345,
      child: Column(
        children: [
          Transform.rotate(
            angle: 10.042 * (3.14159 / 180),
            child: Container(
              width: 323,
              height: 295,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFE8E8E8),
                  width: 15,
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/images/decorative1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Transform.rotate(
            angle: 9.517 * (3.14159 / 180),
            child: Container(
              width: 345,
              height: 319,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFE8E8E8),
                  width: 15,
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/images/decorative2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
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
          HeaderWidget(),
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
                        FooterWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Mobile layout
      mobile: Row(
        children: [
          Center(child: SidebarMenu()),
          Column(
            children: [
              HeaderWidget(),
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
                      FooterWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      // Web layout
      web: Column(
        children: [
          HeaderWidget(),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SidebarMenu(),
                SizedBox(
                  width: 20,
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
                            Expanded(
                                child:
                                    Image.asset(port1, fit: BoxFit.fitHeight)),
                          ],
                        ),
                        FooterWidget(),
                      ],
                    ),
                  ),
                ),
              ],
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

  // Widget _buildDecorativeImages() {
  //   return SizedBox(
  //     width: 345,
  //     child: Column(
  //       children: [
  //         Transform.rotate(
  //           angle: 10.042 * (3.14159 / 180),
  //           child: Container(
  //             width: 323,
  //             height: 295,
  //             decoration: BoxDecoration(
  //               border: Border.all(
  //                 color: const Color(0xFFE8E8E8),
  //                 width: 15,
  //               ),
  //               image: const DecorationImage(
  //                 image: AssetImage(port1),
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //         ),
  //         const SizedBox(height: 50),
  //         Transform.rotate(
  //           angle: 9.517 * (3.14159 / 180),
  //           child: Container(
  //             width: 345,
  //             height: 319,
  //             decoration: BoxDecoration(
  //               border: Border.all(
  //                 color: const Color(0xFFE8E8E8),
  //                 width: 15,
  //               ),
  //               image: const DecorationImage(
  //                 image: AssetImage(port2),
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

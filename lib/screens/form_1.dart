import 'package:bodas/routes/linkspaper.dart';

class InicialForm extends ConsumerStatefulWidget {
  const InicialForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InicialFormState();
}

class _InicialFormState extends ConsumerState<InicialForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 991;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          // Positioned.fill(
          //   child: Image.asset(
          //     back2,
          //     fit: BoxFit.cover,
          //   ),
          // ),

          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  const HeaderWidget(),

                  // Main form section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title section
                        Center(
                          child: Container(
                            width: 634,
                            constraints:
                                BoxConstraints(maxWidth: screenWidth - 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    'Aquí empieza todo:',
                                    style: TextStyle(
                                      color: AppColors.secondaryText,
                                      fontSize: 40,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0.5,
                                      letterSpacing: -0.4,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 26),
                                const Text(
                                  'Nombres y apellidos del los novios',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                  ),
                                ),
                                const SizedBox(height: 26),

                                // Couple info form
                                const CoupleInfoForm(),

                                const SizedBox(height: 18),
                                const Text(
                                  'Fecha de Nacimiento',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Background section with forms
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Stack(
                      children: [
                        // Background image
                        Positioned.fill(
                          child: Image.asset(
                            back2,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Content over background
                        Column(
                          children: [
                            SizedBox(height: isMobile ? 200 : 261),

                            // Two column layout
                            Container(
                              width: 921,
                              constraints:
                                  BoxConstraints(maxWidth: screenWidth - 32),
                              child: isMobile
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        SizedBox(height: 40),
                                        RegistrationForm(),
                                      ],
                                    )
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Sidebar menu (25%)
                                        const Expanded(
                                          flex: 25,
                                          child: SidebarMenu(),
                                        ),
                                        const SizedBox(width: 20),
                                        // Wedding details form (75%)
                                        const Expanded(
                                          flex: 75,
                                          child: WeddingDetailsForm(),
                                        ),
                                      ],
                                    ),
                            ),

                            // Request quote button
                            Container(
                              margin: const EdgeInsets.only(top: 43),
                              width: 208,
                              height: 41,
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'SOLICITAR COTIZACION',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            // Footer
                            const SizedBox(height: 166),
                            const FooterWidget(),
                          ],
                        ),
                        if (!isMobile)
                          Positioned.fromRect(
                            rect: Rect.fromLTRB(2, 20, 0, 0),
                            child: SidebarMenu(),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

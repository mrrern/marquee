import 'package:bodas/routes/linkspaper.dart';

class InicialForm extends ConsumerStatefulWidget {
  const InicialForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InicialFormState();
}

class _InicialFormState extends ConsumerState<InicialForm> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 991;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              back2,
              fit: BoxFit.cover,
            ),
          ),

          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeaderWidget(),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 7.0, left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        logo, // Replace with actual logo path
                        width: 216,
                        fit: BoxFit.contain,
                      ),
                      TextButton(
                        onPressed: () =>
                            context.go('/'), // Navigate back using go_router
                        child: const Text(
                          'Salir',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Cotización section
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Center(
                    child: Container(
                      width: isMobile ? screenWidth * 0.9 : 635,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Cotización',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: AppColors.secondaryText,
                              letterSpacing: 0.4,
                              height: 1.0,
                            ),
                          ),
                          const SizedBox(height: 26),
                          const Text(
                            'Agradecemos tu registro. Te enviaremos a la brevedad posible tu presupuesto con la información proporcionada.\n\nEl proceso es el siguiente: encontrarás un cuadro donde adjuntaremos el presupuesto en formato PDF, el cual podrás descargar. Una vez que estés de acuerdo, por favor, sube el documento firmado y selecciona "Aceptar"\n\nEsto nos permitirá confirmar tanto el producto como la garantía de nuestros servicios.',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              height: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Background image with content overlay
                Container(
                  margin: EdgeInsets.only(top: isMobile ? 40 : 50),
                  height: 686,
                  child: Stack(
                    children: [
                      // Background image
                      Positioned.fill(
                        child: Image.asset(
                          back2, // Replace with actual background image
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Content overlay
                      Positioned(
                        top: isMobile ? -200 : -228,
                        left: isMobile ? 0 : screenWidth * 0.24,
                        right: 0,
                        child: Container(
                          width: isMobile ? screenWidth : 941,
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 16.0 : 0,
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: isMobile ? 260 : 220),

                              // Grey box with icon and text
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 20 : 59,
                                  vertical: 71,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(217, 217, 217, 0.93),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/icon.png', // Replace with actual icon
                                      width: 62,
                                      height: 62,
                                      fit: BoxFit.contain,
                                    ),
                                    const SizedBox(width: 49),
                                    Expanded(
                                      child: Text(
                                        'Agradecemos tu registro. Te enviaremos a la brevedad posible tu presupuesto con la información proporcionada.',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.mediumGrey,
                                          height: 1.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Button
                              SizedBox(height: isMobile ? 40 : 93),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // Implement file picking functionality
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles();
                                    if (result != null) {
                                      // Handle the selected file
                                      // PlatformFile file = result.files.first;
                                      // You can now use the file
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(217, 217, 217, 1),
                                    minimumSize: const Size(208, 41),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 13, horizontal: 4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: const Text(
                                    'LLENAR FICHA MUSICAL',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SidebarMenu(),
          )
        ],
      ),
    );
  }
}

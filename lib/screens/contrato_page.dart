import 'package:bodas/routes/linkspaper.dart';

class InicialForm extends ConsumerStatefulWidget {
  const InicialForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InicialFormState();
}

class _InicialFormState extends ConsumerState<InicialForm> {
  int? _bodaId;
  CotizacionModel? _cotizacion;
  bool _isLoading = true;
  bool _hasDownloaded = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final usuarioId = prefs.getString('usuarioId');
      if (usuarioId == null) {
        setState(() => _isLoading = false);
        return;
      }

      final bodas =
          await ref.read(weddingLogicProvider).fetchWeddings(usuarioId);
      if (bodas.isEmpty) {
        setState(() => _isLoading = false);
        return;
      }

      final bodaId = bodas.first.id;
      _bodaId = bodaId;

      // Fetch uploaded files (contracts)
      final files = await CotizacionLogic().getFilesByBodaId(bodaId);
      if (files.isNotEmpty) {
        // Assuming the latest file or specific logic to pick the contract
        // For now, taking the first one that has an admin file
        try {
          _cotizacion = files.firstWhere((f) => f.archivoAdmin != null);
        } catch (_) {
          // No admin file found
        }
      }
    } catch (e) {
      debugPrint('Error loading contract data: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _handleDownload() async {
    if (_cotizacion?.archivoAdmin != null) {
      final url = Uri.parse(_cotizacion!.archivoAdmin!);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
        setState(() {
          _hasDownloaded = true;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo abrir el archivo')),
        );
      }
    }
  }

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

                              if (_isLoading)
                                const Center(child: CircularProgressIndicator())
                              else if (_bodaId == null)
                                const Text(
                                    'No se encontró información de la boda.')
                              else ...[
                                // Download Widget (Admin Contract)
                                if (_cotizacion?.archivoAdmin != null)
                                  _buildDownloadWidget(isMobile),

                                const SizedBox(height: 20),

                                // Upload Widget (User Signed Contract)
                                // Show only if downloaded or if user already uploaded something previously (optional logic)
                                if (_hasDownloaded ||
                                    _cotizacion?.archivoCliente != null)
                                  FileUploadWidget(
                                    bodaId: _bodaId!,
                                    onUploadComplete: () {
                                      // Refresh data or show success message
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Contrato subido exitosamente')),
                                      );
                                    },
                                  ),
                              ],

                              // Button (Optional, maybe to proceed or just the upload widget is enough)
                              /*
                              SizedBox(height: isMobile ? 40 : 93),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Logic to proceed
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
                              */
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

  Widget _buildDownloadWidget(bool isMobile) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xEED9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 71, horizontal: 59),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 640) {
            return SizedBox(
              width: 288,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildDownloadIcon(),
                  const SizedBox(height: 20),
                  _buildDownloadText(),
                ],
              ),
            );
          }

          return Row(
            children: [
              _buildDownloadIcon(),
              const SizedBox(width: 49),
              Expanded(
                child: _buildDownloadText(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDownloadIcon() {
    return InkWell(
      onTap: _handleDownload,
      child: Container(
        width: 62,
        height: 62,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.download,
          size: 30,
          color: Color(0xFF808080),
        ),
      ),
    );
  }

  Widget _buildDownloadText() {
    return Text(
      'Descarga aquí el presupuesto enviado por el administrador.',
      style: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF808080),
        height: 1.0,
      ),
    );
  }
}

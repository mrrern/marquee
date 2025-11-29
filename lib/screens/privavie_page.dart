import 'package:bodas/routes/linkspaper.dart';

class PrivacyPage extends ConsumerWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollOffset = ref.watch(scrollOffsetProvider);
    final size = MediaQuery.of(context).size.width;
    final position = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned(
              top: -scrollOffset,
              child: SizedBox(
                width: size,
                child: Image.asset(
                  background,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const Positioned(child: NavBar()),
            Positioned(
              top: position * .07,
              child: SizedBox(
                width: size,
                height: position * .93,
                child: SingleChildScrollView(
                  controller: ref.read(scrollControllerProvider),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: position * .05),

                      // Título principal
                      ResponsiveTitle(
                        text: 'POLÍTICAS DE PRIVACIDAD',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                        mobileFontSize: 24,
                        tabletFontSize: 28,
                        webFontSize: 32,
                      ),

                      SizedBox(height: position * .03),

                      // Contenedor principal de contenido
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Responsive.isWeb(context)
                              ? size * .15
                              : size * .08,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xF0FFFFFF),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(
                              Responsive.isWeb(context) ? 40 : 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildSection(
                                  context,
                                  title: 'Introducción',
                                  content:
                                      'En nuestra plataforma de organización de eventos, nos comprometemos a proteger tu privacidad y garantizar la seguridad de tus datos personales. Esta política de privacidad explica cómo recopilamos, utilizamos y protegemos tu información.',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Recopilación de Datos',
                                  content:
                                      'Recopilamos únicamente la información necesaria para la organización y gestión de tu evento. Esto incluye:\n\n• Datos personales (nombre, correo electrónico, teléfono)\n• Información del evento (fecha, ubicación, detalles específicos)\n• Preferencias y requisitos especiales\n• Datos de proveedores y asistentes relacionados con tu evento',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Uso de tus Datos',
                                  content:
                                      'Tus datos son utilizados exclusivamente para:',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Organizar y coordinar todos los aspectos de tu evento',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Comunicarnos contigo sobre los detalles del evento',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Gestionar reservas y confirmaciones',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Mejorar nuestros servicios de organización de eventos',
                                ),
                                SizedBox(height: 20),
                                _buildHighlightBox(
                                  context,
                                  text:
                                      'IMPORTANTE: NO vendemos, compartimos, ni utilizamos tus datos para ningún otro propósito que no sea la organización de tu evento.',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Protección de Datos',
                                  content:
                                      'Implementamos medidas de seguridad técnicas y organizativas apropiadas para proteger tus datos personales contra el acceso no autorizado, la alteración, divulgación o destrucción.',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Compartir Información',
                                  content:
                                      'Tus datos pueden ser compartidos únicamente con:\n\n• Proveedores de servicios directamente relacionados con tu evento (fotógrafos, catering, músicos, etc.)\n• Personal autorizado de nuestra organización que necesite acceder a la información para coordinar tu evento\n\nEn todos los casos, los terceros están obligados a mantener la confidencialidad de tu información.',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Tus Derechos',
                                  content: 'Tienes derecho a:',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Acceder a tus datos personales',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Rectificar información inexacta',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Solicitar la eliminación de tus datos',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Oponerte al procesamiento de tus datos',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Solicitar la portabilidad de tus datos',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Retención de Datos',
                                  content:
                                      'Mantenemos tus datos personales solo durante el tiempo necesario para cumplir con los propósitos descritos en esta política y para cumplir con nuestras obligaciones legales.',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Cookies',
                                  content:
                                      'Utilizamos cookies esenciales para el funcionamiento de nuestro sitio web. Para más información, consulta nuestra Política de Cookies.',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Cambios en esta Política',
                                  content:
                                      'Podemos actualizar esta política de privacidad ocasionalmente. Te notificaremos sobre cualquier cambio significativo publicando la nueva política en esta página.',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Contacto',
                                  content:
                                      'Si tienes alguna pregunta sobre esta política de privacidad o sobre cómo manejamos tus datos, no dudes en contactarnos.',
                                ),
                                SizedBox(height: 30),
                                Center(
                                  child: Text(
                                    'Última actualización: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                                    style: GoogleFonts.inter(
                                      fontSize:
                                          Responsive.isWeb(context) ? 14 : 12,
                                      color: Colors.grey[600],
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: position * .05),
                      const FooterWidget(),
                      SizedBox(height: position * .1),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    final size = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: Responsive.isWeb(context) ? 22 : 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          content,
          style: GoogleFonts.inter(
            fontSize: Responsive.isWeb(context) ? 16 : 14,
            color: const Color(0xFF555555),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildBulletPoint(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: GoogleFonts.inter(
              fontSize: Responsive.isWeb(context) ? 16 : 14,
              color: const Color(0xFF555555),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: Responsive.isWeb(context) ? 16 : 14,
                color: const Color(0xFF555555),
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightBox(BuildContext context, {required String text}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3CD),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFFFC107),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.info_outline,
            color: Color(0xFFFF6F00),
            size: 28,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: Responsive.isWeb(context) ? 16 : 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF856404),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

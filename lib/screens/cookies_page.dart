import 'package:bodas/routes/linkspaper.dart';

class CookiesPage extends ConsumerWidget {
  const CookiesPage({super.key});

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
                        text: 'POLÍTICA DE COOKIES',
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
                                      'Esta política de cookies explica qué son las cookies, cómo las utilizamos en nuestra plataforma de organización de eventos, y qué información almacenamos localmente en tu dispositivo.',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: '¿Qué son las cookies?',
                                  content:
                                      'Las cookies son pequeños archivos de texto que los sitios web colocan en tu dispositivo mientras navegas. Se utilizan ampliamente para hacer que los sitios web funcionen de manera más eficiente, así como para proporcionar información a los propietarios del sitio.',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Nuestra Postura sobre Cookies',
                                  content:
                                      'Queremos ser completamente transparentes contigo:',
                                ),
                                SizedBox(height: 10),
                                _buildHighlightBox(
                                  context,
                                  text:
                                      'NO utilizamos cookies tradicionales de seguimiento, publicidad o análisis en nuestra plataforma.',
                                  icon: Icons.check_circle_outline,
                                  backgroundColor: const Color(0xFFD4EDDA),
                                  borderColor: const Color(0xFF28A745),
                                  textColor: const Color(0xFF155724),
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Almacenamiento Local',
                                  content:
                                      'Aunque no utilizamos cookies tradicionales, sí empleamos tecnologías de almacenamiento local para proporcionar una mejor experiencia de usuario:',
                                ),
                                SizedBox(height: 15),
                                _buildSubsection(
                                  context,
                                  title:
                                      '1. SharedPreferences (Almacenamiento Local)',
                                  content:
                                      'Utilizamos SharedPreferences para guardar información en tu dispositivo de manera local y segura. Esta información incluye:',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Preferencias de usuario (tema, idioma, etc.)',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Estado de sesión para mantener tu login activo',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Configuraciones personalizadas de la aplicación',
                                ),
                                SizedBox(height: 20),
                                _buildSubsection(
                                  context,
                                  title: '2. Supabase Auth (Autenticación)',
                                  content:
                                      'Utilizamos Supabase como nuestro sistema de autenticación, que almacena:',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Tokens de sesión para mantener tu cuenta segura',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Información de autenticación encriptada',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Credenciales de acceso temporales',
                                ),
                                SizedBox(height: 15),
                                _buildInfoBox(
                                  context,
                                  text:
                                      'Estos datos se almacenan únicamente en tu dispositivo y son esenciales para el funcionamiento de la aplicación. No se comparten con terceros ni se utilizan para rastreo.',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Propósito del Almacenamiento',
                                  content:
                                      'Los datos almacenados localmente se utilizan exclusivamente para:',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Mantener tu sesión activa de forma segura',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Recordar tus preferencias de usuario',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Proporcionar una experiencia personalizada',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Garantizar el correcto funcionamiento de la aplicación',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Seguridad de los Datos',
                                  content:
                                      'Toda la información almacenada localmente está protegida mediante:',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Encriptación de datos sensibles',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Almacenamiento seguro en el dispositivo',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Tokens de sesión con expiración automática',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Protocolos de seguridad de Supabase',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Control sobre tus Datos',
                                  content:
                                      'Tienes control total sobre los datos almacenados:',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Puedes cerrar sesión en cualquier momento, lo que eliminará los tokens de autenticación',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Puedes limpiar los datos de la aplicación desde la configuración de tu dispositivo',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Puedes solicitar la eliminación completa de tu cuenta y datos',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Cookies de Terceros',
                                  content:
                                      'No utilizamos servicios de terceros que instalen cookies en tu dispositivo. Los únicos servicios externos que utilizamos son:',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Supabase: Para autenticación y base de datos (con su propia política de privacidad)',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Sin Seguimiento ni Publicidad',
                                  content: 'Nos comprometemos firmemente a:',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'NO utilizar cookies de seguimiento',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'NO vender tu información a terceros',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'NO utilizar cookies publicitarias',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'NO rastrear tu comportamiento de navegación',
                                ),
                                SizedBox(height: 15),
                                _buildHighlightBox(
                                  context,
                                  text:
                                      'Tu privacidad es nuestra prioridad. Solo almacenamos lo estrictamente necesario para que la aplicación funcione correctamente.',
                                  icon: Icons.security,
                                  backgroundColor: const Color(0xFFE3F2FD),
                                  borderColor: const Color(0xFF2196F3),
                                  textColor: const Color(0xFF0D47A1),
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Tipos de Datos que NO Recopilamos',
                                  content:
                                      'Para tu tranquilidad, queremos aclarar que NO recopilamos:',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Datos de navegación fuera de nuestra aplicación',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Información de otros sitios web que visites',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Datos para perfiles publicitarios',
                                ),
                                _buildBulletPoint(
                                  context,
                                  'Información de dispositivos más allá de lo necesario para la autenticación',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Cambios en esta Política',
                                  content:
                                      'Podemos actualizar esta política de cookies ocasionalmente para reflejar cambios en nuestras prácticas o por otras razones operativas, legales o reglamentarias. Te notificaremos sobre cualquier cambio significativo.',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Más Información',
                                  content:
                                      'Para obtener más información sobre cómo protegemos tus datos personales, consulta nuestra Política de Privacidad.',
                                ),
                                const Divider(height: 40, thickness: 1),
                                _buildSection(
                                  context,
                                  title: 'Contacto',
                                  content:
                                      'Si tienes alguna pregunta sobre esta política de cookies o sobre cómo manejamos el almacenamiento local de datos, no dudes en contactarnos.',
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

  Widget _buildSubsection(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: Responsive.isWeb(context) ? 18 : 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF444444),
          ),
        ),
        const SizedBox(height: 8),
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

  Widget _buildHighlightBox(
    BuildContext context, {
    required String text,
    required IconData icon,
    required Color backgroundColor,
    required Color borderColor,
    required Color textColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: textColor,
            size: 28,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: Responsive.isWeb(context) ? 16 : 14,
                fontWeight: FontWeight.w600,
                color: textColor,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(BuildContext context, {required String text}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFDEE2E6),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.info_outline,
            color: Color(0xFF6C757D),
            size: 24,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: Responsive.isWeb(context) ? 15 : 13,
                color: const Color(0xFF495057),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

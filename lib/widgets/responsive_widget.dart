import 'package:bodas/routes/linkspaper.dart';

// class Responsive extends StatelessWidget {
//   final Widget mobile;
//   final Widget tablet;
//   final Widget web;

//   const Responsive(
//     this.tablet, {
//     required this.mobile,
//     required this.web,
//     super.key,
//   });

//   // Tamaños por diseño

//   static bool isMobile(BuildContext context) =>
//       MediaQuery.of(context).size.width < 850;

//   static bool isTablet(BuildContext context) =>
//       MediaQuery.of(context).size.width < 1100 &&
//       MediaQuery.of(context).size.width >= 850;

//   static bool isWeb(BuildContext context) =>
//       MediaQuery.of(context).size.width >= 1100;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     if (size.width >= 1100) {
//       return web;
//     } else if (size.width >= 850) {
//       return tablet;
//     } else {
//       return mobile;
//     }
//   }
// }

class ResponsiveTitle extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final double mobileFontSize;
  final double tabletFontSize;
  final double webFontSize;

  const ResponsiveTitle({
    required this.text,
    required this.textAlign,
    required this.fontWeight,
    this.mobileFontSize = 14,
    this.tabletFontSize = 16,
    this.webFontSize = 18,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double fontSize() {
      if (Responsive.isWeb(context)) {
        return webFontSize;
      } else if (Responsive.isTablet(context)) {
        return tabletFontSize;
      }
      return mobileFontSize;
    }

    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
        fontWeight: fontWeight,
        fontSize: fontSize(),
      ),
    );
  }
}

/// Widget que muestra diferentes vistas según el tamaño de la pantalla
class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget web;

  /// Constructor con valores por defecto para los umbrales
  const Responsive(
    this.tablet, {
    required this.mobile,
    required this.web,
    super.key,
  });

  /// Factoría para crear una instancia de Responsive con umbrales personalizados
  factory Responsive.custom({
    required Widget mobile,
    required Widget tablet,
    required Widget web,
    double mobileThreshold = 600,
    double tabletThreshold = 800,
    Key? key,
  }) {
    return Responsive(
      tablet,
      mobile: mobile,
      web: web,
      key: key,
    );
  }

  /// Determina si es una vista móvil
  static bool isMobile(BuildContext context, {double threshold = 600}) =>
      MediaQuery.of(context).size.width < threshold;

  /// Determina si es una vista tablet
  static bool isTablet(
    BuildContext context, {
    double mobileThreshold = 600,
    double tabletThreshold = 800,
  }) =>
      MediaQuery.of(context).size.width >= mobileThreshold &&
      MediaQuery.of(context).size.width < tabletThreshold;

  /// Determina si es una vista web
  static bool isWeb(BuildContext context, {double threshold = 800}) =>
      MediaQuery.of(context).size.width >= threshold;

  @override
  Widget build(BuildContext context) {
    if (isWeb(context)) {
      return web;
    } else if (isTablet(context)) {
      return tablet;
    } else {
      return mobile;
    }
  }
}

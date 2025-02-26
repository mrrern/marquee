import 'package:bodas/routes/linkspaper.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget web;

  const Responsive(
    this.tablet, {
    required this.mobile,
    required this.web,
    super.key,
  });

  // Tamaños por diseño

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isWeb(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (size.width >= 1100) {
      return web;
    } else if (size.width >= 850) {
      return tablet;
    } else {
      return mobile;
    }
  }
}

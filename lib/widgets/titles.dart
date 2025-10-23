import 'package:bodas/routes/linkspaper.dart';

class BuildTitleWidget extends StatelessWidget {
  final String text;
  final double? fontSize;

  const BuildTitleWidget({super.key, required this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    double effectiveFontSize = fontSize ?? 25.0;

    if (Responsive.isMobile(context)) {
      effectiveFontSize = 20.0;
    } else if (Responsive.isTablet(context)) {
      effectiveFontSize = 25.0;
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          color: const Color(0xFF616161),
          fontSize: effectiveFontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

import 'package:bodas/routes/linkspaper.dart';

class MarqueeCard extends StatelessWidget {
  final String title;
  final bool isMobile;

  const MarqueeCard({
    super.key,
    required this.title,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMobile ? 120 : 160,
      decoration: BoxDecoration(
        color: const Color(0xFFECECEC),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: isMobile ? 22 : 32,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0C0C0C),
            ),
          ),
        ),
      ),
    );
  }
}
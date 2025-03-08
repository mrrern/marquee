import 'package:bodas/routes/linkspaper.dart';

class FormSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final EdgeInsets padding;

  const FormSection({
    super.key,
    required this.title,
    required this.children,
    this.padding = const EdgeInsets.only(top: 40, bottom: 20),
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: isMobile ? 30 : 40,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF888888),
              height: 0.5,
              letterSpacing: 0.4,
            ).copyWith(
                leadingDistribution: TextLeadingDistribution.proportional),
          ),
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }
}

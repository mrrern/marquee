import 'package:bodas/routes/linkspaper.dart';

class BlurEffect extends StatelessWidget {
  final double width;
  final double height;

  const BlurEffect({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF535353),
        borderRadius: BorderRadius.circular(width),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF535353).withValues(alpha: 0.5),
            blurRadius: 50,
            spreadRadius: 10,
          ),
        ],
      ),
    );
  }
}

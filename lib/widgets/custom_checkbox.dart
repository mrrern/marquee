import 'package:bodas/routes/linkspaper.dart';

class CustomCheckbox extends ConsumerWidget {
  const CustomCheckbox(
    this.isChecked,
    this.tap, {
    super.key,
  });
  final GestureTapCallback? tap;
  final bool isChecked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: tap,
      child: SizedBox(
        width: 48,
        height: 48,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withValues(alpha: 0.03),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
                width: 18,
                height: 18,
                child: CustomPaint(
                  painter: _CheckboxPainter(isChecked: isChecked),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckboxPainter extends CustomPainter {
  final bool isChecked;

  _CheckboxPainter({required this.isChecked});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = isChecked ? const Color(0xFFA3E583) : const Color(0xFFC8CCD4);

    final Path border = Path()
      ..moveTo(1, 9)
      ..cubicTo(1, 4, 4, 1, 9, 1)
      ..cubicTo(14, 1, 17, 5, 17, 9)
      ..cubicTo(17, 14, 13, 17, 9, 17)
      ..cubicTo(4, 17, 1, 14, 1, 9);

    final Path check = Path();
    if (isChecked) {
      check
        ..moveTo(1, 9)
        ..lineTo(7, 14)
        ..lineTo(15, 4);
    }

    canvas.drawPath(border, paint);
    if (isChecked) {
      canvas.drawPath(check, paint);
    }
  }

  @override
  bool shouldRepaint(_CheckboxPainter oldDelegate) {
    return oldDelegate.isChecked != isChecked;
  }
}

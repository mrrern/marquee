import 'package:bodas/routes/linkspaper.dart';

class ButtonTitle extends StatelessWidget {
  final String title;
  const ButtonTitle({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final position = MediaQuery.of(context).size.height;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: size * .3, vertical: position * .05),
      child: Container(
        width: 300,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: grey,
        ),
        child: Text(
          title,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.bold, fontSize: size * .015),
        ),
      ),
    );
  }
}

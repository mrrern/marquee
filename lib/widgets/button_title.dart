import 'package:bodas/routes/linkspaper.dart';

class ButtonTitle extends StatelessWidget {
  final String title;
  const ButtonTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final position = MediaQuery.of(context).size.height;
    final isWeb = Responsive.isWeb(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isWeb ? size * .3 : size * 0.1,
          vertical: isWeb ? position * .05 : position * .02),
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
              fontWeight: FontWeight.bold, fontSize: isWeb ? size * .015 : 20),
        ),
      ),
    );
  }
}

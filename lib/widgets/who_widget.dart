
import 'package:bodas/routes/linkspaper.dart';

class WhoWidget extends StatelessWidget {
  const WhoWidget({
    super.key,
   
  });


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final position = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size * .35,
          height: position * .9,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: grey,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12),
                child: Text(
                  title3.toUpperCase(),
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: size * .015),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0),
                child: Text(
                  review,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.inter(),
                ),
              )
            ],
          ),
        ),
        CarruselF(),
      ],
    );
  }
}

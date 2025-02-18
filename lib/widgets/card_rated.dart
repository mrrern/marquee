import 'package:bodas/routes/linkspaper.dart';

class CardRated extends ConsumerWidget {
  final String author;
  final String img;
  final String date;
  final String rate;
  final String description;

  const CardRated({
    required this.author,
    required this.img,
    required this.date,
    required this.rate,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size.width;
    final position = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        width: size * .8,
        height: position * .30,
        decoration: BoxDecoration(
          color: const Color(0xE1FFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(-.85, -.56),
              child: CircleAvatar(
                minRadius: 25,
                maxRadius: 45,
                backgroundColor: Colors.amber,
                foregroundImage: AssetImage(img),
              ),
            ),
            Align(
              alignment: Alignment(-.60, -.80),
              child: Text(
                author,
                style: GoogleFonts.inter(fontWeight: FontWeight.w600),
              ),
            ),
            Align(
              alignment: Alignment(-.40, -.80),
              child: Text(
                date,
                style: GoogleFonts.inter(fontWeight: FontWeight.w300),
              ),
            ),
            Align(
              alignment: Alignment(-.50, -.50),
              child: SizedBox(
                width: size * .2,
                child: Row(
                  children: [
                    AnimatedRatingStars(
                        initialRating: double.parse(rate),
                        minRating: 0.0,
                        maxRating: 5.0,
                        starSize: 10,
                        readOnly: true,
                        onChanged: (double rating) {},
                        customFilledIcon: Icons.star_rate_rounded,
                        customHalfFilledIcon: Icons.star_half_rounded,
                        customEmptyIcon: Icons.star_border_rounded),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      rate.toString(),
                      style: GoogleFonts.inter(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(.70, .70),
              child: SizedBox(
                width: size * .6,
                height: position * .18,
                child: Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

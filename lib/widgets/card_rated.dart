import 'package:bodas/routes/linkspaper.dart';

// class CardRated extends ConsumerWidget {
//   final String author;
//   final String img;
//   final String date;
//   final String rate;
//   final String description;

//   const CardRated({
//     required this.author,
//     required this.img,
//     required this.date,
//     required this.rate,
//     required this.description,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final size = MediaQuery.of(context).size.width;
//     final position = MediaQuery.of(context).size.height;
//     return Padding(
//       padding: const EdgeInsets.only(top: 15),
//       child: Container(
//         width: size * .8,
//         height: position * .30,
//         decoration: BoxDecoration(
//           color: const Color(0xE1FFFFFF),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Stack(
//           children: [
//             Align(
//               alignment: Alignment(-.85, -.56),
//               child: CircleAvatar(
//                 minRadius: 25,
//                 maxRadius: 45,
//                 backgroundColor: Colors.amber,
//                 foregroundImage: AssetImage(img),
//               ),
//             ),
//             Align(
//               alignment: Alignment(-.60, -.80),
//               child: Text(
//                 author,
//                 style: GoogleFonts.inter(fontWeight: FontWeight.w600),
//               ),
//             ),
//             Align(
//               alignment: Alignment(-.40, -.80),
//               child: Text(
//                 date,
//                 style: GoogleFonts.inter(fontWeight: FontWeight.w300),
//               ),
//             ),
//             Align(
//               alignment: Alignment(-.50, -.50),
//               child: SizedBox(
//                 width: size * .2,
//                 child: Row(
//                   children: [
//                     AnimatedRatingStars(
//                         initialRating: double.parse(rate),
//                         minRating: 0.0,
//                         maxRating: 5.0,
//                         starSize: 10,
//                         readOnly: true,
//                         onChanged: (double rating) {},
//                         customFilledIcon: Icons.star_rate_rounded,
//                         customHalfFilledIcon: Icons.star_half_rounded,
//                         customEmptyIcon: Icons.star_border_rounded),
//                     const SizedBox(
//                       width: 40,
//                     ),
//                     Text(
//                       rate.toString(),
//                       style: GoogleFonts.inter(fontWeight: FontWeight.w300),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment(.70, .70),
//               child: SizedBox(
//                 width: size * .6,
//                 height: position * .18,
//                 child: Text(
//                   description,
//                   textAlign: TextAlign.justify,
//                   style: GoogleFonts.inter(fontWeight: FontWeight.w300),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
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
    return Responsive(
      CardRatedTablet(
        author: author,
        img: img,
        date: date,
        rate: rate,
        description: description,
      ),
      mobile: CardRatedMobile(
        author: author,
        img: img,
        date: date,
        rate: rate,
        description: description,
      ),
      web: CardRatedWeb(
        author: author,
        img: img,
        date: date,
        rate: rate,
        description: description,
      ),
    );
  }
}

// Versión Mobile
class CardRatedMobile extends StatelessWidget {
  final String author;
  final String img;
  final String date;
  final String rate;
  final String description;

  const CardRatedMobile({
    super.key,
    required this.author,
    required this.img,
    required this.date,
    required this.rate,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.25,
        decoration: BoxDecoration(
          color: const Color(0xE1FFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.amber,
                    foregroundImage: AssetImage(img),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        author,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text(
                        date,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w300, fontSize: 12),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          AnimatedRatingStars(
                            initialRating: double.parse(rate),
                            minRating: 0.0,
                            maxRating: 5.0,
                            starSize: 16,
                            readOnly: true,
                            onChanged: (double rating) {},
                            customFilledIcon: Icons.star_rate_rounded,
                            customHalfFilledIcon: Icons.star_half_rounded,
                            customEmptyIcon: Icons.star_border_rounded,
                          ),
                          // const SizedBox(width: 10),
                          Text(
                            rate,
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w300, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: size.height * 0.1,
                child: SingleChildScrollView(
                  child: Text(
                    description,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w300, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Versión Tablet
class CardRatedTablet extends StatelessWidget {
  final String author;
  final String img;
  final String date;
  final String rate;
  final String description;

  const CardRatedTablet(
      {super.key,
      required this.author,
      required this.img,
      required this.date,
      required this.rate,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        width: size.width * 0.7,
        height: size.height * 0.2,
        decoration: BoxDecoration(
          color: const Color(0xE1FFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.amber,
                foregroundImage: AssetImage(img),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          author,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          date,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w300, fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AnimatedRatingStars(
                          initialRating: double.parse(rate),
                          minRating: 0.0,
                          maxRating: 5.0,
                          starSize: 16,
                          readOnly: true,
                          onChanged: (double rating) {},
                          customFilledIcon: Icons.star_rate_rounded,
                          customHalfFilledIcon: Icons.star_half_rounded,
                          customEmptyIcon: Icons.star_border_rounded,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          rate,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w300, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                      child: Text(
                        description,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w300, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Versión Web
class CardRatedWeb extends StatelessWidget {
  final String author;
  final String img;
  final String date;
  final String rate;
  final String description;

  const CardRatedWeb(
      {super.key,
      required this.author,
      required this.img,
      required this.date,
      required this.rate,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        width: size.width * 0.5,
        height: size.height * 0.18,
        decoration: BoxDecoration(
          color: const Color(0xE1FFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.amber,
                foregroundImage: AssetImage(img),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          author,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        Text(
                          date,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w300, fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AnimatedRatingStars(
                          initialRating: double.parse(rate),
                          minRating: 0.0,
                          maxRating: 5.0,
                          starSize: 16,
                          readOnly: true,
                          onChanged: (double rating) {},
                          customFilledIcon: Icons.star_rate_rounded,
                          customHalfFilledIcon: Icons.star_half_rounded,
                          customEmptyIcon: Icons.star_border_rounded,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          rate,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w300, fontSize: 18),
                        ),
                      ],
                    ),
                    Text(
                      description,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w300, fontSize: 16),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bodas/routes/linkspaper.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        frame1,
        frame2,
        frame1,
        frame2,
        frame2,
        frame1
      ].map((i) {
        return Container(
          width: size * .2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(i),
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        aspectRatio: 2.0,
        autoPlay: true,
        enlargeFactor: 0,
        pauseAutoPlayInFiniteScroll: false,
        autoPlayAnimationDuration:
            const Duration(seconds: 10),
        pauseAutoPlayOnManualNavigate: false,
        scrollDirection: Axis.horizontal,
        pageSnapping: false,
        disableCenter: true,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.linear,
        autoPlayInterval:
            const Duration(seconds: 10),
        enableInfiniteScroll: true,
      ),
    );
  }
}

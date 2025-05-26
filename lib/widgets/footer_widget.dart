import 'package:bodas/routes/linkspaper.dart';

class FooterWidget extends ConsumerStatefulWidget {
  const FooterWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends ConsumerState<FooterWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final position = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          width: size,
          height: Responsive.isWeb(context) ? position * .2 : position * .4,
          child: SizedBox(
            width: size,
            height: Responsive.isWeb(context) ? position * .2 : position * .4,
            child: CarouselSlider(
              items: [spons, spons, spons, spons, spons].map((i) {
                return Container(
                  width: 1440,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage(i),
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height:
                    Responsive.isWeb(context) ? position * .1 : position * .4,
                aspectRatio: 2.0,
                autoPlay: true,
                enlargeFactor: 0,
                pauseAutoPlayInFiniteScroll: false,
                autoPlayAnimationDuration: const Duration(seconds: 10),
                pauseAutoPlayOnManualNavigate: false,
                scrollDirection: Axis.horizontal,
                pageSnapping: false,
                disableCenter: false,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.linear,
                autoPlayInterval: const Duration(seconds: 10),
                enableInfiniteScroll: true,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            Responsive.isWeb(context) ? position * .1 : position * .07,
            0,
            0,
            0,
          ),
        ),
        SizedBox(
          width: Responsive.isWeb(context) ? size : size / .5,
          height: position * .05,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonItem2(title: 'Politicas de Privacidad', route: '/polities'),
              ButtonItem2(title: 'Politicas de Cookies', route: '/cookies'),
            ],
          ),
        ),
      ],
    );
  }
}

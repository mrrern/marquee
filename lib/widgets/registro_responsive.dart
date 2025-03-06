import 'package:bodas/routes/linkspaper.dart';

class RegistroResponsive extends ConsumerWidget {
  const RegistroResponsive({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (Responsive.isMobile(context)) {
      return _RegistroMobileScreen();
    } else if (Responsive.isTablet(context)) {
      return _RegistroScreen();
    } else if (Responsive.isWeb(context)) {
      return _RegistroScreen();
    }
    return _RegistroScreen();
  }
}

class _RegistroMobileScreen extends ConsumerWidget {
  const _RegistroMobileScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size.width;
    final position = MediaQuery.of(context).size.height ;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                back2, // Replace with actual image path
                fit: BoxFit.cover,
              ),
            ),

            Center(
              child: SizedBox(
                width: size,
                height:
                    Responsive.isWeb(context) ? position * .3 : position * .5,
                child: CarouselSlider(
                  items:
                      [frame1, frame2, frame1, frame2, frame2, frame1].map((i) {
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
                    autoPlayAnimationDuration: const Duration(seconds: 10),
                    pauseAutoPlayOnManualNavigate: false,
                    scrollDirection: Axis.horizontal,
                    pageSnapping: false,
                    disableCenter: true,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.linear,
                    autoPlayInterval: const Duration(seconds: 10),
                    enableInfiniteScroll: true,
                  ),
                ),
              ),
            ),

            // Content
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 5),

                  // Header with logo and navigation
                  NavBar(),

                  // Registration form
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Center(
                      child: const RegistroForm(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegistroScreen extends ConsumerWidget {
  const _RegistroScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                back2, // Replace with actual image path
                fit: BoxFit.cover,
              ),
            ),

            // Content
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 5),

                  // Header with logo and navigation
                  NavBar(),
                  // Registration form
                  SizedBox(
                    height: height - 100,
                    child: Center(
                      child: const RegistroForm(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

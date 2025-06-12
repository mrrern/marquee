import 'package:bodas/routes/linkspaper.dart';

class RegistroResponsive extends ConsumerWidget {
  const RegistroResponsive({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (Responsive.isMobile(context)) {
      return const _RegistroMobileScreen();
    } else if (Responsive.isTablet(context)) {
      return const _RegistroScreen();
    } else if (Responsive.isWeb(context)) {
      return const _RegistroScreen();
    }
    return const _RegistroScreen();
  }
}

class _RegistroMobileScreen extends ConsumerWidget {
  const _RegistroMobileScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isWeb = Responsive.isWeb(context);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                back2,
                fit: BoxFit.cover,
              ),
            ),

            // Carousel
            if (isWeb)
              Center(
                child: SizedBox(
                  width: size.width,
                  height: size.height * 0.3,
                  child: CarouselSlider(
                    items: [frame1, frame2, frame1, frame2, frame2, frame1]
                        .map((i) {
                      return Container(
                        width: size.width * 0.2,
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
            SafeArea(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: size.height,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      // Header with logo and navigation
                      const NavBar(),
                      // Registration form
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: isWeb ? 40 : 20,
                          horizontal: isWeb ? 0 : 16,
                        ),
                        child: const Center(
                          child: RegistroForm(),
                        ),
                      ),
                      // Add extra padding at the bottom for mobile
                      if (!isWeb) const SizedBox(height: 20),
                    ],
                  ),
                ),
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
    final size = MediaQuery.of(context).size;
    final isWeb = Responsive.isWeb(context);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                back2,
                fit: BoxFit.cover,
              ),
            ),

            // Content
            SafeArea(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: size.height,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      // Header with logo and navigation
                      const NavBar(),
                      // Registration form
                      SizedBox(
                        height: size.height - 100,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: isWeb ? 0 : 16,
                            ),
                            child: const RegistroForm(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

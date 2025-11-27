import 'package:bodas/routes/linkspaper.dart';
import 'package:bodas/widgets/reset_password_form.dart';

class ResetPasswordScreenResponsive extends ConsumerWidget {
  const ResetPasswordScreenResponsive({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (Responsive.isMobile(context)) {
      return _ResetPasswordScreenMobile();
    } else if (Responsive.isTablet(context)) {
      return _ResetPasswordScreenTablet();
    } else if (Responsive.isWeb(context)) {
      return _ResetPasswordScreenWeb();
    }
    return _ResetPasswordScreenWeb();
  }
}

class _ResetPasswordScreenMobile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final height = size.height;

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

            Center(
              child: CarouselSlider(
                  items:
                      [frame1, frame2, frame1, frame2, frame2, frame1].map((i) {
                    return Container(
                      width: size.width * .2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(i), fit: BoxFit.cover)),
                    );
                  }).toList(),
                  options: CarouselOptions(
                      aspectRatio: 2.0,
                      autoPlay: true,
                      enlargeFactor: 0,
                      pauseAutoPlayInFiniteScroll: false,
                      autoPlayAnimationDuration: Duration(seconds: 10),
                      pauseAutoPlayOnManualNavigate: false,
                      scrollDirection: Axis.horizontal,
                      pageSnapping: false,
                      disableCenter: true,
                      viewportFraction: 0.8,
                      enlargeCenterPage: true,
                      autoPlayCurve: Curves.linear,
                      autoPlayInterval: Duration(seconds: 10),
                      enableInfiniteScroll: true)),
            ),
            // Content
            SingleChildScrollView(
              child: Column(
                children: [
                  // NavBar
                  const NavBar(),

                  // Reset Password Form
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.05,
                    ),
                    child: Center(
                      child: ResetPasswordForm(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * .05),
                    child: FooterWidget(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResetPasswordScreenTablet extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final height = size.height;

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
            SingleChildScrollView(
              child: Column(
                children: [
                  // NavBar
                  const NavBar(),

                  // Reset Password Form
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.08,
                    ),
                    child: Center(
                      child: ResetPasswordForm(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * .08),
                    child: FooterWidget(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResetPasswordScreenWeb extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final height = size.height;

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
            SingleChildScrollView(
              child: Column(
                children: [
                  // NavBar
                  const NavBar(),

                  // Reset Password Form
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.1,
                    ),
                    child: Center(
                      child: ResetPasswordForm(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * .1),
                    child: FooterWidget(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

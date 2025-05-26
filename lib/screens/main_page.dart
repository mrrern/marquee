import 'package:bodas/routes/linkspaper.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollOffset = ref.watch(scrollOffsetProvider);
    final size = MediaQuery.of(context).size.width;
    final position = MediaQuery.of(context).size.height;


    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned(
              top: -scrollOffset,
              child: SizedBox(
                width: size,
                child: Image.asset(
                  background,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const Positioned(child: NavBar()),
            Positioned(
              top: position * .07,
              child: SizedBox(
                width: size,
                height: position,
                child: SingleChildScrollView(
                  controller: ref.read(scrollControllerProvider),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(width: size, child: const BannerInitial()),
                      const ButtonTitle(title: title2),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size * .1,
                          right: size * .1,
                        ),
                        child: const WhoWidget(),
                      ),
                      // SizedBox(
                      //   width: size,
                      //   height: position * .1,
                      //   child: Container(
                      //     alignment: Alignment.center,
                      //     child: Text(
                      //       title4,
                      //       textAlign: TextAlign.center,
                      //       style: GoogleFonts.inter(
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: size * .017,
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      if (Responsive.isMobile(context))
                        SizedBox(
                          height: 40,
                        ),
                      if (Responsive.isWeb(context))
                        SizedBox(
                          height: 50,
                        ),

                      ResponsiveTitle(
                        text: title4,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                        mobileFontSize: 20,
                        tabletFontSize: 23,
                        webFontSize: 28,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 21),
                        child: Container(
                          width:
                              Responsive.isWeb(context) ? size * .8 : size * .9,
                          height: position,
                          decoration: BoxDecoration(
                            color: const Color(0xD39E9E9E),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              top: 8,
                              right: 25,
                              bottom: 8,
                            ),
                            child: ListView.builder(
                              itemCount: reviews.length,
                              itemBuilder: (BuildContext context, int index) {
                                return reviews[index];
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            top: position * .1,
                            left: size * .1,
                            right: size * .1,
                          ),
                          child: ResponsiveTitle(
                            text: title5.toUpperCase(),
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.bold,
                            mobileFontSize: 14,
                            tabletFontSize: 16,
                            webFontSize: 18,
                          )),
                      const SocialBanners(),
                      SizedBox(height: position * .2),
                      SizedBox(
                        width: size,
                        height: position * .6,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: size,
                                height: Responsive.isWeb(context)
                                    ? position * .3
                                    : position * .5,
                                child: CustomCarousel(size: size),
                              ),
                            ),
                            Center(
                              child: Container(
                                width: Responsive.isWeb(context)
                                    ? size * .3
                                    : size * .84,
                                height: position * .6,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: PlayerVideo(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: position * .2),
                      const FooterWidget(),
                      SizedBox(height: position * .2),
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

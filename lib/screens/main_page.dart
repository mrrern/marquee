import 'package:bodas/routes/linkspaper.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  double scrollOffset = 0;
  YoutubeWebPlayerController? _controller = YoutubeWebPlayerController();

  @override
  void initState() {
    super.initState();
    // fetchOpiniones();
    final scrollController = ref.read(scrollControllerProvider);
    scrollController.addListener(() {
      setState(() {
        scrollOffset = scrollController.offset * 0.2;
        //Controla la velocidad del efecto
      });
    });
    _controller?.addListener(() {
      if (_controller!.isReady) {
        _controller?.play;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ref.watch(scrollControllerProvider);
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
                    ))),

            //NavBar
            Positioned(child: NavBar()),
            //Body
            Positioned(
              top: position * .07,
              child: SizedBox(
                width: size,
                height: position,
                child: SingleChildScrollView(
                  controller: scrollController,
                  reverse: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      //
                      //
                      //Initial Banner
                      SizedBox(
                        width: size,
                        child: BannerInitial(),
                      ),
                      //
                      //
                      //Quienes Somos
                      ButtonTitle(
                        title: title2,
                      ),
                      //
                      //
                      SizedBox(
                        width: size,
                        height: position * .3,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: size * .1,
                            right: size * .1,
                          ),
                          child: WhoWidget(),
                        ),
                      ),
                      SizedBox(
                        width: size,
                        height: position * .1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            title4,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: size * .017,
                            ),
                          ),
                        ),
                      ),
                      ////
                      /////
                      ///Raiting
                      Padding(
                        padding: EdgeInsets.only(top: 21),
                        child: Container(
                          width: size * .8,
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
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return CardRated(
                                    author: "Richard Brito",
                                    img: bod1,
                                    date: "25/02/2025",
                                    rate: "4.5",
                                    description: review);
                              },
                            ),
                          ),
                        ),
                      ),
                      ////////
                      ///
                      ///Conocenos}
                      ///
                      ////////
                      Padding(
                        padding: EdgeInsets.only(
                          top: position * .1,
                          left: size * .1,
                          right: size * .1,
                        ),
                        child: Text(
                          title5.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: size * .017,
                          ),
                        ),
                      ),

                      ///
                      ///
                      ///
                      SocialBanners(),
                      //////
                      ///
                      ///
                      ///FINAL
                      ///
                      ///
                      ///////
                      SizedBox(
                        height: position * .2,
                      ),
                      SizedBox(
                        width: size,
                        height: position * .6,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: size,
                                height: position * .5,
                                child: CarouselSlider(
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
                                                fit: BoxFit.contain)),
                                      );
                                    }).toList(),
                                    options: CarouselOptions(
                                        aspectRatio: 2.0,
                                        autoPlay: true,
                                        enlargeFactor: 0,
                                        pauseAutoPlayInFiniteScroll: false,
                                        autoPlayAnimationDuration:
                                            Duration(seconds: 10),
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
                            ),
                            Center(
                              child: Container(
                                width: size * .3,
                                height: position * .6,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: YoutubeWebPlayer(
                                  videoId: 'HmIdaxtQL9w',
                                  isAutoPlay: true,
                                  background: white,
                                  controller: _controller,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //////
                      /////
                      ///Marcas
                      ///
                      //////
                      SizedBox(
                        height: position * .2,
                      ),
                      SizedBox(
                        width: size,
                        height: position * .2,
                        child: SizedBox(
                          width: size,
                          height: position * .2,
                          child: CarouselSlider(
                              items: [
                                spons,
                                spons,
                                spons,
                                spons,
                                spons,
                              ].map((i) {
                                return Container(
                                  width: 1440,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      image: DecorationImage(
                                          image: AssetImage(i),
                                          fit: BoxFit.fitHeight)),
                                );
                              }).toList(),
                              options: CarouselOptions(
                                  height: position * .08,
                                  aspectRatio: 2.0,
                                  autoPlay: true,
                                  enlargeFactor: 0,
                                  pauseAutoPlayInFiniteScroll: false,
                                  autoPlayAnimationDuration:
                                      Duration(seconds: 10),
                                  pauseAutoPlayOnManualNavigate: false,
                                  scrollDirection: Axis.horizontal,
                                  pageSnapping: false,
                                  disableCenter: false,
                                  viewportFraction: 0.8,
                                  enlargeCenterPage: true,
                                  autoPlayCurve: Curves.linear,
                                  autoPlayInterval: Duration(seconds: 10),
                                  enableInfiniteScroll: true)),
                        ),
                      ),
                      SizedBox(
                        height: position * .2,
                      ),
                      SizedBox(
                        width: size,
                        height: position * .1,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonItem2(
                                title: 'Politicas de Privacidad',
                                route: '/polities'),
                            ButtonItem2(
                                title: 'Politicas de Cookies',
                                route: '/cookies'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: position * .2,
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

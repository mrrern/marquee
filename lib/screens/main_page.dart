import 'package:bodas/routes/linkspaper.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  double scrollOffset = 0;

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
                      //////
                      ///
                      ///
                      ///FINAL
                      ///
                      ///
                      ///////
                      SizedBox(
                        height: position * 4,
                      )
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

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
    final scrollController = ref.read(scrollControllerProvider);
    scrollController.addListener(() {
      setState(() {
        scrollOffset =
            scrollController.offset * 0.5; // Controla la velocidad del efecto
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ref.watch(scrollControllerProvider);
    final size = MediaQuery.of(context).size.width;
    final position = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size,
          height: position,
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
                        
                        Container(
                          width: size / 3,
                          color: grey,
                          height: position * .6,
                        ),
                      ],
                    ),
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

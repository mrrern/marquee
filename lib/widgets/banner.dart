import 'dart:async';

import 'package:bodas/routes/linkspaper.dart';

class BannerInitial extends ConsumerStatefulWidget {
  const BannerInitial({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BannerInitialState();
}

class _BannerInitialState extends ConsumerState<BannerInitial> {
  late Timer timerCarrusel; // Timer para cambiar la imagen automáticamente

  final List<String> images = [
    img1,
    img2,
    img3,
  ];

  void carruselSwicht() {
    timerCarrusel = Timer.periodic(const Duration(seconds: 8), (timerL) {
      final currentIndex = ref.read(imageBannerIndexProvider);
      final nextIndex = currentIndex + 1;

      if (nextIndex >= images.length) {
        ref.read(imageBannerIndexProvider.notifier).state = 0;
      } else {
        ref.read(imageBannerIndexProvider.notifier).state = nextIndex;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    carruselSwicht();
  }

  @override
  void dispose() {
    timerCarrusel.cancel();
    carruselSwicht();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final position = MediaQuery.of(context).size.height;
    final indexImage = ref.watch(imageBannerIndexProvider);

    return Stack(children: [
      SizedBox(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: Image.asset(
            images[indexImage],
            key: ValueKey<int>(indexImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
          child: Container(
        width: size,
        height: position * .2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF000000), Color(0xA5000000), Color(0x00000000)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
      )),
      Align(
          alignment: Alignment(0, -1),
          child: Container(
            width: size * .6,
            height: position * .07,
            decoration: BoxDecoration(
              color: const Color(0x2EFFFFFF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Text(
              title1.toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: size * .017,
                  color: white),
            ),
          )),
    ]);
  }
}

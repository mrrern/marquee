import 'package:bodas/routes/linkspaper.dart';
class BannerInitial extends ConsumerWidget {
  const BannerInitial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size.width;
    final position = MediaQuery.of(context).size.height;
    final images = ref.watch(bannerImagesProvider);
    final indexImage = ref.watch(bannerIndexProvider);

    return Stack(
      children: [
        SizedBox(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF000000),
                  Color(0xA5000000),
                  Color(0x00000000),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0, -1),
          child: Container(
            width: size * .6,
            height: position * .07,
            decoration: const BoxDecoration(
              color: Color(0x2EFFFFFF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Text(
              title1.toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: size * .017,
                color: white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:bodas/routes/linkspaper.dart';
// class BannerInitial extends ConsumerWidget {
//   const BannerInitial({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final size = MediaQuery.of(context).size.width;
//     final position = MediaQuery.of(context).size.height;
//     final images = ref.watch(bannerImagesProvider);
//     final indexImage = ref.watch(bannerIndexProvider);

//     return Stack(
//       children: [
//         SizedBox(
//           child: AnimatedSwitcher(
//             duration: const Duration(milliseconds: 500),
//             child: Image.asset(
//               images[indexImage],
//               key: ValueKey<int>(indexImage),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Positioned(
//           child: Container(
//             width: size,
//             height: position * .2,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xFF000000),
//                   Color(0xA5000000),
//                   Color(0x00000000),
//                 ],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//           ),
//         ),
//         Align(
//           alignment: const Alignment(0, -1),
//           child: Container(
//             width: size * .6,
//             height: position * .07,
//             decoration: const BoxDecoration(
//               color: Color(0x2EFFFFFF),
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30),
//               ),
//             ),
//             child: Text(
//               title1.toUpperCase(),
//               textAlign: TextAlign.center,
//               style: GoogleFonts.inter(
//                 fontWeight: FontWeight.bold,
//                 fontSize: size * .017,
//                 color: white,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// banner_initial.dart

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
        Align(
          alignment: Alignment(0, -1),
          child: _BannerImage(
            width: size,
            images: images,
            indexImage: indexImage,
          ),
        ),
        const _BannerGradientOverlay(),
        _BannerTitle(
          size: size,
          position: position,
        ),
      ],
    );
  }
}

class _BannerImage extends StatelessWidget {
  final double width;
  final List<String> images;
  final int indexImage;

  const _BannerImage({
    required this.images,
    required this.indexImage,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: Responsive.isWeb(context) ? 609 : 500,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: Image.asset(
          images[indexImage],
          height: Responsive.isWeb(context) ? 609 : 500,
          key: ValueKey<int>(indexImage),
          fit: Responsive.isWeb(context) ? BoxFit.cover : BoxFit.none,
        ),
      ),
    );
  }
}

class _BannerGradientOverlay extends StatelessWidget {
  const _BannerGradientOverlay();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
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
    );
  }
}

class _BannerTitle extends StatelessWidget {
  final double size;
  final double position;

  const _BannerTitle({
    required this.size,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -1),
      child: Container(
        width: Responsive.isWeb(context) ? size * 0.6 : size * 0.8,
        height: Responsive.isWeb(context) ? position * 0.07 : position * .09,
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
            fontSize: Responsive.isWeb(context) ? size * 0.017 : 17,
            color: white,
          ),
        ),
      ),
    );
  }
}

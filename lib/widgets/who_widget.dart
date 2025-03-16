import 'package:bodas/routes/linkspaper.dart';

// class WhoWidget extends StatelessWidget {
//   const WhoWidget({
//     super.key,

//   });

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size.width;
//     final position = MediaQuery.of(context).size.height;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Container(
//           width: size * .35,
//           height: position * .9,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: grey,
//           ),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 12),
//                 child: Text(
//                   title3.toUpperCase(),
//                   style: GoogleFonts.inter(
//                       fontWeight: FontWeight.bold,
//                       fontSize: size * .015),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 10.0),
//                 child: Text(
//                   review,
//                   textAlign: TextAlign.justify,
//                   style: GoogleFonts.inter(),
//                 ),
//               )
//             ],
//           ),
//         ),
//         CarruselF(),
//       ],
//     );
//   }
// }

// who_widget.dart

class WhoWidget extends StatelessWidget {
  const WhoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      const TabletWhoLayout(),
      mobile: const MobileWhoLayout(),
      web: const WebWhoLayout(),
    );
  }
}

class MobileWhoLayout extends StatelessWidget {
  const MobileWhoLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _WhoContent(),
        SizedBox(
          height: 25,
        ),
        CarruselF(),
      ],
    );
  }
}

class TabletWhoLayout extends StatelessWidget {
  const TabletWhoLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _WhoContent(),
        CarruselF(),
      ],
    );
  }
}

class WebWhoLayout extends StatelessWidget {
  const WebWhoLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _WhoContent(),
        CarruselF(),
      ],
    );
  }
}

class _WhoContent extends StatelessWidget {
  const _WhoContent();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final position = MediaQuery.of(context).size.height;
    final isWeb = Responsive.isWeb(context);

    return Container(
      width: size * _getContentWidthRatio(context),
      height: isWeb ? position * _getContentHeightRatio() : 250,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: grey,
      ),
      child: _buildContent(size, context),
    );
  }

  double _getContentWidthRatio(BuildContext context) {
    return Responsive.isWeb(context) ? 0.35 : 0.85;
  }

  double _getContentHeightRatio() {
    return 0.3;
  }

  Widget _buildContent(double size, BuildContext context) {
    final isWeb = Responsive.isWeb(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            title3.toUpperCase(),
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: isWeb ? size * _getTitleFontSizeRatio() : 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            review,
            textAlign: TextAlign.justify,
            style: GoogleFonts.inter(),
          ),
        ),
      ],
    );
  }

  double _getTitleFontSizeRatio() {
    return 0.015;
  }
}

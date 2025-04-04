import 'package:bodas/routes/linkspaper.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 991;

    return Container(
      padding: const EdgeInsets.only(top: 7),
      width: screenWidth,
      height: isMobile ? 70 : 60,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            GestureDetector(
              onTap: () => context.go('/'),
              child: Image.asset(
                logo,
                width: isMobile ? 190 : 216,
                fit: BoxFit.contain,
              ),
            ),

            // Exit button
            ButtonItem(
              title: "Salir",
              route: '/',
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bodas/routes/linkspaper.dart';

class HeaderWidget extends ConsumerWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exit = ref.read(authProvider.notifier).signOut();
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
            GestureDetector(
              onTap: () => exit,
              child: ButtonItem(
                title: "Salir",
                route: '/access',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

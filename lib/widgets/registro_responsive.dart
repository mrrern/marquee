import 'package:bodas/routes/linkspaper.dart';

class RegistroResponsive extends ConsumerWidget {
  const RegistroResponsive({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (Responsive.isMobile(context)) {
      return _RegistroMobileScreen();
    } else if (Responsive.isTablet(context)) {
      return _RegistroScreen();
    } else if (Responsive.isWeb(context)) {
      return _RegistroScreen();
    }
    return _RegistroScreen();
  }
}

class _RegistroMobileScreen extends ConsumerWidget {
  const _RegistroMobileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                back2, // Replace with actual image path
                fit: BoxFit.cover,
              ),
            ),

            // Content
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 5),

                  // Header with logo and navigation
                  NavBar(),

                  // Registration form
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Center(
                      child: const RegistroForm(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegistroScreen extends ConsumerWidget {
  const _RegistroScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                back2, // Replace with actual image path
                fit: BoxFit.cover,
              ),
            ),

            // Content
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 5),

                  // Header with logo and navigation
                  NavBar(),
                  // Registration form
                  SizedBox(
                    height: height - 100,
                    child: Center(
                      child: const RegistroForm(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

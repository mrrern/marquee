import 'package:bodas/routes/linkspaper.dart';

class NavBar extends ConsumerWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (Responsive.isWeb(context)) {
      return WebNavBar();
    } else if (Responsive.isTablet(context)) {
      return WebNavBar();
    } else if (Responsive.isMobile(context)) {
      return MovilNavbar();
    }
    return WebNavBar();
  }
}

class WebNavBar extends ConsumerWidget {
  const WebNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isTablet = Responsive.isTablet(context);
    final isWeb = Responsive.isWeb(context);
    return Container(
        color: Colors.white,
        padding:
            EdgeInsets.only(top: 4, right: 2, left: 2, bottom: isWeb ? 8 : 18),
        width: width,
        height: isWeb ? height * .07 : height * .1,
        child: Row(
          children: [
            SizedBox(
                child: GestureDetector(
                    onTap: () => context.go('/'), child: Image.asset(logo))),
            SizedBox(
              width: isTablet
                  ? width * .35
                  : isWeb
                      ? width * .7
                      : width * .44,
            ),
            ButtonItem(
              route: '/access',
              title: "Acceso",
            ),
            ButtonItem(title: "Registro", route: '/sign')
          ],
        ));
  }
}

class MovilNavbar extends ConsumerWidget {
  const MovilNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      width: width,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 30),
        child: Row(
          children: [
            // Logo
            GestureDetector(
              onTap: () => context.go('/'),
              child: Image.asset(
                logo,
                width: 150,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(
              width: width * .1,
            ),

            // Navigation buttons
            ButtonItem(
              title: "acceso",
              route: '/access',
            ),
            ButtonItem(
              title: "registro",
              route: '/sign',
            ),
          ],
        ),
      ),
    );
  }
}

class FormHeader extends ConsumerWidget {
  const FormHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool state = true;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width < 640 ? 10 : 6,
        vertical: MediaQuery.of(context).size.width < 640 ? 15 : 7,
      ),
      width: width,
      height: height * .1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.go('/'),
            child: Image.asset(
              logo,
              width: MediaQuery.of(context).size.width < 640 ? 160 : 216,
              height: 46,
              fit: BoxFit.contain,
            ),
          ),
          ButtonItem(title: "Salir", route: "/access")
        ],
      ),
    );
  }
}

class AdminNavBar extends ConsumerWidget {
  const AdminNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref,
      {bool isWeb = false, bool isTablet = false, bool isMobile = false}) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          GestureDetector(
            onTap: () => context.go('/'),
            child: Image.asset(
              logo, // Replace with actual asset path
              width: isMobile ? 156 : 309,
              height: isMobile ? null : 65,
              fit: BoxFit.contain,
              colorBlendMode: BlendMode.colorDodge,
            ),
          ),

          // Nav links
          Row(
            children: [
              _buildNavItem('Menu', isMobile, '/admin', context),
              SizedBox(
                width: isMobile ? 7 : 24,
              ),
              _buildNavItem('Usuario', isMobile, '/admin/user', context),
              SizedBox(
                width: isMobile ? 7 : 24,
              ),
              _buildNavItem('Menú', isMobile, '/admin/menu', context),
              SizedBox(width: isMobile ? 7 : 24),
              GestureDetector(
                  onTap: () {
                    Future.microtask(() {
                      ref.read(authProvider.notifier).signOut();
                      context.go('/');
                    });
                  },
                  child: Text(
                    'Salir',
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 16 : 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      String text, bool isMobile, String route, BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(route);
      },
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: isMobile ? 16 : 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}

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
              'assets/mw.png',
              width: isMobile ? 117 : 231.75,
              height: isMobile ? null : 48.75,
              fit: BoxFit.contain,
              colorBlendMode: BlendMode.colorDodge,
            ),
          ),

          // Nav links
          Row(
            children: [
              ButtonItem(title: 'Menu', route: '/admin'),
              SizedBox(
                width: isMobile ? 7 : 24,
              ),
              ButtonItem(title: 'Usuario', route: '/admin/usuarios'),
              SizedBox(
                width: isMobile ? 7 : 24,
              ),
              ButtonItem(title: 'Notas', route: '/admin/notas'),
              SizedBox(width: isMobile ? 7 : 24),
              ButtonExit(title: 'Salir', route: '/access'),
            ],
          ),
        ],
      ),
    );
  }
}

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
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 10, right: 4, left: 4),
        width: width,
        height: Responsive.isWeb(context) ? height * .07 : height * .1,
        child: Row(
          children: [
            SizedBox(
                child: GestureDetector(
                    onTap: () => context.go('/'), child: Image.asset(logo))),
            SizedBox(
              width: Responsive.isWeb(context) ? width * .7 : width * .4,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
    );
  }
}

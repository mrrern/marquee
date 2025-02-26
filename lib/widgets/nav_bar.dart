import 'package:bodas/routes/linkspaper.dart';

class NavBar extends ConsumerWidget {
  const NavBar({
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

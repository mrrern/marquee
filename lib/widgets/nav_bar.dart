import 'package:bodas/routes/linkspaper.dart';

class NavBar extends ConsumerWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size.width;

    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 10, right: 4, left: 4),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .07,
        child: Row(
          children: [
            SizedBox(
                child: GestureDetector(
                    onTap: () => context.go('/'), child: Image.asset(logo))),
            SizedBox(
              width: size * .7,
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

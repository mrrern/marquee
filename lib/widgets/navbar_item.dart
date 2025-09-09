import 'package:bodas/routes/linkspaper.dart';

class ButtonItem extends ConsumerWidget {
  final String title;
  final String route;
  const ButtonItem({
    required this.title,
    required this.route,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonState = ref.watch(buttonStateProvider(route));
    final buttonNotifier = ref.read(buttonStateProvider(route).notifier);
    final size = MediaQuery.of(context).size.width;
    final isWeb = Responsive.isWeb(context);
    final isTablet = Responsive.isTablet(context);

    return Container(
      padding: EdgeInsets.only(right: Responsive.isWeb(context) ? 17 : 5),
      width: isTablet
          ? size * .19
          : isWeb
              ? size * .08
              : size * .23,
      child: MouseRegion(
        onEnter: (_) => buttonNotifier.hover(true),
        onExit: (_) => buttonNotifier.hover(false),
        child: GestureDetector(
            onTap: () {
              buttonNotifier.select();
              context.go(route);
            },
            child: Text(
              title,
              style: GoogleFonts.inter(
                  fontSize: isTablet
                      ? size * .03
                      : isWeb
                          ? size * .016
                          : size * .05,
                  fontWeight: FontWeight.w500,
                  color: buttonState.isSelected || buttonState.isHovered
                      ? grey
                      : black),
            )),
      ),
    );
  }
}

class ButtonItem2 extends ConsumerWidget {
  final String title;
  final String route;
  const ButtonItem2({
    required this.title,
    required this.route,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonState = ref.watch(buttonStateProvider(route));
    final buttonNotifier = ref.read(buttonStateProvider(route).notifier);
    final size = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(right: 17),
      width: Responsive.isWeb(context) ? size * .3 : size * .4,
      child: MouseRegion(
        onEnter: (_) => buttonNotifier.hover(true),
        onExit: (_) => buttonNotifier.hover(false),
        child: GestureDetector(
            onTap: () {
              buttonNotifier.select();
              context.go(route);
            },
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize:
                      Responsive.isWeb(context) ? size * .016 : size * .03,
                  fontWeight: FontWeight.w500,
                  color: buttonState.isSelected || buttonState.isHovered
                      ? grey
                      : black),
            )),
      ),
    );
  }
}

class ButtonExit extends ConsumerWidget {
  final String title;
  final String route;
  const ButtonExit({
    required this.title,
    required this.route,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonState = ref.watch(buttonStateProvider(route));
    final buttonNotifier = ref.read(buttonStateProvider(route).notifier);
    final userState = ref.watch(authProvider);
    final size = MediaQuery.of(context).size.width;
    final isWeb = Responsive.isWeb(context);
    final isTablet = Responsive.isTablet(context);

    return Container(
      padding: EdgeInsets.only(right: Responsive.isWeb(context) ? 17 : 5),
      width: isTablet
          ? size * .19
          : isWeb
              ? size * .08
              : size * .23,
      child: MouseRegion(
        onEnter: (_) => buttonNotifier.hover(true),
        onExit: (_) => buttonNotifier.hover(false),
        child: GestureDetector(
            onTap: () {
              buttonNotifier.select();
              userState.whenData((user) {
                if (user != null) {
                  ref.read(authProvider.notifier).signOut();
                }
              });
              context.pushReplacement(route);
            },
            child: Text(
              title,
              style: GoogleFonts.inter(
                  fontSize: isTablet
                      ? size * .03
                      : isWeb
                          ? size * .016
                          : size * .05,
                  fontWeight: FontWeight.w500,
                  color: buttonState.isSelected || buttonState.isHovered
                      ? grey
                      : black),
            )),
      ),
    );
  }
}

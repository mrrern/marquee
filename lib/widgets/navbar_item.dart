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

    return Container(
      padding: EdgeInsets.only(right: 17),
      width: size * .08,
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
                  fontSize: size * .016,
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
      width: size * .3,
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
                  fontSize: size * .016,
                  fontWeight: FontWeight.w500,
                  color: buttonState.isSelected || buttonState.isHovered
                      ? grey
                      : black),
            )),
      ),
    );
  }
}

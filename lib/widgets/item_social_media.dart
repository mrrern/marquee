import 'package:bodas/routes/linkspaper.dart';

class ItemSocialMedia extends ConsumerWidget {
  final Uri url;
  final String social;

  const ItemSocialMedia({
    super.key,
    required this.url,
    required this.social,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonNotifier = ref.read(hoverButtonProvider(url).notifier);
    final buttonState = ref.watch(hoverButtonProvider(url));
    return MouseRegion(
      onEnter: (_) => buttonNotifier.hover(true),
      onExit: (_) => buttonNotifier.hover(false),
      child: GestureDetector(
        onTap: () {
          launchUrl(url);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: buttonState.isHovered ? 90 : 70,
          height: buttonState.isHovered ? 90 : 70,
          child: SvgPicture.asset(
            social,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

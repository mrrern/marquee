import 'package:bodas/routes/linkspaper.dart';

class HoverButton extends ConsumerStatefulWidget {
  final Function() press;
  final String text;
  const HoverButton( this.text, {required this.press, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HoverButtonState();
}

class _HoverButtonState extends ConsumerState<HoverButton> {
  @override
  Widget build(BuildContext context) {
    final isHover = ref.watch(textHoverProvider);
    return MouseRegion(
      onEnter: (_) => ref.read(textHoverProvider.notifier).state = true,
      onExit: (_) => ref.read(textHoverProvider.notifier).state = false,
      child: GestureDetector(
        onTap: widget.press,
        child: AnimatedContainer(
          duration: Duration(microseconds: 300),
          width: 208,
          margin: const EdgeInsets.symmetric(vertical: 30),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isHover ? AppColors.mediumGrey : AppColors.darkGrey,
            borderRadius: BorderRadius.circular(4),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: GoogleFonts.inter(
                color:
                    isHover ? AppColors.primaryText : AppColors.secondaryText,
                fontSize: 12,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class HoverButton2 extends ConsumerStatefulWidget {
  final void Function() press;
  final String text;
  const HoverButton2(this.press, this.text, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HoverButton2State();
}

class _HoverButton2State extends ConsumerState<HoverButton2> {
  @override
  Widget build(BuildContext context) {
    final isHover = ref.watch(textHoverProvider);
    return MouseRegion(
      onEnter: (_) => ref.read(textHoverProvider.notifier).state = true,
      onExit: (_) => ref.read(textHoverProvider.notifier).state = false,
      child: GestureDetector(
        onTap: widget.press,
        child: AnimatedContainer(
          duration: Duration(microseconds: 300),
          width: 208,
          margin: const EdgeInsets.symmetric(vertical: 30),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isHover ? AppColors.mediumGrey : AppColors.darkGrey,
            borderRadius: BorderRadius.circular(4),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: GoogleFonts.inter(
                color:
                    isHover ? AppColors.primaryText : AppColors.secondaryText,
                fontSize: 12,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class HoverButton3 extends ConsumerStatefulWidget {
  final void Function() press;
  final String text;
  const HoverButton3(this.press, this.text, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HoverButton3State();
}

class _HoverButton3State extends ConsumerState<HoverButton3> {
  @override
  Widget build(BuildContext context) {
    final isHover = ref.watch(text2HoverProvider);
    return MouseRegion(
      onEnter: (_) => ref.read(text2HoverProvider.notifier).state = true,
      onExit: (_) => ref.read(text2HoverProvider.notifier).state = false,
      child: GestureDetector(
        onTap: widget.press,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style:
                  GoogleFonts.inter(color: AppColors.primaryText, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 50,
              height: 10,
              child: Divider(
                color: isHover ? AppColors.mediumGrey : AppColors.darkGrey,
                height: 3,
                thickness: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}

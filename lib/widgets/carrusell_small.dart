import 'dart:async';

import 'package:bodas/routes/linkspaper.dart';

class CarruselF extends ConsumerStatefulWidget {
  const CarruselF({super.key});

  @override
  ConsumerState<CarruselF> createState() => _CarruselFState();
}

class _CarruselFState extends ConsumerState<CarruselF> {
  Timer? _timer;
  final List<String> _images = [bod1, bod2, bod3, bod4];

  @override
  void initState() {
    super.initState();
    _startImageSwitcher();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startImageSwitcher() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (!mounted) return;

      final currentIndex = ref.read(imageIndexProvider);
      final nextIndex = (currentIndex + 1) % _images.length;
      ref.read(imageIndexProvider.notifier).state = nextIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final position = MediaQuery.of(context).size.height;
    final indexImage = ref.watch(imageIndexProvider);
    final isWeb = Responsive.isWeb(context);

    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Container(
        key: ValueKey<int>(indexImage),
        width: isWeb ? size * .35 : size * .85,
        height: isWeb ? position * .3 : position * .4,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(_images[indexImage]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

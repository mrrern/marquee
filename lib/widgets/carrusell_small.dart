import 'dart:async';

import 'package:bodas/routes/linkspaper.dart';

class CarruselF extends ConsumerStatefulWidget {
  const CarruselF({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CarruselFState();
}

class _CarruselFState extends ConsumerState<CarruselF> {
  Timer? timer; // Timer para cambiar la imagen automáticamente

  final List<String> images = [
    bod1,
    bod2,
    bod3,
    bod4,
  ];

  void _startImageSwitcher() async {
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (!mounted) {
        return; // Evita acceso a `ref` después de que el widget se descarte
      }
      ref.read(imageIndexProvider.notifier).state =
          (ref.read(imageIndexProvider) + 1) % images.length;
    });
  }

  @override
  void initState() {
    super.initState();
    _startImageSwitcher();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final position = MediaQuery.of(context).size.height;
    final indexImage = ref.watch(imageIndexProvider);

    return AnimatedSwitcher(
      duration: Duration(seconds: 1),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Container(
        key: ValueKey<int>(indexImage),
        width: size * .35,
        height: position * .9,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage(images[indexImage]), fit: BoxFit.cover),
        ),
      ),
    );
  }
}

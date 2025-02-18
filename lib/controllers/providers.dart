import 'package:bodas/routes/linkspaper.dart';

// Proveedor de estado para cada botón
final buttonStateProvider =
    StateNotifierProvider.family<ButtonStateNotifier, ButtonState, String>(
        (ref, buttonText) {
  return ButtonStateNotifier();
});

//controller del scroll
final scrollControllerProvider = Provider<ScrollController>((ref) {
  return ScrollController();
});

//Maneja el state del scroll false y true
final StateProvider<bool> scrolledProvider = StateProvider<bool>((ref) {
  final scrollController = ref.watch(scrollControllerProvider);
  bool scrolled = false;

  scrollController.addListener(() {
    if (scrollController.offset > 0) {
      scrolled = true;
    } else {
      scrolled = false;
    }
    ref.read(scrolledProvider.notifier).state = scrolled;
  });

  return scrolled;
});

//Manejar el state del size
final screenSizeProvider = Provider<Size>((ref) {
  return Size(0, 0);
});

//Maneja la ruta en la que se encuentra
final currentRouteProvider =
    StateNotifierProvider<CurrentRouteNotifier, String>((ref) {
  return CurrentRouteNotifier();
});

//banner dinamico
final imageIndexProvider = StateProvider<int>((ref) => 0);

final imageBannerIndexProvider = StateProvider<int>((ref) => 0);

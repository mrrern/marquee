
import 'package:bodas/routes/linkspaper.dart';

// Modelo de estado para el botón
class ButtonState {
  final bool isHovered;
  final bool isSelected;

  ButtonState({required this.isHovered, required this.isSelected});

  ButtonState copyWith({bool? isHovered, bool? isSelected}) {
    return ButtonState(
      isHovered: isHovered ?? this.isHovered,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

// Notifier que maneja el estado del botón
class ButtonStateNotifier extends StateNotifier<ButtonState> {
  ButtonStateNotifier()
      : super(ButtonState(isHovered: false, isSelected: false));

  void hover(bool isHovered) {
    if (!state.isSelected) {
      state = state.copyWith(isHovered: isHovered);
    }
  }

  void select() {
    state = state.copyWith(isSelected: true, isHovered: false);
  }
}


class ScreenSizeNotifier extends StateNotifier<double> {
  ScreenSizeNotifier() : super(0);

  void updateSize(double newSize) {
    state = newSize;
  }
}



class CurrentRouteNotifier extends StateNotifier<String> {
  CurrentRouteNotifier() : super('/');

  void updateRoute(String newRoute) {
    state = newRoute;
  }
}


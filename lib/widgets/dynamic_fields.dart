import 'package:bodas/routes/linkspaper.dart';

// Definimos el Notifier para nuestra lista de canciones
class NovioListNotifier extends Notifier<List<String>> {
  @override
  List<String> build() {
    // El método build inicializa el estado con una lista vacía de canciones [5-7].
    return [];
  }

  // Método para agregar una nueva canción a la lista
  void addSong(String newSong) {
    // Actualizamos el estado creando una nueva lista con los elementos existentes
    // más la nueva canción. Esto asegura la inmutabilidad y notifica a los oyentes [5, 8-11].
    state = [...state, newSong];
    // Opcional: Para depuración, puedes imprimir el estado actual [12].
    debugPrint(
        'Canción agregada: $newSong. Total de canciones: Novio ${state.length}');
  }

  // Método para eliminar una canción por índice
  void removeSong(int index) {
    if (index >= 0 && index < state.length) {
      final updatedList = List<String>.from(state)..removeAt(index);
      state = updatedList; // Actualiza el estado [8].
      debugPrint(
          'Canción eliminada en índice $index. Total de canciones: Novio ${state.length}');
    }
  }

  // Método para borrar todas las canciones
  void clearAllSongs() {
    state = []; // Asigna una lista vacía al estado [13].
    debugPrint('Todas las canciones han sido borradas.');
  }
}

// Definimos el Notifier para nuestra lista de canciones
class NoviaListNotifier extends Notifier<List<String>> {
  @override
  List<String> build() {
    // El método build inicializa el estado con una lista vacía de canciones [5-7].
    return [];
  }

  // Método para agregar una nueva canción a la lista
  void addSong(String newSong) {
    // Actualizamos el estado creando una nueva lista con los elementos existentes
    // más la nueva canción. Esto asegura la inmutabilidad y notifica a los oyentes [5, 8-11].
    state = [...state, newSong];
    // Opcional: Para depuración, puedes imprimir el estado actual [12].
    debugPrint(
        'Canción agregada: $newSong. Total de canciones: Novio ${state.length}');
  }

  // Método para eliminar una canción por índice
  void removeSong(int index) {
    if (index >= 0 && index < state.length) {
      final updatedList = List<String>.from(state)..removeAt(index);
      state = updatedList; // Actualiza el estado [8].
      debugPrint(
          'Canción eliminada en índice $index. Total de canciones: Novia ${state.length}');
    }
  }

  // Método para borrar todas las canciones
  void clearAllSongs() {
    state = []; // Asigna una lista vacía al estado [13].
    debugPrint('Todas las canciones han sido borradas.');
  }
}

final groomLinksProvider =
    NotifierProvider<NovioListNotifier, List<String>>(NovioListNotifier.new);

final brideLinksProvider =
    NotifierProvider<NoviaListNotifier, List<String>>(NoviaListNotifier.new);

class DynamicTextFieldEsposo extends ConsumerWidget {
  const DynamicTextFieldEsposo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: FormInputField(
              controller: controller,
              height: 38,
            ),
          ),
          const SizedBox(width: 8),
          // Botón "+" para agregar campo (solo en el último)

          GestureDetector(
            onTap: () {
              if (controller.text.isNotEmpty) {
                ref.read(groomLinksProvider.notifier).addSong(controller.text);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Icon(Icons.add, color: Colors.black, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class DynamicTextFieldEsposa extends ConsumerWidget {
  const DynamicTextFieldEsposa({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: FormInputField(
              controller: controller,
              height: 38,
            ),
          ),
          const SizedBox(width: 8),
          // Botón "+" para agregar campo (solo en el último)

          GestureDetector(
            onTap: () {
              if (controller.text.isNotEmpty) {
                ref.read(brideLinksProvider.notifier).addSong(controller.text);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Icon(Icons.add, color: Colors.black, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}

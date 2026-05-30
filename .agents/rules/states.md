---
trigger: always_on
---

## 2. Gestión de Estado (Riverpod Generator)

- **PROHIBIDO** usar la sintaxis antigua de Riverpod (ej. `StateProvider`, `StateNotifierProvider`, `ChangeNotifierProvider`).
- **OBLIGATORIO** usar la anotación `@riverpod` (o `@Riverpod(keepAlive: true)` si el estado no debe destruirse).
- Para estados síncronos, extiende de `_$NombreClase` (generado) y usa `Notifier<T>`.
- Para estados asíncronos (peticiones a red, bases de datos), extiende de `_$NombreClase` y usa `AsyncNotifier<T>`.
- Ejemplo de estructura base:

  ```dart
  @riverpod
  class AuthController extends _$AuthController {
    @override
    FutureOr<User?> build() async {
      // Inicialización del estado
      return null;
    }
  ```

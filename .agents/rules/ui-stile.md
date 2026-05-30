---
trigger: always_on
---

## 4. UI y Componentes (Hooks + Riverpod)

- **PROHIBIDO** usar `StatefulWidget` o `StatelessWidget` genéricos si el widget necesita leer el estado global o manejar estado local complejo.
- **OBLIGATORIO** usar `HookConsumerWidget` como clase base para las vistas.
- La firma del método build siempre debe ser: `Widget build(BuildContext context, WidgetRef ref)`.
- Para estado local efímero (controladores de texto, animaciones, toggles simples de UI), usa **Flutter Hooks** (`useState`, `useTextEditingController`, `useEffect`, `useMemoized`) dentro del método `build`.
- Para estado global o lógica de negocio, usa **Riverpod** (`ref.watch`, `ref.read`, `ref.listen`).
- **Regla de Oro en UI:** `ref.watch` se usa para escuchar cambios y reconstruir la UI. `ref.read` se usa ÚNICAMENTE dentro de callbacks (ej. `onPressed`).

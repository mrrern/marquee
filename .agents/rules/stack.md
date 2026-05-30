---
trigger: always_on
---

# Reglas de Desarrollo 

## 1. Contexto del Proyecto y Stack Tecnológico

- **Framework:** Flutter.
- **Gestión de Estado:** Riverpod (específicamente `riverpod_generator` y `riverpod_annotation`).
- **Gestión de UI/Ciclo de vida:** Flutter Hooks (`flutter_hooks` y `hooks_riverpod`).
- **Modelado de Datos:** Freezed (`freezed_annotation`).
- **Manejo de Rutas:** `go_router`.
- **Generación de Código:** `build_runner`.

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

    // Métodos para mutar el estado usando state = ...
  }
  ```

## 3. Modelado de Datos y Estados Complejos (Freezed)

- **SIEMPRE** utiliza `@freezed` para clases de datos, entidades de la base de datos y estados complejos de UI (Uniones/Sealed classes).
- Las clases deben ser inmutables. Usa el método `copyWith` generado por Freezed para actualizar propiedades individuales.
- Si el modelo requiere serialización JSON (ej. respuestas de API), incluye el constructor `factory MyModel.fromJson(Map<String, dynamic> json) => _$MyModelFromJson(json);`.

## 5. Estructura y Limpieza de Código

- Separa estrictamente la lógica de negocio (Notifiers/Riverpod) de la capa de presentación (UI/Widgets). Los widgets solo deben despachar acciones y reaccionar al estado.
- Usa el patrón de "Early Return" y evita la anidación profunda (Callback Hell o Widget Hell). Extrae widgets pequeños en clases o funciones separadas si el árbol crece demasiado.
- Maneja los estados asíncronos (carga, error, éxito) utilizando el patrón de coincidencia de Riverpod `.when()` sobre los objetos `AsyncValue`.

## 6. Testing

- Crea en la carpeta test widgets para testear las funciones importantes de cada una de las funciones primordiales.
- Separa cada test en un archivo distinto para hacer pruebas por separado

## 7. Estructura de Carpetas y Organización de Archivos

- **REGLA ESTRICTA:** Todo el código fuente dentro de `lib/` debe organizarse obligatoriamente bajo la siguiente estructura predefinida. No inventes ni crees directorios raíz nuevos fuera de este estándar.
- **`models/`**: Directorio exclusivo para las clases de datos, entidades y DTOs. Aquí se ubican los modelos construidos con `@freezed` y sus factorías de serialización (`fromJson`). Los archivos generados (`.freezed.dart` y `.g.dart`) deben mantenerse junto a su archivo original en esta carpeta.
- **`logic/`**: Contiene toda la capa de negocio y la comunicación con la base de datos o APIs externas. Aquí se definen los Notifiers (`@riverpod`), repositorios y servicios. **Regla de oro:** La UI nunca interactúa directamente con la base de datos; siempre delega la acción a los controladores ubicados en esta carpeta.
- **`routes/`**: Centraliza la navegación de la aplicación. Incluye la configuración del enrutador, la definición de los paths a las distintas pantallas, la lógica de redirección (guards) y los archivos de barril (exports) para facilitar las importaciones.
- **`themes/`**: Almacena el sistema de diseño y las constantes de la app. El código debe dividirse en archivos separados según su responsabilidad: constantes de colores, configuración del `ThemeData`, tipografías, y un archivo estricto para las constantes de rutas de los assets (imágenes, íconos, animaciones).
- **`widgets/`**: Componentes visuales genéricos y reutilizables (Shared UI). Cualquier elemento de interfaz que se repita en más de una parte de la app (ej. NavBars, CustomTextFields, botones, modales, tarjetas) debe construirse aquí para evitar duplicidad de código.
- **`pages/`**: Las pantallas principales y visibles de la aplicación (Views). Cada archivo aquí representa una ruta completa e independiente. Estas páginas actúan como ensambladoras: utilizan los componentes de `widgets/` y reaccionan al estado global proveído por `logic/`.
- **Nomenclatura de Archivos:** Todos los archivos en Flutter deben ser nombrados usando estrictamente `snake_case` (ej. `auth_logic.dart`, `home_page.dart`, `app_colors.dart`).

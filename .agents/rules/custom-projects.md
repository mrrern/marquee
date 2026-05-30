---
trigger: always_on
---

# Regla de flujo de trabajo

## Importaciones y exportaciones

- **export: ** Centralizaremos los paquetes, widgets, paginas y logica en `routes/exports.dart`
- **import: ** importaremos solo lo que no este en `exports.dart` y todos los paquetes que tenga un warning en exports se borra y se usa como un import directamete

## Estructura de Carpetas y Organización de Archivos

- **REGLA ESTRICTA:** Todo el código fuente dentro de `lib/` debe organizarse obligatoriamente bajo la siguiente estructura predefinida. No inventes ni crees directorios raíz nuevos fuera de este estándar.
- **`models/`**: Directorio exclusivo para las clases de datos, entidades y DTOs. Aquí se ubican los modelos construidos con `@freezed` y sus factorías de serialización (`fromJson`). Los archivos generados (`.freezed.dart` y `.g.dart`) deben mantenerse junto a su archivo original en esta carpeta.
- **`logic/`**: Contiene toda la capa de negocio y la comunicación con la base de datos o APIs externas. Aquí se definen los Notifiers (`@riverpod`), repositorios y servicios. **Regla de oro:** La UI nunca interactúa directamente con la base de datos; siempre delega la acción a los controladores ubicados en esta carpeta.
- **`routes/`**: Centraliza la navegación de la aplicación. Incluye la configuración del enrutador, la definición de los paths a las distintas pantallas, la lógica de redirección (guards) y los archivos de barril (exports) para facilitar las importaciones.
- **`themes/`**: Almacena el sistema de diseño y las constantes de la app. El código debe dividirse en archivos separados según su responsabilidad: constantes de colores, configuración del `ThemeData`, tipografías, y un archivo estricto para las constantes de rutas de los assets (imágenes, íconos, animaciones).
- **`widgets/`**: Componentes visuales genéricos y reutilizables (Shared UI). Cualquier elemento de interfaz que se repita en más de una parte de la app (ej. NavBars, CustomTextFields, botones, modales, tarjetas) debe construirse aquí para evitar duplicidad de código.
- **`pages/`**: Las pantallas principales y visibles de la aplicación (Views). Cada archivo aquí representa una ruta completa e independiente. Estas páginas actúan como ensambladoras: utilizan los componentes de `widgets/` y reaccionan al estado global proveído por `logic/`.
- **Nomenclatura de Archivos:** Todos los archivos en Flutter deben ser nombrados usando estrictamente `snake_case` (ej. `auth_logic.dart`, `home_page.dart`, `app_colors.dart`).

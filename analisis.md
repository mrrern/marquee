# Análisis Integral de la Infraestructura de Base de Datos y Refactorización del Proyecto "Marquee"

Tras realizar una inspección exhaustiva utilizando herramientas de Supabase y analizar en profundidad el código del proyecto Flutter, he consolidado este análisis detallado. Aquí se identifican las discrepancias técnicas de base de datos, los bugs críticos que impiden el funcionamiento de ciertas vistas en la app y las violaciones de estructura de archivos.

---

## 🛑 Problemas e Inconsistencias Detectados

### 1. Seguridad e Infraestructura en la Base de Datos (Supabase)
*   **Row Level Security (RLS) Desactivado:** Las tablas críticas de negocio (`boda`, `music`, `cotizacion`, `notas`, `nota_archivo`, `users_rol`) tienen RLS desactivado. Al conectarse directamente desde el cliente frontend, cualquier usuario o ente anónimo con la clave pública de la API de Supabase podría consultar, insertar, modificar o borrar información sensible.
*   **Redundancia de Credenciales de Autenticación:** La tabla `users` contiene una columna `password`. Dado que las contraseñas y la autenticación son gestionadas nativamente por el esquema interno e inaccesible `auth.users` de Supabase, almacenar un campo de contraseña en una tabla del esquema público es redundante e introduce un grave riesgo de seguridad.
*   **Campos con Nombres No Estándar (CamelCase):** La columna `"isActive"` de la tabla `boda` fuerza el uso de comillas dobles en consultas SQL raw por ser case-sensitive. Lo estándar en PostgreSQL es `snake_case` (`is_active`).
*   **Errores Ortográficos en Columnas (Typos):** La tabla `music` y su vista `musica_por_boda` tienen faltas de ortografía que dificultan el mantenimiento del código:
    *   `music_surpise` (debe ser `music_surprise`)
    *   `forbiden_music` (debe ser `forbidden_music`)
    *   `music_forbiden` (debe ser `music_forbidden`)
    *   `music_coments` (debe ser `music_comments`)
    *   `music_lec_ext` (debe ser `music_lectura_ext` para mayor claridad)
*   **Inconsistencias en Fechas (Timestamps):** Las tablas mezclan columnas de tipo `TIMESTAMP` (sin zona horaria) con `TIMESTAMPTZ` (con zona horaria). Al desplegar la app en producción o cuando los usuarios consultan datos desde diferentes husos horarios, esto genera descoordinación horaria y problemas de sincronización de eventos.
*   **Duplicidad de Tablas de Roles:** Existen las tablas `user_rol` y `users_rol`. Esto denota inconsistencias en migraciones pasadas o esquemas huérfanos.
*   **Ausencia de Triggers Clave:**
    *   **Actualización de Timestamps:** Las tablas tienen un campo `updated_at`, pero no existe ningún trigger de base de datos que se encargue de actualizarlo de manera automática al hacer un `UPDATE`. Toda la actualización depende manualmente del backend/frontend.
    *   **Sincronización de Usuarios:** No existe un trigger en Supabase Auth (`auth.users`) que inserte de manera automática el registro correspondiente en la tabla `public.users` al registrarse un usuario.
*   **Definición de Vistas Incompletas:**
    *   La vista `listar_boda` no incluye la columna `is_active` (guardada en la tabla `boda` como `isActive`). Al deserializar en Flutter, esto hace que el estado de la boda siempre aparezca como `isActive: false`.
    *   La vista `listar_boda` tampoco expone la columna `estado_id`. La UI y los providers en Flutter intentan filtrar por el ID del estado, lo cual genera problemas graves de inconsistencia.

---

## 🐛 Bugs Críticos en el Código Dart (Flutter) que Bloquean Funcionalidades

Al examinar la capa lógica en `lib/logic/`, se han descubierto bugs fundamentales que causan fallos de ejecución en producción:

1.  **Bug de Nombres de Columnas en Actualización de Estado (`boda_logic.dart:L92`):**
    En la función `updateWeddingStatus`, se realiza un `.update` a la tabla `boda` enviando el campo `'estado_boda'`.
    ```dart
    await supabase.from('boda').update({
      'estado_boda': newStatus, // ¡ERROR! La columna en la tabla boda se llama estado_id
      'updated_at': DateTime.now().toIso8601String(),
    }).eq('id', bodaId);
    ```
    *Efecto:* Al intentar cambiar el estado de una cotización o marcar una boda como contratada/completada desde el panel de administración, Supabase responde con un error de columna inexistente, bloqueando la operación.

2.  **Bug de Tipado en Filtrado de Bodas Contratadas (`boda_logic.dart:L242`):**
    En el `contractedWeddingsProvider`, se intentan filtrar las bodas contratadas utilizando:
    ```dart
    final filtered = rows.where((r) {
      final estado = r['estado_boda']; // String ('cotizado', 'enviado', etc.) proveniente de la vista
      return estado == 4; // ¡ERROR! Comparando un String con un int (4)
    }).toList();
    ```
    *Efecto:* La comparación siempre evalúa a `false`, por lo que la lista de "Usuarios Contratados" en el Panel de Administración siempre se muestra vacía, impidiendo que el administrador asigne fichas musicales o complete bodas.

3.  **Desajuste del Nombre del Archivo de Barril:**
    La regla de desarrollo `custom-projects.md` indica explícitamente utilizar `lib/routes/exports.dart` como barril unificado de importaciones. Sin embargo, el proyecto tiene el archivo `lib/routes/linkspaper.dart` implementado, lo que genera desorden en la estandarización.

4.  **Violación de Estructura de Carpetas:**
    Los directorios `lib/controllers/`, `lib/screens/` y `lib/utils/` no cumplen con la estructura estricta predefinida del stack:
    *   `lib/models/` (Clases de datos freezed y factorías JSON)
    *   `lib/logic/` (Negocio, @riverpod generators, repositorios y servicios)
    *   `lib/routes/` (GoRouter y exports.dart)
    *   `lib/themes/` (Sistema de diseño)
    *   `lib/widgets/` (Componentes reutilizables)
    *   `lib/pages/` (Pantallas independientes)

---

## 🛠️ Soluciones Propuestas y Plan de Refactorización

### Fase 1: Consolidación de Base de Datos en Supabase
Implementar una migración SQL en Supabase para recrear un esquema limpio, estandarizado y seguro.
Dado que la base de datos actual cuenta con **0 filas** en todas las tablas, es completamente seguro realizar una migración de reconstrucción:
1.  Eliminar vistas previas con `DROP VIEW ... CASCADE;`.
2.  Eliminar tablas inconsistentes y duplicadas (`user_rol`, `users_rol`, etc.).
3.  Aplicar un esquema optimizado con:
    *   Renombrado de `'isActive'` a `'is_active'`.
    *   Corrección de faltas de ortografía en la tabla `music`.
    *   Eliminación del campo `password` de la tabla `public.users` (delegado nativamente a `auth.users`).
    *   Estandarización de fechas a `TIMESTAMPTZ`.
    *   Triggers PL/pgSQL para actualización automática de `updated_at` y sincronización automática de usuarios desde `auth.users`.
    *   Activación estricta de Row Level Security (RLS) en todas las tablas de negocio, definiendo políticas de acceso para usuarios y administradores.
4.  Recrear las vistas incluyendo `is_active` y `estado_id` en `listar_boda`, y corregir las columnas con typos en `musica_por_boda`.

### Fase 2: Refactorización Estructural del Código Dart (Flutter)
1.  **Reorganización de Archivos:**
    *   Mover todos los modelos y converters de `lib/controllers/` a `lib/models/`.
    *   Mover todos los servicios, controladores y lógica de negocio a `lib/logic/`.
    *   Mover las pantallas de `lib/screens/` a `lib/pages/`.
    *   Renombrar `lib/routes/linkspaper.dart` a `lib/routes/exports.dart` y corregir todas las importaciones.
2.  **Migración de Riverpod a Sintaxis Moderna:**
    *   Convertir todos los proveedores antiguos a sintaxis moderna con generadores Riverpod (`@riverpod` y `@Riverpod(keepAlive: true)`).
3.  **Corrección de Bugs Críticos:**
    *   Actualizar `updateWeddingStatus` en `boda_logic.dart` para mutar `estado_id` (en vez de `estado_boda`).
    *   Actualizar el filtrado de `contractedWeddingsProvider` para comparar numéricamente `r['estado_id'] == 4`.
    *   Corregir las firmas de las propiedades de `BodaMusic` en `music_model.dart` para acoplarse a los campos correctos (eliminando los typos).

---

## 🔍 Funcionalidades Faltantes (README vs Implementación) y Datos Hardcodeados

Tras comparar la base de código actual con las especificaciones técnicas descritas en el archivo `README.md`, se identificaron múltiples características prometidas que **aún no se han desarrollado** y componentes que utilizan datos fijos (hardcodeados) en lugar de conectarse a Supabase.

### 1. Funcionalidades Inexistentes (Por Desarrollar)
*   **Acceso Biométrico Opcional:** El soporte para inicio de sesión con FaceID/TouchID en móvil no está implementado (no existe `local_auth` en el proyecto).
*   **Chat y Mensajería Integrada:** Mencionada en el README como "Comunicación y Coordinación". No existe ninguna pantalla `chat_page.dart` ni modelo en base de datos para intercambiar mensajes.
*   **Calendario Interactivo:** Ausente en la aplicación. Solo existen campos de fecha de boda aislados en las vistas, pero no un calendario interactivo con "hitos del evento".
*   **Previsualizador Interactivo de Marquesinas y Vista 360°:** No existe lógica ni dependencias (como `panorama` o plugins 3D) para la vista 360 ni la previsualización interactiva prometida.

### 2. Elementos Hardcodeados (Sin Conexión a Base de Datos)
*   **Sistema de Feedback y Valoraciones (Reviews):** Las reseñas que se muestran en el carrusel de la página principal (con valoración de estrellas y descripciones de usuarios como "Pablo", "Miriam", etc.) están **totalmente hardcodeadas** en el archivo `lib/themes/const.dart`. Deberían provenir de una tabla `reviews` en Supabase para ser dinámicas.
*   **Tipos de Evento y Paquetes de Servicio:** La selección de paquetes musicales y audiovisuales parece estar estáticamente definida en las listas del UI en lugar de consultar un catálogo en la base de datos (por ejemplo, una tabla `paquetes` o `servicios`).

### Fase 3: Desarrollo de Features Faltantes
Una vez estabilizada la arquitectura y la base de datos (Fases 1 y 2), el proyecto deberá orientarse a construir:
1. Migrar las reseñas hardcodeadas a Supabase (crear tabla `reviews` e implementar su proveedor de lectura).
2. Construir la arquitectura de **Chat en Tiempo Real** usando los WebSockets de Supabase.
3. Integrar **Local Auth** para la autenticación biométrica en dispositivos móviles.
4. Integrar un visor **Panorama 360** o un visualizador de modelos para cumplir con la característica de Marquesinas y Escenarios.

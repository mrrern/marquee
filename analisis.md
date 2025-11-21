# Análisis de la Implementación de Cotizaciones

## Resumen General

La funcionalidad de cotizaciones está dividida en dos conceptos principales: las **solicitudes de cotización** (`CotizacionRequest`) y los **archivos de cotización** (`CotizacionModel`). La implementación actual muestra correctamente la lista de solicitudes a los administradores, pero presenta un error crítico que impide la subida y gestión de los archivos de cotización.

---

## Desglose por Archivo

### 1. Modelos de Datos (`lib/controllers/cotizacion/`)

*   **`CotizacionRequest`**: Modela la información inicial que envía un usuario para solicitar una cotización. Incluye detalles del cliente y del evento.
*   **`CotizacionModel`**: Modela el archivo (PDF) de la cotización una vez que ha sido subido por un administrador o cliente. Contiene IDs y las rutas a dichos archivos.

### 2. Lógica de Negocio (`lib/logic/cotizacion_logic.dart`)

*   **`CotizacionLogic` (Clase)**:
    *   **Responsabilidad 1**: Gestiona la subida de archivos (`uploadFile`) a Supabase y actualiza la tabla `uploaded_files`.
    *   **Responsabilidad 2**: Obtiene la lista de *solicitudes* de cotización (`getAllCotizacionRequests`) desde la vista `bodas_lista`.
*   **`CotizacionRequestPaginationNotifier` (StateNotifier)**:
    *   Utiliza `CotizacionLogic` para obtener las solicitudes.
    *   Maneja el estado de la paginación para la interfaz de usuario del administrador.

### 3. Interfaz de Usuario (`lib/screens/admin_cotizacion.dart`)

*   **`CotizacionPage` (Widget)**:
    *   Muestra una lista paginada y responsiva de las **solicitudes de cotización** (`CotizacionRequest`).
    *   Consume los datos del `cotizacionRequestPaginationProvider`.
    *   **Observación**: Esta pantalla es de solo lectura. No implementa la funcionalidad para que el administrador cargue el archivo PDF de la cotización (la lógica para esto sí existe en `uploadFile`, pero no se invoca desde aquí).

---

## Problemas Detectados y Recomendaciones

### 1. ¡Error Crítico! Mapeo Incorrecto de JSON

*   **Problema**: La función `uploadFile` guarda datos en la base de datos usando `snake_case` (ej. `boda_id`, `file_path_admin`). Sin embargo, el constructor `CotizacionModel.fromJson` espera campos en `camelCase` (ej. `bodaId`, `archivoAdmin`) y el modelo **carece de las anotaciones `@JsonKey`** para realizar la conversión.
*   **Impacto**: **Crítico**. La aplicación fallará al intentar procesar la respuesta de la base de datos después de subir un archivo, resultando en errores de deserialización o datos nulos.
*   **Solución**: Añadir las anotaciones `@JsonKey` al `CotizacionModel` para mapear correctamente los nombres de las columnas de la base de datos a los campos del modelo.

    ```dart
    // En cotizacion_model.dart
    @freezed
    abstract class CotizacionModel with _$CotizacionModel {
      const factory CotizacionModel({
        required int id,
        @JsonKey(name: 'boda_id') required int bodaId,
        @JsonKey(name: 'file_path_admin') String? archivoAdmin,
        @JsonKey(name: 'file_path_user') String? archivoCliente,
        // ... otros campos
      }) = _CotizacionModel;
      // ...
    }
    ```

### 2. Inconsistencia en los Nombres

*   **Problema**: Se utilizan diferentes nombres para conceptos similares a través del código (Modelo: `CotizacionModel`, Tabla DB: `uploaded_files`, Vista DB: `bodas_lista`).
*   **Impacto**: Menor. Reduce la legibilidad y puede causar confusión durante el mantenimiento.
*   **Recomendación**: Estandarizar los nombres para que haya una correspondencia más clara entre el código Dart y la estructura de la base de datos.

### 3. Responsabilidades Mezcladas en `CotizacionLogic`

*   **Problema**: La clase `CotizacionLogic` maneja la lógica tanto para las *solicitudes* como para los *archivos* de cotización.
*   **Impacto**: Menor. Va en contra del Principio de Responsabilidad Única, lo que puede dificultar la escalabilidad y las pruebas.
*   **Recomendación**: Refactorizar `CotizacionLogic` en dos clases separadas, por ejemplo, `CotizacionRequestLogic` y `CotizacionFileLogic`, cada una con su propio enfoque.

---

## Conclusión

La base para la gestión de cotizaciones está implementada, pero es crucial **corregir el error de mapeo en `CotizacionModel`** para que la funcionalidad de subida de archivos sea operativa. Las demás recomendaciones ayudarían a mejorar la calidad y mantenibilidad del código a largo plazo.

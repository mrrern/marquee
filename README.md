# Marquee Audiovisuales 🎥🎉

Plataforma integral para la gestión de servicios de bodas, especializada en la organización de marquesinas, coordinación de eventos y animación personalizada. Facilita la conexión entre clientes y proveedores para crear experiencias únicas.

## 🛠 Tecnologías Principales

| Componente          | Tecnología                                                                 |
|---------------------|----------------------------------------------------------------------------|
| Framework Principal | Flutter 3.13                                                               |
| Gestión de Estado   | Riverpod 2.6                                                               |
| Enrutamiento        | GoRouter 14.8                                                              |
| Backend             | Firebase (Firestore, Auth, Storage)                                        |
| Diseño Interactivo  | Carousel Slider, Animated Dropdowns, Rating Stars                          |
| Comunicación        | HTTP para integraciones, WebView para contenido embebido                   |

## 🌟 Características Clave

### 🔐 Registro y Acceso
- Sistema de roles: Clientes y Administradores
- Autenticación con email y recuperación segura
- Perfiles personalizados con foto de usuario
- Acceso biométrico opcional (soporte móvil)

### 🎉 Gestión de Bodas
- Solicitud de servicios personalizados:
  - Tipo de evento (ceremonia, banquete, after-party)
  - Requerimientos de marquesina y equipos audiovisuales
  - Selección de repertorio musical por momentos clave
- Envío de notas específicas para el administrador
- Sistema de priorización de eventos (cola de bodas)

### 📊 Panel Administrativo
- Vista general de todas las solicitudes
- Gestión de cotizaciones con PDF personalizables
- Subida de archivos técnicos (planos, contratos, presupuestos)
- Mensajería directa integrada con notificaciones en tiempo real
- Estadísticas de usuarios:
  - Eventos por temporada
  - Preferencias de servicios
  - Historial de interacciones

### 💌 Comunicación y Coordinación
- Chat integrado con soporte para archivos adjuntos
- Notificaciones automáticas para actualizaciones de estado
- Calendario interactivo con hitos del evento
- Sistema de feedback post-evento con estrellas valorativas

### 🎨 Interfaz Especializada
- Previsualizador interactivo de marquesinas
- Selector de escenarios audiovisuales con vista 360°
- Dashboard administrativo con métricas clave
- Temas visuales adaptables (colores corporativos #FF6B6B, #4ECDC4, #FFF5E6)
- Componentes UI únicos:
  - Carrusel de portfolios de eventos
  - Selector de paquetes de servicios
  - Editor de cotizaciones en tiempo real

## 🗂 Estructura del Proyecto

```plaintext
lib/
├─ main.dart
├─ app/
│  ├─ routes/              # Configuración de GoRouter (antiguo directorio routes)
│  ├─ themes/              # Configuración de temas (antiguo themes/)
│  └─ widgets/             # Componentes reutilizables globales
├─ features/
│  ├─ auth/                # Autenticación (contiene controllers y logic relacionados)
│  ├─ dashboard/           # Vista administrativa (antiguos controllers/)
│  ├─ event_management/    # Gestión de bodas (antiguo screens/)
│  └─ chat/                # Sistema de mensajería 
├─ core/
│  ├─ providers/           # Riverpod providers (unificado desde logic/)
│  ├─ models/              # Modelos de datos
│  ├─ utils/               # Utilidades compartidas
│  └─ constants/           # Constantes y enumeraciones
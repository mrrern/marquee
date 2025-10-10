# Marquee Audiovisuales 🎥🎉

Plataforma integral para la gestión de servicios de bodas, especializada en la organización de marquesinas, coordinación de eventos y animación personalizada. Facilita la conexión entre clientes y proveedores para crear experiencias únicas.

## 🛠 Tecnologías Principales

| Componente          | Tecnología                                                                 |
|---------------------|----------------------------------------------------------------------------|
| Framework Principal | Flutter 3.13                                                               |
| Backend usado       | Python, Django REST Framework                                              |
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
```

## 📦 Supabase Storage: Flujo de Cotizaciones

Este proyecto utiliza Supabase Storage para gestionar el flujo de cotizaciones:
- Admin sube archivo de cotización.
- Usuario descarga el archivo.
- Usuario sube su versión y sobrescribe la del admin en la misma ruta.

### Bucket y Políticas (ejecutar en el SQL editor de Supabase)

1) Helper de rol admin utilizando tablas `public.users` y `public.users_rol`:

```sql
create or replace function public.is_admin()
returns boolean
language sql
security definer
set search_path = public
as $$
  select exists (
    select 1
    from public.users u
    join public.users_rol r on r.id = u.rol_id
    where u.id = auth.uid()
      and lower(r.nombre) = 'admin'
  );
$$;
```

2) Crear bucket privado `cotizaciones` si no existe:

```sql
insert into storage.buckets (id, name, public)
select 'cotizaciones', 'cotizaciones', false
where not exists (
  select 1 from storage.buckets where id = 'cotizaciones'
);
```

3) Políticas RLS para `storage.objects` (bucket `cotizaciones`):

```sql
do $$ begin
  if not exists (
    select 1 from pg_policies where schemaname = 'storage' and tablename = 'objects' and policyname = 'cotizaciones select for authenticated'
  ) then
    create policy "cotizaciones select for authenticated"
      on storage.objects for select to authenticated
      using ( bucket_id = 'cotizaciones' );
  end if;

  if not exists (
    select 1 from pg_policies where schemaname = 'storage' and tablename = 'objects' and policyname = 'cotizaciones insert admin or owner'
  ) then
    create policy "cotizaciones insert admin or owner"
      on storage.objects for insert to authenticated
      with check (
        bucket_id = 'cotizaciones' and (public.is_admin() or owner_id::uuid = auth.uid())
      );
  end if;

  if not exists (
    select 1 from pg_policies where schemaname = 'storage' and tablename = 'objects' and policyname = 'cotizaciones update admin or owner'
  ) then
    create policy "cotizaciones update admin or owner"
      on storage.objects for update to authenticated
      using ( bucket_id = 'cotizaciones' and (public.is_admin() or owner_id::uuid = auth.uid()) )
      with check ( bucket_id = 'cotizaciones' and (public.is_admin() or owner_id::uuid = auth.uid()) );
  end if;

  if not exists (
    select 1 from pg_policies where schemaname = 'storage' and tablename = 'objects' and policyname = 'cotizaciones delete admin'
  ) then
    create policy "cotizaciones delete admin"
      on storage.objects for delete to authenticated
      using ( bucket_id = 'cotizaciones' and public.is_admin() );
  end if;
end $$ language plpgsql;
```

4) (Opcional) Aplicar las mismas políticas al bucket existente `archives-bodas`:

```sql
do $$ begin
  if not exists (
    select 1 from pg_policies where schemaname = 'storage' and tablename = 'objects' and policyname = 'archives-bodas select for authenticated'
  ) then
    create policy "archives-bodas select for authenticated"
      on storage.objects for select to authenticated
      using ( bucket_id = 'archives-bodas' );
  end if;

  if not exists (
    select 1 from pg_policies where schemaname = 'storage' and tablename = 'objects' and policyname = 'archives-bodas insert admin or owner'
  ) then
    create policy "archives-bodas insert admin or owner"
      on storage.objects for insert to authenticated
      with check (
        bucket_id = 'archives-bodas' and (public.is_admin() or owner_id::uuid = auth.uid())
      );
  end if;

  if not exists (
    select 1 from pg_policies where schemaname = 'storage' and tablename = 'objects' and policyname = 'archives-bodas update admin or owner'
  ) then
    create policy "archives-bodas update admin or owner"
      on storage.objects for update to authenticated
      using ( bucket_id = 'archives-bodas' and (public.is_admin() or owner_id::uuid = auth.uid()) )
      with check ( bucket_id = 'archives-bodas' and (public.is_admin() or owner_id::uuid = auth.uid()) );
  end if;

  if not exists (
    select 1 from pg_policies where schemaname = 'storage' and tablename = 'objects' and policyname = 'archives-bodas delete admin'
  ) then
    create policy "archives-bodas delete admin"
      on storage.objects for delete to authenticated
      using ( bucket_id = 'archives-bodas' and public.is_admin() );
  end if;
end $$ language plpgsql;
```

### Descarga con URLs firmadas y sobrescritura

- La lógica en `lib/logic/cotizacion_logic.dart` sube a `bodas/{bodaId}/cotizacion.{ext}` con `upsert: true`.
- Genera URL firmada por 7 días con `createSignedUrl`. Puedes regenerarla cuando expire:

```dart
final url = await Supabase.instance.client.storage
  .from('cotizaciones')
  .createSignedUrl('bodas/${bodaId}/cotizacion.pdf', 60 * 60 * 24 * 7);
```

Si el bucket `cotizaciones` aún no existe, se usa `archives-bodas` como fallback.

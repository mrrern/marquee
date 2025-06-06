import 'package:bodas/routes/linkspaper.dart';
import 'package:bodas/screens/access_admin_page.dart';

// Configuración de las rutas con go_router
GoRouter createRouter(Ref ref) => GoRouter(
      redirect: (context, state) {
        final userInfo = ref.read(authInfoProvider).value; // USAR ref.read
        final isPublicRoute = {
          '/',
          '/sign',
          '/access',
          '/access-admin',
        }.contains(state.path);

        final isAdminRoute = {
          '/admin',
          '/admin/cotizaciones',
          '/admin/contratados',
          '/admin/notas',
          '/admin/remarketing',
          '/admin/usuarios',
          '/admin/estadisticas',
        }.contains(state.path);

        final isUserRoute = {
          '/contract',
          '/boda',
          '/music',
          '/polities',
          '/cookies',
          '/notes',
          '/notificacion',
        }.contains(state.path);

        // Si no está logueado, solo puede acceder a rutas públicas
        if (userInfo == null) {
          return isPublicRoute ? null : '/access';
        }

        // Si es usuario normal
        if (userInfo.rol == 'Usuario') {
          if (isUserRoute) return null;
          // Si intenta acceder a rutas de admin, redirige a /boda
          if (isAdminRoute) return '/boda';
          // Si intenta acceder a rutas públicas, redirige a /boda
          if (isPublicRoute) return '/boda';
        }

        // Si es admin
        if (userInfo.rol == 'Admin') {
          if (isAdminRoute) return null;
          // Si intenta acceder a rutas de usuario, redirige a /admin
          if (isUserRoute) return '/admin';
          // Si intenta acceder a rutas públicas, redirige a /admin';
          if (isPublicRoute) return '/admin';
        }

        return null;
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => MainScreen(),
        ),
        GoRoute(
          path: '/access',
          builder: (context, state) => AccessScreenResponsive(),
        ),
        GoRoute(
          path: '/sign',
          builder: (context, state) => SignPage(),
        ),
        GoRoute(
          path: '/contract',
          name: 'contract', // Asegúrate de tener nombres
          builder: (context, state) => ContratoScreen(),
        ),
        GoRoute(
          path: '/boda',
          name: 'boda', // Asegúrate de tener nombres
          builder: (context, state) => WeddingRegistrationScreen(),
        ),
        GoRoute(
          path: '/music',
          name: 'music', // Asegúrate de tener nombres
          builder: (context, state) => MusicFormScreen(),
        ),
        GoRoute(
          path: '/polities',
          name: 'polities', // Asegúrate de tener nombres
          builder: (context, state) => PrivacyPage(),
        ),
        GoRoute(
          path: '/cookies',
          name: 'cookies', // Asegúrate de tener nombres
          builder: (context, state) => CookiesPage(),
        ),
        GoRoute(
          path: '/notes',
          name: 'notes', // Asegúrate de tener nombres
          builder: (context, state) => NotesScreen(),
        ),
        GoRoute(
          path: '/notificacion',
          name: 'notificacion', // Asegúrate de tener nombres
          builder: (context, state) => NotificationScreen(),
        ),
        // Admin dashboard routes
        GoRoute(
          path: '/access-admin',
          builder: (context, state) => AccessAdminPage(),
        ),
        GoRoute(
          path: '/admin',
          name: 'admindashboard', // Asegúrate de tener nombres
          builder: (context, state) => MarqueeAdminDashboard(),
        ),
        GoRoute(
          path: '/admin/cotizaciones',
          name: 'cotizaciones', // Asegúrate de tener nombres
          builder: (context, state) => const QuotationRequestScreen(),
        ),
        GoRoute(
          path: '/admin/contratados',
          name: 'contratados', // Asegúrate de tener nombres
          builder: (context, state) =>
              const Placeholder(), // Replace with actual screen
        ),
        GoRoute(
          path: '/admin/notas',
          name: 'notas', // Asegúrate de tener nombres
          builder: (context, state) =>
              const NotesScreen(), // Replace with actual screen
        ),
        GoRoute(
          path: '/admin/remarketing',
          name: 'remarketing', // Asegúrate de tener nombres
          builder: (context, state) =>
              const RemarketingScreen(), // Replace with actual screen
        ),
        GoRoute(
          path: '/admin/usuarios',
          name: 'usuarios', // Asegúrate de tener nombres
          builder: (context, state) =>
              const Placeholder(), // Replace with actual screen
        ),
        GoRoute(
          path: '/admin/estadisticas',
          name: 'estadisticas', // Asegúrate de tener nombres
          builder: (context, state) =>
              const Placeholder(), // Replace with actual screen
        ),
      ],
      initialLocation: '/',
    );

final routerProvider = Provider((ref) => createRouter(ref));

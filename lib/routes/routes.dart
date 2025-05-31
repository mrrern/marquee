import 'package:bodas/routes/linkspaper.dart';
import 'package:bodas/screens/access_admin_page.dart';

// Configuración de las rutas con go_router
GoRouter createRouter(Ref ref) => GoRouter(
      redirect: (context, state) {
        final user = ref.watch(authProvider).value;
        final isPublicRoute = {
          '/sign',
          '/access',
          'access-admin',
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
        

        if (user == null && isPublicRoute) {
          return isPublicRoute ? state.path : '/access';
        }
        if (user != null && isAdminRoute) {
          return isAdminRoute ? state.path : '/admin';
        }
        if (user != null && isUserRoute) {
          return isUserRoute ? state.path : '/boda';
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
          builder: (context, state) => ContratoScreen(),
        ),
        GoRoute(
          path: '/boda',
          builder: (context, state) => WeddingRegistrationScreen(),
        ),
        GoRoute(
          path: '/music',
          builder: (context, state) => MusicFormScreen(),
        ),
        GoRoute(
          path: '/polities',
          builder: (context, state) => PrivacyPage(),
        ),
        GoRoute(
          path: '/cookies',
          builder: (context, state) => CookiesPage(),
        ),
        GoRoute(
          path: '/notes',
          builder: (context, state) => NotesScreen(),
        ),
        GoRoute(
          path: '/notificacion',
          builder: (context, state) => NotificationScreen(),
        ),

        // Admin dashboard routes
        GoRoute(
          path: 'access-admin',
          builder: (context, state) => AccessAdminPage(),
        ),
        GoRoute(
          path: '/admin',
          builder: (context, state) => MarqueeAdminDashboard(),
        ),
        GoRoute(
          path: '/admin/cotizaciones',
          builder: (context, state) => const QuotationRequestScreen(),
        ),
        GoRoute(
          path: '/admin/contratados',
          builder: (context, state) =>
              const Placeholder(), // Replace with actual screen
        ),
        GoRoute(
          path: '/admin/notas',
          builder: (context, state) =>
              const NotesScreen(), // Replace with actual screen
        ),
        GoRoute(
          path: '/admin/remarketing',
          builder: (context, state) =>
              const RemarketingScreen(), // Replace with actual screen
        ),
        GoRoute(
          path: '/admin/usuarios',
          builder: (context, state) =>
              const Placeholder(), // Replace with actual screen
        ),
        GoRoute(
          path: '/admin/estadisticas',
          builder: (context, state) =>
              const Placeholder(), // Replace with actual screen
        ),
      ],
      initialLocation: '/',
    );

final routerProvider = Provider((ref) => createRouter(ref));

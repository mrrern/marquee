import 'package:bodas/routes/linkspaper.dart';

// Configuración de las rutas con go_router
GoRouter createRouter(Ref ref) => GoRouter(
      redirect: (context, state) {
        final user = ref.watch(authProvider).value;
        final isPublicRoute = state.path == "/" ||
            state.path == "/access" ||
            state.path == "/sign";

        if (user == null && isPublicRoute) {
          return isPublicRoute ? state.path : '/access';
        }
        if (user != null && !isPublicRoute) {
          return '/access';
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

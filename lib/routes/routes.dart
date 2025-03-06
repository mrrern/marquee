import 'package:bodas/routes/linkspaper.dart';


// Configuración de las rutas con go_router
final GoRouter router = GoRouter(
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
      path: '/form1',
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
      builder: (context, state) => const Placeholder(), // Replace with actual screen
    ),
    GoRoute(
      path: '/admin/notas',
      builder: (context, state) => const Placeholder(), // Replace with actual screen
    ),
    GoRoute(
      path: '/admin/remarketing',
      builder: (context, state) => const Placeholder(), // Replace with actual screen
    ),
    GoRoute(
      path: '/admin/usuarios',
      builder: (context, state) => const Placeholder(), // Replace with actual screen
    ),
    GoRoute(
      path: '/admin/estadisticas',
      builder: (context, state) => const Placeholder(), // Replace with actual screen
    ),
  ],
);
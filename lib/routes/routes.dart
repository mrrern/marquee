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
  ],
);

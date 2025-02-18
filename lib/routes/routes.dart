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
        builder: (context, state) => AccessPage(),
      ),
      GoRoute(
        path: '/sign',
        builder: (context, state) => SignPage(),
      ),

    ],
  );

  
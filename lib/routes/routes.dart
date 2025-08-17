import 'dart:async';

import 'package:bodas/routes/linkspaper.dart';

// Provider para el router que depende del estado de autenticación

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    refreshListenable:
        GoRouterRefreshStream(ref.watch(authInfoProvider.notifier).stream),
    redirect: (context, state) {
      final authState = ref.read(authInfoProvider);
      final userInfo = authState.value;
      final isLoading = authState.isLoading;

      // Si está cargando, mantener en la ruta actual
      if (isLoading) return null;

      final currentPath = state.fullPath;

      // Rutas públicas (accesibles sin autenticación)
      final publicRoutes = {
        '/',
        '/sign',
        '/access',
        '/access-admin',
      };

      // Rutas de administrador
      final adminRoutes = {
        '/admin',
        '/admin/cotizaciones',
        '/admin/contratados',
        '/admin/notas',
        '/admin/remarketing',
        '/admin/usuarios',
        '/admin/estadisticas',
      };

      // Rutas de usuario normal
      final userRoutes = {
        '/contract',
        '/boda',
        '/music',
        '/polities',
        '/cookies',
        '/notes',
        '/notificacion',
      };

      // Si no hay usuario (no está logueado)
      if (userInfo == null) {
        // Solo puede acceder a rutas públicas
        if (publicRoutes.contains(currentPath)) {
          return null; // Permitir acceso
        }
        // Si intenta acceder a cualquier otra ruta, redirigir a home
        return '/';
      }

      // Si el usuario está logueado
      if (userInfo.rol == 'Usuario') {
        // Si está en una ruta de usuario, permitir
        if (userRoutes.contains(currentPath)) {
          return null;
        }
        // Si intenta acceder a rutas de admin, redirigir a /boda
        if (adminRoutes.contains(currentPath)) {
          return '/boda';
        }
        // Si está en rutas públicas, redirigir a /boda
        if (publicRoutes.contains(currentPath)) {
          return '/boda';
        }
      }

      // Si es administrador
      if (userInfo.rol == 'Administrador') {
        // Si está en una ruta de admin, permitir
        if (adminRoutes.contains(currentPath)) {
          return null;
        }
        // Si intenta acceder a rutas de usuario, redirigir a /admin
        if (userRoutes.contains(currentPath)) {
          return '/admin';
        }
        // Si está en rutas públicas, redirigir a /admin
        if (publicRoutes.contains(currentPath)) {
          return '/admin';
        }
      }

      // Por defecto, no redirigir
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
        name: 'contract',
        builder: (context, state) => ContratoScreen(),
      ),
      GoRoute(
        path: '/boda',
        name: 'boda',
        builder: (context, state) => WeddingRegistrationScreen(),
      ),
      GoRoute(
        path: '/music',
        name: 'music',
        builder: (context, state) => MusicFormScreen(),
      ),
      GoRoute(
        path: '/polities',
        name: 'polities',
        builder: (context, state) => PrivacyPage(),
      ),
      GoRoute(
        path: '/cookies',
        name: 'cookies',
        builder: (context, state) => CookiesPage(),
      ),
      GoRoute(
        path: '/notes',
        name: 'notes',
        builder: (context, state) => NotesScreen(),
      ),
      GoRoute(
        path: '/notificacion',
        name: 'notificacion',
        builder: (context, state) => NotificationScreen(),
      ),
      // Admin routes
      GoRoute(
        path: '/access-admin',
        builder: (context, state) => AccessAdminPage(),
      ),
      GoRoute(
        path: '/admin',
        name: 'admindashboard',
        builder: (context, state) => MarqueeAdminDashboard(),
      ),
      GoRoute(
        path: '/admin/cotizaciones',
        name: 'cotizaciones',
        builder: (context, state) => const QuotationRequestScreen(),
      ),
      GoRoute(
        path: '/admin/contratados',
        name: 'contratados',
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: '/admin/notas',
        name: 'notas',
        builder: (context, state) => const NotesScreen(),
      ),
      GoRoute(
        path: '/admin/remarketing',
        name: 'remarketing',
        builder: (context, state) => const RemarketingPage(),
      ),
      GoRoute(
        path: '/admin/usuarios',
        name: 'usuarios',
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: '/admin/estadisticas',
        name: 'estadisticas',
        builder: (context, state) => const Placeholder(),
      ),
    ],
    initialLocation: '/',
  );
});

// Helper class para manejar la actualización del router
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<AsyncValue> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (AsyncValue value) {
        notifyListeners();
      },
    );
  }

  late final StreamSubscription<AsyncValue> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

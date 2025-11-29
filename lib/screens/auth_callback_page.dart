import 'package:bodas/routes/linkspaper.dart';

class AuthCallbackScreen extends ConsumerStatefulWidget {
  const AuthCallbackScreen({super.key});

  @override
  ConsumerState<AuthCallbackScreen> createState() => _AuthCallbackScreenState();
}

class _AuthCallbackScreenState extends ConsumerState<AuthCallbackScreen> {
  @override
  void initState() {
    super.initState();
    _handleCallback();
  }

  Future<void> _handleCallback() async {
    try {
      // Obtener el email de los query parameters
      final uri = Uri.base;
      final email = uri.queryParameters['email'] ?? '';

      // Obtener el token del hash fragment
      // Supabase usa formato: #access_token=xxx&type=recovery&...
      final fragment = uri.fragment;
      final fragmentParams = Uri.splitQueryString(fragment);
      final token = fragmentParams['access_token'] ?? '';
      final type = fragmentParams['type'] ?? '';

      if (email.isEmpty || token.isEmpty) {
        throw Exception('Email o token faltante en la URL');
      }

      if (type != 'recovery') {
        throw Exception('Tipo de token inválido');
      }

      // Esperar un momento antes de redirigir
      await Future.delayed(const Duration(milliseconds: 500));

      if (!mounted) return;

      // Redirigir a la página de reset password con los parámetros
      context.go(
          '/reset-password/${Uri.encodeComponent(email)}/${Uri.encodeComponent(token)}');
    } catch (e) {
      debugPrint('Error en callback de auth: $e');

      if (!mounted) return;

      // Mostrar error y redirigir al login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString().replaceAll('Exception: ', '')}'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 4),
        ),
      );

      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;
      context.go('/access');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(
              'Procesando solicitud...',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

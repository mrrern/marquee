import 'package:bodas/routes/linkspaper.dart';

class ForgotPasswordForm extends ConsumerWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    final email = ref.watch(forgotPasswordEmailProvider);
    final emailError = ref.watch(forgotPasswordEmailErrorProvider);
    final isFormValid = ref.watch(isForgotPasswordFormValidProvider);

    return Container(
      width: Responsive.isWeb(context) ? 469 : width * 0.85,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isWeb(context) ? 46 : 30,
        vertical: Responsive.isWeb(context) ? 22 : 20,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFECECEC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 15,
            offset: Offset(0, 40),
            spreadRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo
          Center(
            child: Image.asset(
              logo,
              width: 309,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: Responsive.isWeb(context) ? 30 : 20),

          // Instructions
          Center(
            child: Text(
              'Recupera tu contraseña',
              style: GoogleFonts.inter(
                fontSize: Responsive.isWeb(context) ? 24 : 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),

          SizedBox(height: 10),

          Center(
            child: Text(
              'Ingresa tu email y te enviaremos un enlace\npara restablecer tu contraseña',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: Responsive.isWeb(context) ? 14 : 12,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ),

          // Email Field
          SizedBox(height: Responsive.isWeb(context) ? 51 : 40),
          Text(
            'E-mail',
            style: GoogleFonts.inter(
              fontSize: Responsive.isWeb(context) ? 20 : 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            onChanged: (value) =>
                ref.read(forgotPasswordEmailProvider.notifier).state = value,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              errorText: null,
              errorStyle: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.red,
              ),
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.black87,
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            onSubmitted: isFormValid
                ? (_) {
                    _handleForgotPassword(ref, context);
                  }
                : null,
          ),

          // Only show the error if there is one and the field has been touched
          if (emailError != null && email.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Text(
                emailError,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
            ),
          Container(
            height: 2,
            width: Responsive.isWeb(context) ? 377 : width * 0.7,
            color: emailError != null && email.isNotEmpty
                ? Colors.red
                : Colors.black,
          ),

          // Send Button
          SizedBox(height: Responsive.isWeb(context) ? 36 : 30),
          Center(
            child: InkWell(
              onTap: isFormValid
                  ? () => _handleForgotPassword(ref, context)
                  : null,
              child: Container(
                width: 189,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isFormValid
                      ? const Color.fromRGBO(2, 0, 0, 0.58)
                      : const Color.fromRGBO(2, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Enviar',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Back to Login Link
          SizedBox(height: 9),
          Center(
            child: InkWell(
              onTap: () {
                context.go('/access');
              },
              child: Text(
                'Volver al inicio de sesión',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _handleForgotPassword(WidgetRef ref, BuildContext context) async {
  final email = ref.read(forgotPasswordEmailProvider);

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(child: CircularProgressIndicator()),
  );

  bool dialogClosed = false;

  try {
    await ref.read(authServiceProvider).requestPasswordReset(email);

    if (!context.mounted) return;

    if (context.mounted && !dialogClosed) {
      context.pop(); // Remove loading dialog
      dialogClosed = true;
    }

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Se ha enviado un correo de recuperación. Revisa tu bandeja de entrada.'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 5),
        ),
      );

      // Clear the form
      ref.read(forgotPasswordEmailProvider.notifier).state = '';
    }
  } catch (e) {
    if (context.mounted && !dialogClosed) {
      context.pop(); // Remove loading dialog
      dialogClosed = true;
    }

    if (context.mounted) {
      debugPrint(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceAll('Exception: ', '')),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }
}

// Providers for forgot password form
final forgotPasswordEmailProvider = StateProvider<String>((ref) => '');

final forgotPasswordEmailErrorProvider = Provider<String?>((ref) {
  final email = ref.watch(forgotPasswordEmailProvider);
  if (email.isEmpty) return null;

  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(email)) {
    return 'Email inválido';
  }
  return null;
});

final isForgotPasswordFormValidProvider = Provider<bool>((ref) {
  final email = ref.watch(forgotPasswordEmailProvider);
  final emailError = ref.watch(forgotPasswordEmailErrorProvider);

  return email.isNotEmpty && emailError == null;
});

import 'package:bodas/routes/linkspaper.dart';

class ResetPasswordForm extends ConsumerWidget {
  final String email;
  final String token;

  const ResetPasswordForm({
    super.key,
    required this.email,
    required this.token,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    final newPassword = ref.watch(newPasswordProvider);
    final confirmPassword = ref.watch(confirmPasswordProvider);
    final isNewPasswordVisible = ref.watch(isNewPasswordVisibleProvider);
    final isConfirmPasswordVisible =
        ref.watch(isConfirmPasswordVisibleProvider);

    final newPasswordError = ref.watch(newPasswordErrorProvider);
    final confirmPasswordError = ref.watch(confirmPasswordErrorProvider);
    final isFormValid = ref.watch(isResetPasswordFormValidProvider);

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
              'Restablecer contraseña',
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
              'Ingresa tu nueva contraseña',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: Responsive.isWeb(context) ? 14 : 12,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ),

          // New Password Field
          SizedBox(height: Responsive.isWeb(context) ? 51 : 40),
          Text(
            'Nueva Contraseña',
            style: GoogleFonts.inter(
              fontSize: Responsive.isWeb(context) ? 20 : 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            onChanged: (value) =>
                ref.read(newPasswordProvider.notifier).state = value,
            obscureText: !isNewPasswordVisible,
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
              suffixIcon: IconButton(
                icon: Icon(
                  isNewPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  ref.read(isNewPasswordVisibleProvider.notifier).state =
                      !isNewPasswordVisible;
                },
              ),
            ),
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.black87,
            ),
            textInputAction: TextInputAction.next,
          ),

          if (newPasswordError != null && newPassword.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Text(
                newPasswordError,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
            ),
          Container(
            height: 2,
            width: Responsive.isWeb(context) ? 377 : width * 0.7,
            color: newPasswordError != null && newPassword.isNotEmpty
                ? Colors.red
                : Colors.black,
          ),

          // Confirm Password Field
          SizedBox(height: Responsive.isWeb(context) ? 50 : 40),
          Text(
            'Confirmar Contraseña',
            style: GoogleFonts.inter(
              fontSize: Responsive.isWeb(context) ? 20 : 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            onChanged: (value) =>
                ref.read(confirmPasswordProvider.notifier).state = value,
            obscureText: !isConfirmPasswordVisible,
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
              suffixIcon: IconButton(
                icon: Icon(
                  isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  ref.read(isConfirmPasswordVisibleProvider.notifier).state =
                      !isConfirmPasswordVisible;
                },
              ),
            ),
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.black87,
            ),
            textInputAction: TextInputAction.done,
            onSubmitted: isFormValid
                ? (_) {
                    _handleResetPassword(ref, context, email, token);
                  }
                : null,
          ),

          if (confirmPasswordError != null && confirmPassword.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Text(
                confirmPasswordError,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
            ),
          Container(
            height: 2,
            width: Responsive.isWeb(context) ? 374 : width * 0.7,
            color: confirmPasswordError != null && confirmPassword.isNotEmpty
                ? Colors.red
                : Colors.black,
          ),

          // Reset Button
          SizedBox(height: Responsive.isWeb(context) ? 36 : 30),
          Center(
            child: InkWell(
              onTap: isFormValid
                  ? () => _handleResetPassword(ref, context, email, token)
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
                    'Cambiar',
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

          SizedBox(height: 9),
        ],
      ),
    );
  }
}

Future<void> _handleResetPassword(
  WidgetRef ref,
  BuildContext context,
  String email,
  String token,
) async {
  final newPassword = ref.read(newPasswordProvider);

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(child: CircularProgressIndicator()),
  );

  bool dialogClosed = false;

  try {
    await ref.read(authServiceProvider).resetPasswordWithToken(
          email: email,
          token: token,
          newPassword: newPassword,
        );

    if (!context.mounted) return;

    if (context.mounted && !dialogClosed) {
      context.pop(); // Remove loading dialog
      dialogClosed = true;
    }

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Contraseña actualizada exitosamente'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );

      // Clear the form
      ref.read(newPasswordProvider.notifier).state = '';
      ref.read(confirmPasswordProvider.notifier).state = '';

      // Redirect to login after a short delay
      Future.delayed(const Duration(seconds: 1), () {
        if (context.mounted) {
          context.go('/access');
        }
      });
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

// Providers for reset password form
final newPasswordProvider = StateProvider<String>((ref) => '');
final confirmPasswordProvider = StateProvider<String>((ref) => '');
final isNewPasswordVisibleProvider = StateProvider<bool>((ref) => false);
final isConfirmPasswordVisibleProvider = StateProvider<bool>((ref) => false);

final newPasswordErrorProvider = Provider<String?>((ref) {
  final password = ref.watch(newPasswordProvider);
  if (password.isEmpty) return null;

  if (password.length < 6) {
    return 'La contraseña debe tener al menos 6 caracteres';
  }
  return null;
});

final confirmPasswordErrorProvider = Provider<String?>((ref) {
  final newPassword = ref.watch(newPasswordProvider);
  final confirmPassword = ref.watch(confirmPasswordProvider);

  if (confirmPassword.isEmpty) return null;

  if (newPassword != confirmPassword) {
    return 'Las contraseñas no coinciden';
  }
  return null;
});

final isResetPasswordFormValidProvider = Provider<bool>((ref) {
  final newPassword = ref.watch(newPasswordProvider);
  final confirmPassword = ref.watch(confirmPasswordProvider);
  final newPasswordError = ref.watch(newPasswordErrorProvider);
  final confirmPasswordError = ref.watch(confirmPasswordErrorProvider);

  return newPassword.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      newPasswordError == null &&
      confirmPasswordError == null;
});

import 'package:bodas/routes/linkspaper.dart';

class LoginAdminForm extends ConsumerWidget {
  const LoginAdminForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final isPasswordVisible = ref.watch(isPasswordVisibleProvider);

    final emailError = ref.watch(emailErrorProvider);
    final passwordError = ref.watch(passwordErrorProvider);
    final isFormValid = ref.watch(isFormValidLoginProvider);

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
                ref.read(emailProvider.notifier).state = value,
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
            textInputAction: TextInputAction.next,
            onSubmitted: isFormValid
                ? (_) {
                    _handleLogin(ref, context);
                  }
                : null,
          ),

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

          // Password Field
          SizedBox(height: Responsive.isWeb(context) ? 50 : 40),
          Text(
            'Contraseña',
            style: GoogleFonts.inter(
              fontSize: Responsive.isWeb(context) ? 20 : 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            onChanged: (value) =>
                ref.read(passwordProvider.notifier).state = value,
            obscureText: !isPasswordVisible,
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
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  ref.read(isPasswordVisibleProvider.notifier).state =
                      !isPasswordVisible;
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
                    _handleLogin(ref, context);
                  }
                : null,
          ),
          if (passwordError != null && password.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Text(
                passwordError,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
            ),
          Container(
            height: 2,
            width: Responsive.isWeb(context) ? 374 : width * 0.7,
            color: passwordError != null && password.isNotEmpty
                ? Colors.red
                : Colors.black,
          ),

          // Login Button
          SizedBox(height: Responsive.isWeb(context) ? 36 : 30),
          Center(
            child: InkWell(
              onTap: isFormValid ? () => _handleLogin(ref, context) : null,
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
                    'Acceso Admin',
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
        ],
      ),
    );
  }
}

Future<void> _handleLogin(WidgetRef ref, BuildContext context) async {
  final email = ref.read(emailProvider);
  final password = ref.read(passwordProvider);

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(child: CircularProgressIndicator()),
  );

  try {
    await ref.read(authServiceProvider).signInWithInfo(email, password);
    context.pop(); // Remove loading dialog

    final user = ref.read(authInfoProvider).value;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error: No se pudo obtener la información del usuario'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 4),
        ),
      );
      return;
    }

    if (user.rol == 'Administrador') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Exitoso'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 4),
        ),
      );
      context.pushNamed('/admin');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No tienes permisos de administrador'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 4),
        ),
      );
    }
  } catch (e) {
    context.pop(); // Remove loading dialog
    print('Login error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error al iniciar sesión: ${e.toString()}'),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4),
      ),
    );
  }
}

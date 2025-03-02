import 'package:bodas/routes/linkspaper.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final isPasswordVisible = ref.watch(isPasswordVisibleProvider);

    final emailError = ref.watch(emailErrorProvider);
    final passwordError = ref.watch(passwordErrorProvider);
    final isFormValid = ref.watch(isFormValidProvider);

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
              errorText: emailError,
              errorStyle: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.red,
              ),
              // Hide the error container to maintain design
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.black87,
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
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
              errorText: null, // Hide default error to maintain design
              errorStyle: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.red,
              ),
              // Hide the error container to maintain design
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
                    // Handle login when Enter is pressed and form is valid
                    _handleLogin(ref, context);
                  }
                : null,
          ),
          // Only show the error if there is one and the field has been touched
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
                      : const Color.fromRGBO(
                          2, 0, 0, 0.3), // Lighter color when disabled
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Acceso',
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

          // Forgot Password Link
          SizedBox(height: 9),
          Center(
            child: InkWell(
              onTap: () {
                // Handle forgot password logic
              },
              child: Text(
                'Olvidaste tu contraseña?',
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

  void _handleLogin(WidgetRef ref, BuildContext context) {
    final email = ref.read(emailProvider);
    final password = ref.read(passwordProvider);

    // Here you would implement your authentication logic
    print('Login attempt with: $email');
    print('Login attempt with: $password');

    // Example of showing a loading indicator and handling success/failure
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    
    );

    // Simulate authentication delay
    Future.delayed(const Duration(seconds: 2), () {
      context.pop(); // Close loading dialog

      // Here you would check if authentication was successful
      // For now, we'll just show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Inicio de sesión exitoso'),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate to home or dashboard
      // context.go('/dashboard');
    });
  }
}

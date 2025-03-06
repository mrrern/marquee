import 'package:bodas/routes/linkspaper.dart';

class RegistroForm extends ConsumerWidget {
  const RegistroForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
  

    // Get form field values
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final confirmPassword = ref.watch(confirmPasswordProvider);
    final isPasswordVisible = ref.watch(isPasswordVisibleProvider);
    final isPasswordConfirmVisible =
        ref.watch(isPasswordConfirmVisibleProvider);

    // Error Field
    final emailError = ref.watch(emailErrorProvider);
    final passwordError = ref.watch(passwordErrorProvider);
    final confirmPasswordError = ref.watch(passwordConfirmErrorProvider);
    final isFormValid = ref.watch(isFormValidProvider);

    return Container(
      width: 469,
      padding: const EdgeInsets.fromLTRB(45, 22, 45, 30),
      decoration: BoxDecoration(
        color: const Color(0xFFECECEC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 19,
            offset: Offset(0, 45),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo centered
          Center(
            child: Image.asset(
              logo,
              width: Responsive.isWeb(context) ? 200 : 180,
              fit: BoxFit.contain,
            ),
          ),

          // Email Field
          SizedBox(height: Responsive.isWeb(context) ? 30 : 20),
          Text(
            'E-mail',
            style: GoogleFonts.inter(
              fontSize: Responsive.isWeb(context) ? 20 : 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

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
            height: 1,
            width: Responsive.isWeb(context) ? 377 : width * 0.7,
            color: emailError != null && email.isNotEmpty
                ? Colors.red
                : Colors.black,
          ),

          // Password Field
          SizedBox(height: Responsive.isWeb(context) ? 30 : 20),
          Text(
            'Contraseña',
            style: GoogleFonts.inter(
              fontSize: Responsive.isWeb(context) ? 20 : 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
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
                    _handleRegister(ref, context);
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
            height: 1,
            width: Responsive.isWeb(context) ? 374 : width * 0.7,
            color: passwordError != null && password.isNotEmpty
                ? Colors.red
                : Colors.black,
          ),

          // Confirm password field
          SizedBox(height: Responsive.isWeb(context) ? 30 : 20),
          Text(
            'Confirme su Contraseña',
            style: GoogleFonts.inter(
              fontSize: Responsive.isWeb(context) ? 20 : 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          TextField(
            onChanged: (value) =>
                ref.read(confirmPasswordProvider.notifier).state = value,
            obscureText: !isPasswordConfirmVisible,
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
                  isPasswordConfirmVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  ref.read(isPasswordConfirmVisibleProvider.notifier).state =
                      !isPasswordConfirmVisible;
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
                    // Handle Register when Enter is pressed and form is valid
                    _handleRegister(ref, context);
                  }
                : null,
          ),
          // Only show the error if there is one and the field has been touched
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
            height: 1,
            width: Responsive.isWeb(context) ? 374 : width * 0.7,
            color: confirmPasswordError != null && confirmPassword.isNotEmpty
                ? Colors.red
                : Colors.black,
          ),
          const SizedBox(height: 26),

          // Register button
          SizedBox(height: Responsive.isWeb(context) ? 14 : 8),
          Center(
            child: InkWell(
              onTap: isFormValid ? () => _handleRegister(ref, context) : null,
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
                    'Registrarse',
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

// Hidden text field widget for custom styling
class HiddenTextField extends ConsumerWidget {
  final String hint;
  final StateProvider<String> provider;
  final bool obscureText;

  const HiddenTextField({
    super.key,
    required this.hint,
    required this.provider,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF2A2A2A).withValues(alpha: 0.5),
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
      ),
      style: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF2A2A2A),
      ),
      onChanged: (value) => ref.read(provider.notifier).state = value,
    );
  }
}

void _handleRegister(WidgetRef ref, BuildContext context) {
  final email = ref.read(emailProvider);
  final password = ref.read(passwordProvider);
  final confirmPassword = ref.read(confirmPasswordProvider);

  // Here you would implement your authentication logic
  print('Login attempt with: $email');
  print('Login attempt with: $password');
  print('Login attempt with: $confirmPassword');

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
        content: Text('Registro de sesión exitoso'),
        backgroundColor: Colors.green,
      ),
    );

    // Navigate to home or dashboard
    // context.go('/dashboard');
  });

  context.go('/form1');
}

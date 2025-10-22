import 'package:bodas/routes/linkspaper.dart';

class RegistroForm extends ConsumerWidget {
  const RegistroForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    // Get form field values
    final name = ref.watch(nameProvider);
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final confirmPassword = ref.watch(confirmPasswordProvider);
    final isPasswordVisible = ref.watch(isPasswordVisibleProvider);
    final isPasswordConfirmVisible =
        ref.watch(isPasswordConfirmVisibleProvider);

    // Error Field
    final nameError = ref.watch(nameErrorProvider);
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

          // Name Field
          SizedBox(height: Responsive.isWeb(context) ? 20 : 15),
          Text(
            'Nombre',
            style: GoogleFonts.inter(
              fontSize: Responsive.isWeb(context) ? 16 : 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          TextField(
            onChanged: (value) => ref.read(nameProvider.notifier).state = value,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              errorText: null,
              errorStyle: GoogleFonts.inter(
                fontSize: 10,
                color: Colors.red,
              ),
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.black87,
            ),
            textInputAction: TextInputAction.next,
          ),

          if (nameError != null && name.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 2),
              child: Text(
                nameError,
                style: GoogleFonts.inter(
                  fontSize: 9,
                  color: Colors.red,
                ),
              ),
            ),
          Container(
            height: 1,
            width: Responsive.isWeb(context) ? 377 : width * 0.7,
            color: nameError != null && name.isNotEmpty
                ? Colors.red
                : Colors.black,
          ),

          // Email Field
          SizedBox(height: Responsive.isWeb(context) ? 20 : 15),
          Text(
            'E-mail',
            style: GoogleFonts.inter(
              fontSize: Responsive.isWeb(context) ? 16 : 14,
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
              errorText: null,
              errorStyle: GoogleFonts.inter(
                fontSize: 10,
                color: Colors.red,
              ),
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.black87,
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),

          if (emailError != null && email.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 2),
              child: Text(
                emailError,
                style: GoogleFonts.inter(
                  fontSize: 9,
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
          SizedBox(height: Responsive.isWeb(context) ? 20 : 15),
          Text(
            'Contraseña',
            style: GoogleFonts.inter(
              fontSize: Responsive.isWeb(context) ? 16 : 14,
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
              errorText: null,
              errorStyle: GoogleFonts.inter(
                fontSize: 10,
                color: Colors.red,
              ),
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                  size: 20,
                ),
                onPressed: () {
                  ref.read(isPasswordVisibleProvider.notifier).state =
                      !isPasswordVisible;
                },
              ),
            ),
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.black87,
            ),
            textInputAction: TextInputAction.next,
          ),

          if (passwordError != null && password.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 2),
              child: Text(
                passwordError,
                style: GoogleFonts.inter(
                  fontSize: 9,
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
          SizedBox(height: Responsive.isWeb(context) ? 20 : 15),
          Text(
            'Confirme su Contraseña',
            style: GoogleFonts.inter(
              fontSize: Responsive.isWeb(context) ? 16 : 14,
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
              errorText: null,
              errorStyle: GoogleFonts.inter(
                fontSize: 10,
                color: Colors.red,
              ),
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordConfirmVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.grey,
                  size: 20,
                ),
                onPressed: () {
                  ref.read(isPasswordConfirmVisibleProvider.notifier).state =
                      !isPasswordConfirmVisible;
                },
              ),
            ),
            style: GoogleFonts.inter(
              fontSize: 14,
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

          if (confirmPasswordError != null && confirmPassword.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 2),
              child: Text(
                confirmPasswordError,
                style: GoogleFonts.inter(
                  fontSize: 9,
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

          const SizedBox(height: 10),

          // Register button
          Center(
            child: InkWell(
              onTap: isFormValid ? () => _handleRegister(ref, context) : null,
              child: Container(
                width: 189,
                padding: const EdgeInsets.symmetric(vertical: 10),
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
                      fontSize: 16,
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

Future<void> _handleRegister(WidgetRef ref, BuildContext context) async {
  final name = ref.read(nameProvider);
  final email = ref.read(emailProvider);
  final password = ref.read(passwordProvider);
  final confirmPassword = ref.read(confirmPasswordProvider);

  // Example of showing a loading indicator and handling success/failure
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );

  try {
    if (password == confirmPassword) {
      await ref.read(authServiceProvider).signUp(email, password, name, 2);
      if (!context.mounted) return;
      context.pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registro exitoso'),
          backgroundColor: Colors.green,
        ),
      );
    }
    final user = ref.read(authProvider).value;
    if (user == null) {
      await ref.read(authServiceProvider).signIn(email, password);
      if (!context.mounted) return;
      context.go('/boda');
    }
  } catch (e) {
    if (context.mounted) context.pop();
    debugPrint(e.toString());
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
      );
    }
  }
}

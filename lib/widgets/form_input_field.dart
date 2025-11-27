import 'package:bodas/routes/linkspaper.dart';

class FormInputField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? icon;
  final double height;
  final bool multiline;
  final void Function(String)? cambio;

  const FormInputField({
    super.key,
    this.hintText,
    this.controller,
    this.cambio,
    this.height = 40,
    this.multiline = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: multiline ? null : 1,
        onChanged: cambio,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          border: InputBorder.none,
          suffixIcon: icon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

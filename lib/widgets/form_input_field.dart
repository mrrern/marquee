
import 'package:bodas/routes/linkspaper.dart';

class FormInputField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final double height;
  final bool multiline;
  final void Function(String)? cambio;

  const FormInputField({
    super.key,
    this.hintText,
    this.controller,
    this.cambio,
    this.height = 35,
    this.multiline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        controller: controller,
        
        maxLines: multiline ? null : 1,
        onChanged: cambio,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
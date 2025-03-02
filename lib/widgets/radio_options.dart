
import 'package:bodas/routes/linkspaper.dart';

class RadioOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const RadioOption({
    super.key,
    required this.label,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              height: 1,
            ),
          ),
          const SizedBox(width: 20),
          Container(
            width: 19,
            height: 17,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              shape: BoxShape.circle,
            ),
            child: isSelected
                ? Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
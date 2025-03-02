
import 'package:bodas/routes/linkspaper.dart';

class MusicSelection extends StatelessWidget {
  final String name;
  final VoidCallback? onSpotifyTap;
  final VoidCallback? onYoutubeTap;

  const MusicSelection({
    super.key,
    required this.name,
    this.onSpotifyTap,
    this.onYoutubeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            GestureDetector(
              onTap: onSpotifyTap,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  spotify,
                  width: 108,
                  height: 103,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              'o',
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF818181),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: onYoutubeTap,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  youtube,
                  width: 72,
                  height: 90,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
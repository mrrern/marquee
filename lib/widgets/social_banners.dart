import 'package:bodas/routes/linkspaper.dart';

class SocialBanners extends StatelessWidget {
  const SocialBanners({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final position = MediaQuery.of(context).size.height;
    final isWeb = Responsive.isWeb(context);
    return Padding(
      padding: EdgeInsets.all(8),
      child: SizedBox(
        width: isWeb ? size * .3 : size * .64,
        height: position * .13,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ItemSocialMedia(
              social: face,
              url: Uri.parse("https://www.facebook.com/MarqueeAudiovisuales"),
            ),
            ItemSocialMedia(
              social: insta,
              url: Uri.parse("https://www.instagram.com/marqueeaudiovisuales/"),
            ),
            ItemSocialMedia(
              social: tiktok,
              url: Uri.parse("https://www.tiktok.com/@marqueeaudiovisualesmlg"),
            ),
          ],
        ),
      ),
    );
  }
}

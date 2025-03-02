import 'package:bodas/routes/linkspaper.dart';
import 'package:flutter/material.dart';

//Images constants
const logo = "assets/logo.png";
const background = "assets/images/Perlin2.png";
const back2 = "assets/images/bck.png";

//sponsors
const bose = "assets/sponsors/marquee-audiovisuales-logotipo-bose.jpg";
const briteq = "assets/sponsors/marquee-audiovisuales-logotipo-briteq.jpg";
const christie = "assets/sponsors/marquee-audiovisuales-logotipo-christie.jpg";
const dbtechnologies =
    "assets/sponsors/marquee-audiovisuales-logotipo-dbtechnologies.jpg";
const model1 = "assets/sponsors/marquee-audiovisuales-logotipo-model1.jpg";
const panasonic =
    "assets/sponsors/marquee-audiovisuales-logotipo-panasonic.jpg";
const pioneerdj =
    "assets/sponsors/marquee-audiovisuales-logotipo-pioneerdj.jpg";
const sennheiser =
    "assets/sponsors/marquee-audiovisuales-logotipo-sennheiser.jpg";
const twaudio = "assets/sponsors/marquee-audiovisuales-logotipo-twaudio.jpg";
const spons = "assets/sponsors/spons.png";

//images
const img1 = 'assets/images/img1.png';
const img2 = 'assets/images/img2.png';
const img3 = 'assets/images/img3.png';

const bod1 = 'assets/images/bod1.png';
const bod2 = 'assets/images/bod2.png';
const bod3 = 'assets/images/bod3.png';
const bod4 = 'assets/images/bod4.png';

//social media
const insta = 'assets/images/inst.svg';
const face = 'assets/images/face.svg';
const tiktok = 'assets/images/tiktok.svg';
const youtube = 'assets/images/youtube.png';
const spotify = 'assets/images/spotify.png';

//carrousel
const frame2 = 'assets/images/frame2.png';
const frame1 = 'assets/images/frame1.png';

//images Carousel
const f1 = 'assets/images/f1.png';
const f2 = 'assets/images/f2.png';
const f3 = 'assets/images/f3.png';
const f4 = 'assets/images/f4.png';
const f5 = 'assets/images/f5.png';
const f6 = 'assets/images/f6.png';
const f7 = 'assets/images/f7.png';
const f8 = 'assets/images/f8.png';
const f9 = 'assets/images/f9.png';
const f10 = 'assets/images/f10.png';
const f11 = 'assets/images/f11.png';
const f12 = 'assets/images/f12.png';

//colors
const white = Colors.white70;
const black = Colors.black87;
const grey = Color(0x7A9E9E9E);

//Para depurar
const title1 = 'Alquiler de equipos audiovisuales para bodas';
const title2 = '¿Quiénes Somos?';
const title3 = "Bodas";
const title4 = "Lo que dicen de nosotros";
const title5 = "Conoce mas sobre nosotros";
const notFoundOpinions = "No se encontraron Opiniones";
const review =
    'En el día más importante de sus vidas, transformamos su boda mediante el diseño e instalación de equipos audiovisuales de alta calidad. Ofrecemos asesoría integral, planificación musical, así como la contratación de artistas, DJs, equipos de sonido, iluminación y escenarios que estén a la altura de tan importante celebración.';

//video
final video = "assets/video/1.mp4";

// Colors
class AppColors {
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const lightGrey = Color(0xFFECECEC);
  static const darkGrey = Color(0xFF363636);
  static const mediumGrey = Color(0xFFA1A1A1);
  static const textDarkGrey = Color(0xFF2A2A2A);
  static const textMediumGrey = Color(0xFF3F3F3F);
  static const buttonBackground = Color(0x94020000);

  // Text colors
  static const Color primaryText = Colors.black;
  static const Color secondaryText = Color(0xFF888888);
}

// Text Styles
class AppTextStyles {
  static const navLinkStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 0.6,
  );

  static const formLabelStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textMediumGrey,
  );

  static const buttonTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.lightGrey,
  );

  static const passwordHintStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static const footerTextStyle = TextStyle(
    fontFamily: 'Metrophobic',
    fontSize: 22,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.66,
    height: 2.0,
    color: AppColors.black,
  );
}

// Dimensions
class AppDimensions {
  static const double formWidth = 469;
  static const double logoWidth = 309;
  static const double buttonWidth = 189;
  static const double formPaddingHorizontal = 45;
  static const double formPaddingVertical = 22;
}

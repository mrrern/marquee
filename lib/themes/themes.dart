import 'package:bodas/routes/linkspaper.dart';



class Themes {
  static ThemeData buildCustomTheme() {
    final base = ThemeData.light();
    return base.copyWith(
      textTheme: _buildCustomTextTheme(base.textTheme),
      primaryColor: Colors.white,
      hoverColor: Colors.blueGrey,
      scaffoldBackgroundColor: Colors.white,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: const Color.fromARGB(255, 84, 95, 100),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  static TextTheme _buildCustomTextTheme(TextTheme base) {
    return base.copyWith(
      headlineMedium: GoogleFonts.inter(
        textStyle: base.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      headlineLarge: GoogleFonts.inter(
        textStyle: base.headlineLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      bodyMedium: GoogleFonts.inter(
        textStyle: base.bodyMedium?.copyWith(
          color: Colors.black,
        ),
      ),
      bodyLarge: GoogleFonts.inter(
        textStyle: base.bodyLarge?.copyWith(
          color: Colors.black,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MYTheme {
  static const Color primaryColor = Color(0xFFE2BE7F);
  static const Color secondryColor = Color(0xFF202020);
  static const Color thirdColor = Color(0xFFFFFFFF);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0x99202020),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.almarai(
          fontSize: 24.0, color: primaryColor, fontWeight: FontWeight.w700),
      titleMedium: GoogleFonts.almarai(
          fontSize: 20.0, color: primaryColor, fontWeight: FontWeight.w700),
      titleSmall: GoogleFonts.almarai(
          fontSize: 16.0, color: primaryColor, fontWeight: FontWeight.w700),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: primaryColor,
      ),
      centerTitle: true,
      backgroundColor: Color(0x99202020),
    ),
    dividerTheme: DividerThemeData(
      color: thirdColor,
      thickness: 2,
      indent: 43,
      endIndent: 43,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      selectedItemColor: thirdColor,
      unselectedItemColor: secondryColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedLabelStyle:
          GoogleFonts.almarai(fontSize: 12, fontWeight: FontWeight.w700),
      type: BottomNavigationBarType.fixed,
    ),
  );
  static ThemeData darkTheme = ThemeData();
}

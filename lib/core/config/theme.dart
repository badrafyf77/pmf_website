import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmf_website/core/utils/app_colors.dart';

class AppThemes {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    fontFamily: GoogleFonts.alegreya().fontFamily,
    colorScheme: const ColorScheme.light(
      primary: AppColors.kPrimaryColor,
      secondary: Color(0xFFD8E307),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0.0,
      toolbarHeight: 85,
    ),
  );
}

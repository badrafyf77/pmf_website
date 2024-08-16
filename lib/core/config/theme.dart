import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmf_website/core/utils/app_colors.dart';

class AppThemes {
  static final appTheme = ThemeData(
    primaryColor: AppColors.kPrimaryColor,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: GoogleFonts.akatab().fontFamily,
    colorScheme: ColorScheme.light(
      primary: AppColors.kPrimaryColor,
      secondary: AppColors.kSecondColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0.0,
      toolbarHeight: 100,
    ),
    
  );
}

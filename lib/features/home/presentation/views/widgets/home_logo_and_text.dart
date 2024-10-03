import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmf_website/core/utils/customs/logo.dart';
import 'package:pmf_website/core/utils/styles.dart';

class HomeLogoAndText extends StatelessWidget {
  const HomeLogoAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            const AppLogo(
              height: 300,
              width: 350,
            ),
            AutoSizeText(
              "PES MOROCCAN FAMILY",
              style: Styles.normal30.copyWith(
                fontFamily: GoogleFonts.aBeeZee().fontFamily,
              ),
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
            AutoSizeText(
              "The Best Clan in Morocco, Let The New Era Begin",
              style: Styles.normal30.copyWith(
                fontFamily: GoogleFonts.aBeeZee().fontFamily,
              ),
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

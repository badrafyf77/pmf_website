import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_images.dart';
import 'package:pmf_website/core/utils/helpers/is_mobile_checker.dart';
import 'package:pmf_website/core/utils/styles.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = isMobileChecker(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: isMobile ? 10 : MediaQuery.of(context).size.width * .15,
      ),
      child: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                "Here is our representatives in #FIFAWORLDCUP competition.\nBest of luck❤️",
                style: Styles.normal16,
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 8),
            Image.asset(AppAssets.post1),
          ],
        ),
      ),
    );
  }
}
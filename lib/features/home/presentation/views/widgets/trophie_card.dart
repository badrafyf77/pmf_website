import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/app_images.dart';
import 'package:pmf_website/core/utils/styles.dart';

class TrophieCard extends StatelessWidget {
  const TrophieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
        child: Container(
          height: 110,
          width: constraints.maxWidth,
          color: AppColors.kSecondColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppAssets.logo,
                      height: 80,
                      width: 80,
                    ),
                    Expanded(
                      child: AutoSizeText(
                        "Afyf Badreddine",
                        style: Styles.normal18
                            .copyWith(fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                    AutoSizeText(
                      "3",
                      style: Styles.normal22,
                    ),
                    const SizedBox(width: 5),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

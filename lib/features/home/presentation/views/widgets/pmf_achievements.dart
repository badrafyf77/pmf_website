import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_images.dart';
import 'package:pmf_website/core/utils/helpers/is_mobile_checker.dart';
import 'package:pmf_website/core/utils/styles.dart';

class PMFClanTrophies extends StatelessWidget {
  const PMFClanTrophies({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = isMobileChecker(context);
    return Center(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .05,
              ),
              child: AutoSizeText(
                "Our achievements",
                style: Styles.normal24,
                maxLines: 1,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal:
                    isMobile ? 10 : MediaQuery.of(context).size.width * .15),
            child: Image.asset(AppAssets.achievements),
          ),
        ],
      ),
    );
  }
}

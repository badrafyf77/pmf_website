import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_images.dart';
import 'package:pmf_website/core/utils/styles.dart';

class PMFClanTrophies extends StatelessWidget {
  const PMFClanTrophies({super.key});

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.all(10),
            child: Image.asset(AppAssets.background),
          ),
        ],
      ),
    );
  }
}
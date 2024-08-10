import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/styles.dart';

class LeaguePrizesMobile extends StatelessWidget {
  const LeaguePrizesMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "Prize",
          style: Styles.normal20.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        AutoSizeText(
          "1st place:",
          style: Styles.normal16.copyWith(
            color: Colors.grey,
          ),
        ),
        AutoSizeText(
          "150DH",
          style: Styles.normal16.copyWith(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        AutoSizeText(
          "2nd place:",
          style: Styles.normal16.copyWith(
            color: Colors.grey,
          ),
        ),
        AutoSizeText(
          "100DH",
          style: Styles.normal16.copyWith(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        AutoSizeText(
          "3th place:",
          style: Styles.normal16.copyWith(
            color: Colors.grey,
          ),
        ),
        AutoSizeText(
          "50DH",
          style: Styles.normal16.copyWith(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AutoSizeText(
              "Start:",
              style: Styles.normal16,
            ),
            const SizedBox(width: 6),
            AutoSizeText(
              "01/09/2024",
              style: Styles.normal16.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
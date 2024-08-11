import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/styles.dart';

class CupInfo extends StatelessWidget {
  const CupInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "World Cup",
          style: Styles.normal30.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        AutoSizeText(
          "32 players",
          style: Styles.normal16.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

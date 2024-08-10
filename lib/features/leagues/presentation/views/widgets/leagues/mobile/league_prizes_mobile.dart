import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/styles.dart';

class LeaguePrizesMobile extends StatelessWidget {
  const LeaguePrizesMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "Prize",
            style: Styles.normal20.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const PrizeItem(
            title: "1st place: 150Dh",
          ),
          const SizedBox(height: 2),
          const PrizeItem(
            title: "2nd place: 100Dh",
          ),
          const SizedBox(height: 2),
          const PrizeItem(
            title: "3th place: 50Dh",
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
      ),
    );
  }
}

class PrizeItem extends StatelessWidget {
  const PrizeItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Styles.normal16.copyWith(
        color: Colors.grey,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

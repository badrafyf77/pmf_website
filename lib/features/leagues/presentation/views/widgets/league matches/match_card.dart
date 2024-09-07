import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league%20matches/card_item.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
        child: Container(
          height: 80,
          width: constraints.maxWidth,
          color: AppColors.kSecondColor,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardItem(
                  playerName: "Afyf Badreddine",
                  goals: 3,
                  isWinner: true,
                ),
                CardItem(
                  playerName: "Younesse Lamtti",
                  goals: 0,
                  isWinner: false,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

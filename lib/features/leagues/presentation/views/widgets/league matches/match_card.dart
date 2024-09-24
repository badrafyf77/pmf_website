import 'package:flutter/material.dart';
import 'package:pmf_website/core/models/fixture_model.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league%20matches/card_item.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key, required this.fixture});

  final Fixture fixture;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
        child: Container(
          height: 80,
          width: constraints.maxWidth,
          color: AppColors.kSecondColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardItem(
                  playerName: fixture.homeName,
                  goals: fixture.homeGoals,
                  isWinner: fixture.homeGoals > fixture.awayGoals,
                  isDraw: fixture.homeGoals == fixture.awayGoals,
                ),
                CardItem(
                  playerName: fixture.awayName,
                  goals: fixture.awayGoals,
                  isWinner: fixture.awayGoals > fixture.homeGoals,
                  isDraw: fixture.awayGoals == fixture.homeGoals,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

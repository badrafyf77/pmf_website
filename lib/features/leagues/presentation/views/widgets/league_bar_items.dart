import 'package:flutter/material.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/horizontal_line.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league_bar_item.dart';

class LeagueBarItems extends StatelessWidget {
  const LeagueBarItems({
    super.key,
    required this.isTableSelected,
    required this.isMatchesSelected,
    required this.isPlayersSelected,
    required this.isStatsSelected,
  });

  final bool isTableSelected;
  final bool isMatchesSelected;
  final bool isPlayersSelected;
  final bool isStatsSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .05,
          ),
          child: Row(
            children: [
              LeagueBarItem(
                value: "Table",
                lineWidth: 52,
                onTap: () {
                  AppRouter.navigateTo(context, AppRouter.leagueTable);
                },
                isSelected: isTableSelected,
              ),
              const SizedBox(width: 10),
              LeagueBarItem(
                value: "Matches",
                lineWidth: 77,
                onTap: () {
                  AppRouter.navigateTo(context, AppRouter.leagueMatches);
                },
                isSelected: isMatchesSelected,
              ),
              const SizedBox(width: 10),
              LeagueBarItem(
                value: "Players",
                lineWidth: 75,
                onTap: () {
                  AppRouter.navigateTo(context, AppRouter.leagues);
                },
                isSelected: isPlayersSelected,
              ),
              const SizedBox(width: 10),
              LeagueBarItem(
                value: "Statestiques",
                lineWidth: 113,
                onTap: () {
                  AppRouter.navigateTo(context, AppRouter.leagues);
                },
                isSelected: isStatsSelected,
              ),
            ],
          ),
        ),
        HorizontalLine(
          height: .5,
          color: AppColors.kSecondColor,
        ),
      ],
    );
  }
}

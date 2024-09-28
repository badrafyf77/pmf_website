import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/button.dart';
import 'package:pmf_website/core/utils/styles.dart';
import 'package:pmf_website/features/leagues/data/models/league_model.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/leagues/desktop/league_info.dart';

class LeagueInfoMobile extends StatelessWidget {
  const LeagueInfoMobile({super.key, required this.league, required this.id});

  final String id;
  final League league;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            league.title,
            style: Styles.normal30.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          AutoSizeText(
            "${league.totalPlayers} players",
            style: Styles.normal16.copyWith(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          AutoSizeText(
            "Start:",
            style: Styles.normal16,
          ),
          const SizedBox(width: 6),
          AutoSizeText(
            DateFormat('yyyy-MM-dd').format(league.startDate.toDate()),
            style: Styles.normal14.copyWith(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 30),
          (league.currentRound == 0)
              ? const SoonText()
              : CustomButton(
                  onPressed: () {
                    AppRouter.navigateToWithTwoUrlParametres(context,
                        AppRouter.leagueTable, 'id', id, 'league', league.id);
                  },
                  textButton: "See more",
                  backgroundColor: AppColors.kPrimaryColor,
                  height: 35,
                  width: 120,
                )
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

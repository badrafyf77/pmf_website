import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pmf_website/core/utils/styles.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league_bar_items.dart';

class LeagueBar extends StatelessWidget {
  const LeagueBar({
    super.key,
    this.isTableSelected = false,
    this.isMatchesSelected = false,
    this.isPlayersSelected = false,
    this.isStatsSelected = false,
  });

  final bool isTableSelected;
  final bool isMatchesSelected;
  final bool isPlayersSelected;
  final bool isStatsSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .05,
              top: 10,
              bottom: 10),
          child: AutoSizeText(
            "PMF SERIE 1",
            style: Styles.normal30.copyWith(fontWeight: FontWeight.bold),
            maxLines: 1,
          ),
        ),
        const SizedBox(height: 15),
        LeagueBarItems(
          isTableSelected: isTableSelected,
          isMatchesSelected: isMatchesSelected,
          isPlayersSelected: isPlayersSelected,
          isStatsSelected: isStatsSelected,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

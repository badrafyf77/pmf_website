import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pmf_website/core/utils/customs/views_title.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league_bar_items.dart';

class LeagueBar extends StatelessWidget {
  const LeagueBar({
    super.key,
    this.isTableSelected = false,
    this.isMatchesSelected = false,
  });

  final bool isTableSelected;
  final bool isMatchesSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ViewsTitle(title: "PMF SERIE 1"),
        const SizedBox(height: 15),
        LeagueBarItems(
          isTableSelected: isTableSelected,
          isMatchesSelected: isMatchesSelected,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

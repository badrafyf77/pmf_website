import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league_bar.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league%20matches/league_matches.dart';

class LeagueMatchesBody extends StatelessWidget {
  const LeagueMatchesBody({
    super.key, required this.id, required this.leagueId,
  });

  final String id;
  final String leagueId;

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: [
        ColumnFadeInAnimation(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LeagueBar(
              id: id,
              leagueId: leagueId,
              isMatchesSelected: true,
            ),
            const LeagueMatches(),
            const SizedBox(height: 30),
            const AppFooter(),
          ],
        ),
      ],
    );
  }
}

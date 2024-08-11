import 'package:flutter/material.dart';
import 'package:pmf_website/core/models/player_model.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league_bar.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league%20table/table.dart';

class LeagueTableBody extends StatelessWidget {
  const LeagueTableBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: [
        ColumnFadeInAnimation(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LeagueBar(
              isTableSelected: true,
            ),
            StandingTable(
              playersList: List.from(leaguePlayers),
            ),
            const SizedBox(height: 30),
            const AppFooter(),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league_bar.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/table.dart';

class LeagueTableBody extends StatelessWidget {
  const LeagueTableBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomListView(
      children: [
        ColumnFadeInAnimation(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LeagueBar(
              isTableSelected: true,
            ),
            LeagueTable(),
          ],
        ),
      ],
    );
  }
}

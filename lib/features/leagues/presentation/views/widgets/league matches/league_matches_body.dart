import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/features/leagues/presentation/manager/cubit/leagues_cubit.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league_bar.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league%20matches/league_matches.dart';

class LeagueMatchesBody extends StatefulWidget {
  const LeagueMatchesBody({
    super.key, required this.id, required this.leagueId,
  });

  final String id;
  final String leagueId;

  @override
  State<LeagueMatchesBody> createState() => _LeagueMatchesBodyState();
}

class _LeagueMatchesBodyState extends State<LeagueMatchesBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LeaguesCubit>(context).getMatches(widget.leagueId);
  }
  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: [
        ColumnFadeInAnimation(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LeagueBar(
              id: widget.id,
              leagueId: widget.leagueId,
              isMatchesSelected: true,
            ),
            LeagueMatches(
              leagueId: widget.leagueId,
            ),
            const SizedBox(height: 30),
            const AppFooter(),
          ],
        ),
      ],
    );
  }
}

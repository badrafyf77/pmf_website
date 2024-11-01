import 'package:flutter/material.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league%20matches/league_matches_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class LeagueMatchesView extends StatelessWidget {
  const LeagueMatchesView({super.key, required this.leagueId});

  final String leagueId;

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isLeaguesSelected: true,
      desktopBody: LeagueMatchesBody(leagueId: leagueId),
      tabletBody: LeagueMatchesBody(leagueId: leagueId),
      mobileBody: LeagueMatchesBody(leagueId: leagueId),
    );
  }
}

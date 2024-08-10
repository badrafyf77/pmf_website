import 'package:flutter/material.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league%20matches/league_matches_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class LeagueMatchesView extends StatelessWidget {
  const LeagueMatchesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isLeaguesSelected: true,
      desktopBody: LeagueMatchesBody(),
      tabletBody: LeagueMatchesBody(),
      mobileBody: LeagueMatchesBody(),
    );
  }
}




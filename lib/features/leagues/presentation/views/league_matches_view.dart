import 'package:flutter/material.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league%20matches/league_matches_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class LeagueMatchesView extends StatelessWidget {
  const LeagueMatchesView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      id: id,
      isLeaguesSelected: true,
      desktopBody: LeagueMatchesBody(id: id),
      tabletBody: LeagueMatchesBody(id: id),
      mobileBody: LeagueMatchesBody(id: id),
    );
  }
}
